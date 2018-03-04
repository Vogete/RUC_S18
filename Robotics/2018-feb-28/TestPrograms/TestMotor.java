import lejos.hardware.motor.Motor;

public class TestMotor{
    public static void main(String[] args){    
      Motor.A.setSpeed(360);
      Motor.B.setSpeed(360);
      Motor.A.forward();
      Motor.B.forward();
      try{Thread.sleep(1000);}catch(Exception e){}
      Motor.B.stop();
      Motor.A.stop();
    }
  }
