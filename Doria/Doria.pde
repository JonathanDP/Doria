void setup() {  
  size(500, 500);
  //parametros: x, y, profundidade do raio (ignorar) , amostra do pixel (quadratica), shader (ignora), shader tmb(ignora), largura do filtro gaussiano, gamma
  RenderOptions options = new RenderOptions(500, 500, 1, 4, 4, 4, 2.0, 2.2, 0);
  
  Camera camera = new Camera(radians(20.0), new Film(options.width, options.height), new PMatrix3D());
  
  //Posição inicial da camera
  camera.lookAt(new PVector(0, 0, 35.0), new PVector(0, 0, 0), new PVector(0, 1.0, 0));
  
  Sphere left = new Sphere(new PVector(-1e5 - 5, 0, 0), 1e5, null, false, null);
  Sphere right = new Sphere(new PVector(1e5 + 5, 0, 0), 1e5, null, false, null);
  Sphere bottom = new Sphere(new PVector(0, -1e5 - 5, 0), 1e5, null, false, null);
  Sphere top = new Sphere(new PVector(0, 1e5 + 5, 0), 1e5, null, false, null);
  Sphere back = new Sphere(new PVector(0, 0, -1e5 - 5), 1e5, null, false, null);
  Sphere frontBall = new Sphere(new PVector(2.0, -3.0, 2.0), 2.0, null, false, null);
  Sphere backBall = new Sphere(new PVector(-2.0, -3.0, -2.0), 1.5, null, false, null);
  Sphere lightBall = new Sphere(new PVector(0, 3.0, 0), 1.5, null, true, new PVector(1.0, 1.0, 1.0));
  
  ArrayList<Shape> shapes = new ArrayList();
  shapes.add(left);
  shapes.add(right);
  shapes.add(bottom);
  shapes.add(top);
  shapes.add(back);
  shapes.add(frontBall);
  shapes.add(backBall);
  shapes.add(lightBall);
  
  Scene scene = new Scene(shapes);
  
  Renderer renderer = new Renderer(options, camera, scene);
  
  image(renderer.render(), 0, 0);
  
  noLoop();//desabilita o draw
}

void draw() {
  
}
