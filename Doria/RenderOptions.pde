public class RenderOptions {
  public int width;
  public int height;
  public int maximumDepth;
  public int cameraSamples;
  public int lightSamples;
  public int diffuseSamples;
  public float filterWidth;
  public float gamma;
  public float exposure;
  
  public RenderOptions(){}
  
  public RenderOptions(int width, int height, int maximumDepth, int cameraSamples, int lightSamples, int diffuseSamples, float filterWidth, float gamma, float exposure) {
    this.width = width;
    this.height = height;
    this.maximumDepth = maximumDepth;
    this.cameraSamples = cameraSamples;
    this.lightSamples = lightSamples;
    this.diffuseSamples = diffuseSamples;
    this.filterWidth = filterWidth;
    this.gamma = gamma;
    this.exposure = exposure;
  }
  
}
