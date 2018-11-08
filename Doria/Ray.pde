public class Ray {

  public PVector origin;
  public PVector direction;

  public Ray() {
  }

  public Ray(PVector origin, PVector direction) {
    this.origin = origin;
    this.direction = direction;
  }

  public PVector point(float distance) {
    return PVector.add(origin, PVector.mult(direction, distance));
  }
}
