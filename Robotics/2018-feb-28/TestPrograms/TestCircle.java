
import lejos.hardware.motor.Motor;
public class TestCircle{
  public static void main(String[] args){
    Motor.A.setSpeed(706); 
    Motor.B.setSpeed(527); 
    Motor.A.backward();  
    Motor.B.backward();
    try{Thread.sleep(10000);}catch(Exception e){}
    Motor.A.stop();     
    Motor.B.stop();
  }
}
