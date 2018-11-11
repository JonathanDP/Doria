void setup() {  
  size(500, 500);
  //parametros: x, y, profundidade do raio (ignorar) , amostra do pixel (quadratica), shader (ignora), shader tmb(ignora), largura do filtro gaussiano, gamma
  RenderOptions options = new RenderOptions(500, 500, 1, 4, 4, 4, 2.0, 2.2, 0);
  
  Camera camera = new Camera(radians(45.0), new Film(options.width, options.height), new PMatrix3D());
  
  //Posição inicial da camera
  camera.lookAt(new PVector(0, 0, 10.0), new PVector(0, 0, 0), new PVector(0, 1.0, 0));
  
  Sphere sphere = new Sphere(new PVector(0, 0, 0), 2.0, null, false, null);
  
  ArrayList<Shape> shapes = new ArrayList();
  shapes.add(sphere);
  
  Scene scene = new Scene(shapes);
  
  Renderer renderer = new Renderer(options, camera, scene);
  
  image(renderer.render(), 0, 0);
  
  noLoop();//desabilita o draw
}

void draw() {

}
