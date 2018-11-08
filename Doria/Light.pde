public abstract class Light {
  public PVector emission;

  public Light () {
  }

  public Light (PVector emission) {
    this.emission = emission;
  }

  public abstract PVector evaluate(ShaderGlobals shaderGlobals );
  public abstract float pdf(ShaderGlobals shaderGlobals);
  public abstract PVector sample(ShaderGlobals shaderGlobals, PVector sample);
}
