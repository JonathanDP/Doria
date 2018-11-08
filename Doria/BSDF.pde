public abstract class BSDF {  
  public BSDF(){}
  
  public abstract PVector evaluate(ShaderGlobals shaderGlobals);    
  public abstract float pdf(ShaderGlobals shaderGlobals);    
  public abstract PVector sample(ShaderGlobals shaderGlobals, PVector sample);
}
