public class Renderer {
  public RenderOptions options;
  public Camera camera;
  public Scene scene;
  
  public Renderer() {}
  
  public Renderer(RenderOptions options, Camera camera, Scene scene) {
    this.options = options;
    this.camera = camera;
    this.scene = scene;
  }
  
  public PVector computeDirectIllumination(BSDF bsdf, ShaderGlobals shaderGlobals) {
  
  }
  
  public PVector computeIndirectIllumination(BSDF bsdf, ShaderGlobals shaderGlobals, int depth) {
    
  }
  
  public PVector trace(Ray ray, int depth){
    Intersection intersection = scene.intersects(ray);
    if (intersection.hit){
      return new PVector(1.0, 1.0, 1.0);
    }
    return new PVector(0, 0, 0);
  }
  
  public PImage render(){
  
  }
}
