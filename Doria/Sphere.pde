public class Sphere extends Shape {
  public PVector position;
  public float radius;

  public Sphere() {
  }    
  public Sphere(PVector position, float radius, BSDF bsdf, boolean explicitLight, PVector emission) {
    super(null, bsdf, explicitLight, emission);
    this.position = position;
    this.radius = radius;
  }    

  @Override
    public Intersection intersects(Ray ray) {
    PVector d = PVector.sub(position, ray.origin);
    float t = d.dot(ray.direction); 

    if (t < 0)
      return new Intersection();

    float d2 = d.dot(d) - t * t;
    float r2 = radius * radius;

    if (d2 > r2)
      return new Intersection();

    float dt = sqrt(r2 - d2);

    return new Intersection(true, t - dt, -1);
  }

  @Override
    public ShaderGlobals calculateShaderGlobals(Ray ray, Intersection intersection) {
    PVector point = ray.point(intersection.distance);
    PVector normal = PVector.sub(point, position).normalize();

    float theta = atan2(normal.x, normal.z); //teta entre eixo X e o vetor normal
    float phi = acos(normal.y);              //o outro simbolo locura la de ângulo entre a normal e eixo Y

    PVector uv = new PVector((theta * INVERSE_PI + 1.0) * 0.5, phi * INVERSE_PI);

    float st = sin(theta);
    float sp = sin(phi);
    float ct = cos(theta);
    float cp = cos(phi);

    PVector tangentU = new PVector(ct, 0, -st);
    PVector tangentV = new PVector(st * cp, -sp, ct * cp);

    PVector viewDirection = PVector.mult(ray.direction, -1.0);

    return new ShaderGlobals(point, normal, uv, tangentU, tangentV, viewDirection, null, null, null);
  }

  @Override
  public float surfaceArea() {
    return 4.0 * PI * radius * radius;
  }
  
  @Override
  public PVector evaluate(ShaderGlobals shaderGlobals) {
    return null;
  }
  
  @Override
  public float pdf(ShaderGlobals shaderGlobals) {
    return 0;
  }
  
  @Override
  public PVector sample(ShaderGlobals shaderGlobals, PVector sample) {
    return null;
  }
  //dividir por pi, somar um e dividir por 2 (mapear o valor de -pi a pi pra deixar o valor entre 0 e 1)
}
