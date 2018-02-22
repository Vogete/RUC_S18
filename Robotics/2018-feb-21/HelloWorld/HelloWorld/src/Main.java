import lejos.hardware.Button;
import lejos.hardware.port.SensorPort;
import lejos.hardware.sensor.EV3TouchSensor;

import lejos.hardware.lcd.LCD;
import lejos.hardware.motor.Motor;
import lejos.robotics.RegulatedMotor;


public class Main {

	static EV3TouchSensor TouchSensor;
	static RegulatedMotor LeftMotor;
	
	public static void main(String[] args) throws InterruptedException {
		// All functions must be static, otherwise EV3 throws an error!
		
		InitialSetup();
	
		// Run the program until the escape button is pressed
	    while (!Button.ESCAPE.isDown()) {

	    	SensorTest(TouchSensor);
		    LCD.clear();
		    
	    	Thread.sleep(20);
	    }
	    
		// Delay.msDelay(3000);
	    
	    ExitProgram();
	}
	
	public static void SensorTest(EV3TouchSensor ts) {
	    
		int sampleSize = ts.sampleSize();
		float[] sample = new float[sampleSize];	    
		
		ts.fetchSample(sample, 0);
		
		if (sample[0] == 1 ) {
		    MotorTest(1);
		} else
		{
			MotorTest(0);
		}

	    LCD.drawString("TS: " + sample[0], 0, 0);
	    System.out.println("TS: " + sample[0]);		


	}
	
	public static void MotorTest(int StartStop) {

		if (StartStop == 1) {
			LeftMotor.forward();
		} else {
			LeftMotor.stop();
		}
		
	}
	
	public static void InitialSetup() {
		// All sensors should ONLY be opened once. If it's opened multiple times, it will crash!
		TouchSensor = new EV3TouchSensor(SensorPort.S1);
		LeftMotor = Motor.A;
		
		LeftMotor.setSpeed(720);
		LeftMotor.setAcceleration(6000);
		LeftMotor.resetTachoCount();
		LeftMotor.rotateTo(0);			
	}
	
	public static void HelloWorld() {
		LCD.drawString("Kukucs! :) @->--", 0, 4);
	}


	public static void ExitProgram() 
	{
		LCD.clear();
		System.out.println("EXIT");
		System.exit(0);
	}
	
}

