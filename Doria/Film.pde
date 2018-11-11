public class Film {
  private float width = 0;
  private float height = 0;

  public Film() {
  }

  public Film(float width, float height) {
    this.width = width;
    this.height = height;
  }

  public float aspectRatio() {
    float ratio = width / height;
    return ratio;
  }
  
  //corrigir a operação com parametros x e y do pixel
  public PVector normalizeSpace(float x, float y) {
    PVector norm = new PVector((x + 0.5)/width, (y + 0.5)/height);
    return norm;
  }

  public PVector screenSpace(float x, float y, float scale) {
    PVector vNorm = normalizeSpace(x, y);
    PVector scNorm = new PVector(2 * vNorm.x - 1, 1 - 2 * vNorm.y).mult(scale);
    PVector correct = new PVector(scNorm.x * aspectRatio(), scNorm.y, -1);
    return correct;
  }
}
