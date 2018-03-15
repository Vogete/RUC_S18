import lejos.hardware.*;
import lejos.robotics.RegulatedMotor;
import lejos.robotics.chassis.Chassis;
import lejos.robotics.chassis.Wheel;
import lejos.robotics.chassis.WheeledChassis;
import lejos.utility.Delay;
import lejos.hardware.motor.EV3MediumRegulatedMotor;
import lejos.hardware.motor.Motor;
import lejos.hardware.motor.NXTRegulatedMotor;
import lejos.internal.ev3.EV3MotorPort;

public class Program {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Motor.A.setAcceleration(3000);
		Motor.B.setAcceleration(3000);
		
		MotorSyncTest();
		try { Thread.sleep(2000); } catch(Exception e) {}
		
		MotorTrueTest();
	}
	
	static void MotorSyncTest() {
		RegulatedMotor leftMotor = Motor.A;
		RegulatedMotor rightMotor = Motor.B;
		
		RegulatedMotor[] syncList = {leftMotor};
		rightMotor.synchronizeWith(syncList);
				
		rightMotor.startSynchronization();
		leftMotor.forward();
		rightMotor.forward();
		rightMotor.endSynchronization();
		try { Thread.sleep(2000); } catch(Exception e) {}
		
	}
	
	static void MotorTrueTest() {
				
		Motor.A.rotateTo(720, true);
		Motor.B.rotateTo(720, true);
		
		while(Motor.A.isMoving()) Thread.yield();
		
	}
	

}
