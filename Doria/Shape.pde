public abstract class Shape extends Light {
  public Boolean explicitLight;  
  public BSDF bsdf;
  public PMatrix3D worldMatrix;

  public Shape() {
  }

  public Shape(PMatrix3D worldMatrix, BSDF bsdf, Boolean explicitLight, PVector emission) {
    super(emission);
    this.explicitLight = explicitLight;
    this.bsdf = bsdf;
    this.worldMatrix = worldMatrix;
  }

  public abstract Intersection intersects(Ray ray);    
  public abstract ShaderGlobals calculateShaderGlobals(Ray ray, Intersection intersection);      
  public abstract float surfaceArea();

  public void transform(PMatrix3D transformation) {
    worldMatrix.preApply(transformation);
  }  
}
