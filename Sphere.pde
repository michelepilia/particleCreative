/*Graphical representation of the Note class. 
 It's like the View class... Contains Whatever is needed to represent graphically the notes*/

class Sphere {

  private PVector position;
  private float alfa = 0.0;
  ParticleSystem ps;

  Sphere(float x, float y, float z) {
    this.position = new PVector(x, y, z);
  }

  //This function computes the graphical result, considering all the parameters (lfo, cutoff, pitch bend etc...)
  public void drawSphere(float rampValue, float filterRampValue, float velocity) {

    float positionY = (this.position.y - pitchBend) + modulation * sin(alfa);
    float positionX = this.position.x;
    float positionZ = this.position.z * ((rampValue/2));
    float radius;
    float stretchingScale; // pitchbend
    filterRampValueBackground = filterRampValue;

    stretchingScale = map(abs(pitchBend), 0, 64, 1, 2 );

    if (EGInt < 8 && EGInt > -6) { // se EGInt è nel range dello 0%  
      radius = map(cutOffFilter, 0.1, 255, 5, 45);
    } else {
      radius = map(filterRampValue, 0, 255, 5, 45);
    }

    noStroke();
    fill(255, 255, 255, rampValue);  
    this.lfoEffect();

    //float radius = map(filterRampValue, 0, 255, 5, 45);

    pushMatrix();
    translate(positionX, positionY, positionZ);

    if (pitchBend >=0 ) {
      scale(1, stretchingScale, 1);
    } else {
      scale(stretchingScale, 1, 1);
    }
 
    sphere(radius); //Antonino non sa cosa vuol dire questa riga, ma il resto si
    
    popMatrix();
  }

  private void lfoEffect() {
    alfa += 0.1 * modulationRate;
  }

  void setPosition(float x, float y, float z) {
    this.position.x = x;
    this.position.y = y;
    this.position.z = z;
  }
}
