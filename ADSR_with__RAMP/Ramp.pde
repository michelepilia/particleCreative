class Ramp {
  
  float rampValue;    // current ramp value -> che useremo per modulare i parametri grafici
  float rampStartMillis; // constructor init millisecond
  float rampDuration; // ramp duration in ms
  boolean run; // ramp trigger state
  int range; // -1 to 1 ( full ramp ) or 0 to 1 ( half ramp)
  int stepId; //0 -> attack, 1-> decay, 2 -> release
  String stepName;
  float startValue;
  float endValue;
  
  Ramp () { 
    rampDuration = 0;
    rampStartMillis = 0; 
    run = false;
    //rampValue = 0;
    range = 0;
    stepId =-1;
  } 

  Ramp (float duration, float startTime, int rampRange, int stepId, float startValue, float endValue) {
    rampDuration = duration; // durata della rampa
    rampStartMillis = startTime; // tempo di inizio
    run = true; 
    range = rampRange;  
    this.stepId = stepId;
    this.startValue = startValue;
    this.endValue = endValue;
    this.rampValue = startValue;
  }

  void trigger() {
    if ((int)rampValue == (int)endValue) { 
      run = false;
      endedRamp();
    }
    if (run) {
      rampValue =  lerp(startValue,endValue, constrain((millis()-rampStartMillis)/rampDuration, 0, 1)); 
      textSize(32);
      if(stepId==0) {
        stepName = "Attack";
      }
      else if(stepId==1) {
        stepName = "Decay";
      }
      else if (stepId ==2) {
        stepName = "Release";
      }
      text("Seconds: " + (int)((millis() - startingTime)/1000) +"\nADSR Step:" +stepName , 1920/3, 1080/3);
    }   
    else {
      //println("a");
    }  
  }
  
}
    
