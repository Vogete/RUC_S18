import lejos.hardware.motor.Motor;

public class TestMotor2{
  public static void main(String[] args){
    Motor.A.setAcceleration(1000); 
    Motor.B.setAcceleration(1000); 
    Motor.A.setSpeed(180); 
    Motor.B.setSpeed(180); 
    Motor.A.forward();  
    Motor.B.forward();
    try{Thread.sleep(1000);}catch(Exception e){}
    Motor.A.stop();     
    Motor.B.stop();
    Motor.A.rotate(10); 
    Motor.B.rotate(10);
    try{Thread.sleep(1000);}catch(Exception e){}
    Motor.A.rotateTo(Motor.B.getTachoCount());
 }
}
