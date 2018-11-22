public class Diffuse extends BSDF{  
  public PVector albedo;
  
  public Diffuse(){}  
  public Diffuse(PVector albedo){
    this.albedo = albedo;
  }
  
  public PVector evaluate(ShaderGlobals shaderGlobals){
    return PVector.mult(albedo, INVERSE_PI);
  }
  public float pdf(ShaderGlobals shaderGlobals){
    return 0;
  }
  public PVector sample(ShaderGlobals shaderGlobals, PVector sample){
    return null;
  }
}
