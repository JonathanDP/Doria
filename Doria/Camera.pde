public class Camera {
  public float fieldOfView;
  public PMatrix3D worldMatrix;
  public Film film;

  public Camera() {
  }

  public Camera(float fieldOfView, Film film, PMatrix3D worldMatrix) {
    this.fieldOfView = fieldOfView;
    this.film = film;
    this.worldMatrix = worldMatrix;
  }

  public void lookAt(PVector position, PVector target, PVector up) {
    //calc vector w
    float moduleP = sqrt(position.x*position.x + position.y*position.y + position.z*position.z);
    float moduleF = sqrt(target.x*target.x + target.y*target.y + target.z*target.z);
    float module = moduleP - moduleF;    
    //achar o vetor resultante antes de achar o modulo
    
    float x = (position.x - target.x)/(module);
    float y = (position.y - target.y)/(module);
    float z = (position.z - target.z)/(module);
    PVector w = new PVector(x, y, z);

    //calc u
    PVector cross = up.cross(w);
    float moduleUpW = sqrt(cross.x*cross.x + cross.y*cross.y + cross.z*cross.z);
    PVector u = cross.div(moduleUpW);

    PVector v= w.cross(u);
    
    worldMatrix.set(
      u.x, v.x, w.x, position.x,
      u.y, v.y, w.x, position.y,
      u.z, v.z, w.z, position.z,
      0, 0, 0, 1);
  }

  public void transform(PMatrix3D transformation) {
    worldMatrix.preApply(transformation);
  }

  public Ray generateRay(float x, float y, PVector sample) {
    float scale = tan(fieldOfView * 0.5);
    PVector pixel = new PVector();
    
    //subtrair o valor do pixel pela posição(origem da camera) -> (direção do raio)
    pixel.x = (2.0 * (x + 0.5 + sample.x) / film.width - 1.0) * scale * film.aspectRatio();
    pixel.y = (1.0 - 2.0 * (y + 0.5 + sample.y) / film.height) * scale;
    pixel.z = -1.0;    
        
    //procurar função de multiplicar matriz (PMatrix3d) (.mult)
    //multiplicar o pixel pela matriz
    worldMatrix.mult(pixel, pixel);//multiplicação escalar
        
    PVector origin = new PVector(worldMatrix.m03, worldMatrix.m13, worldMatrix.m23);//X, Y e Z da matriz
    PVector direction = PVector.sub(pixel, origin).normalize();//normalizar 

    return new Ray(origin, direction);
  }
}
