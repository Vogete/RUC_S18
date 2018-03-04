import lejos.hardware.lcd.LCD;
import lejos.hardware.motor.Motor;
import lejos.utility.Delay;

public class Main {
	
	
	public static void main(String[] args) throws InterruptedException {
//		LCD.drawString("Kukucs! :) @->--", 0, 4);
//		Delay.msDelay(5000);
		TestMotor2();
	}
	
	
	public static void TestMotor2() {
	    Motor.A.setAcceleration(1000); 
	    Motor.B.setAcceleration(1000); 
	    Motor.A.setSpeed(180); 
	    Motor.B.setSpeed(180); 
	    Motor.A.backward();  
	    Motor.B.backward();
	    
	    try{Thread.sleep(1000);}catch(Exception e){}

	    Motor.A.stop();     
	    Motor.B.stop();
	    Motor.A.rotate(10); 
	    Motor.B.rotate(10);
	    try{Thread.sleep(1000);}catch(Exception e){}
	    
	    Motor.A.rotateTo(Motor.B.getTachoCount());		
	}
	  
	
	
}
