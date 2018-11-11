public final float INVERSE_PI = 0.31830988618379067154;
public final float EPSILON = Float.MIN_VALUE;
public final float INFINITY = Float.MAX_VALUE;

//ajuste de gama é pra arrumar a cor da imagem no monitor, deixando um ajuste negativo do monitor no codigo, pra quando for exibido a exibição ser linear (2.2)
PVector gamma(PVector colour, float value){
  float inverseGamma = 1 / value;
    
  return new PVector(pow(colour.x, inverseGamma),
                     pow(colour.y, inverseGamma),
                     pow(colour.z, inverseGamma));                  
}

PVector exposure(PVector colour, float value){
  float power = pow(2,value);
    
  return new PVector(colour.x * power,
                     colour.y * power,
                     colour.z * power);
}

//clamp
PVector saturate(PVector colour){
  PVector sat = new PVector(constrain(colour.x, 0, 1), 
                            constrain(colour.y, 0, 1), 
                            constrain(colour.z, 0, 1));
  return sat;
}

float uniformRandom1D(){
  return random(1.0);
}

PVector uniformRandom2D(){
  return new PVector(uniformRandom1D(), uniformRandom1D());
}

float gaussian1D(float sample, float width){
  float r = width * 0.5;
  float gauss = max(0, exp(-sample * sample) - exp(-r * r));
  return gauss;
}

float gaussian2D(PVector sample, float width){
  float gauss2 = gaussian1D(sample.x, width) * gaussian1D(sample.y, width);
  return gauss2;
}

ArrayList<PVector> stratifiedSample(int cameraSamples){ 
  ArrayList<PVector> points = new ArrayList(cameraSamples);
  int size = (int)sqrt(cameraSamples); 
  
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      PVector offset = new PVector(i, j);
      points.add(PVector.add(uniformRandom2D(), offset).div(size));
    }
  }
  
  return points;
}
