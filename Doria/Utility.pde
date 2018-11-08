public final float INVERSE_PI = 0.31830988618379067154;
public final float EPSILON = Float.MIN_VALUE;
public final float INFINITY = Float.MAX_VALUE;

PVector gamma(PVector colour, float value){
  float inverseGamma = 1 / value;
    
  return new PVector(pow(colour.x, inverseGamma),
                     pow(colour.y, inverseGamma),
                     pow(colour.z, inverseGamma));                  
}

PVector exposure(PVector color, float value){
  float power = pow(2,value);
    
  return new PVector(color.x * power,
                     color.y * power,
                     color.z * power);
}

PVector stratifiedSample(PVector cameraSamples){  
  //int size = sqrt(cameraSamples); //Acho que usa um BSDF
  /*Point points[samples]
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      Point offset(i, j)
      points[i * size + j] = (offset + uniform_random_2D()) / size
    }
  }  
  
  return points*/
  //implementar essa parte
}
