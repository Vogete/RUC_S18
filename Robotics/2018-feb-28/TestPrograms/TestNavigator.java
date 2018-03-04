
import lejos.hardware.Sound;
import lejos.hardware.motor.Motor;
import lejos.robotics.chassis.Chassis;
import lejos.robotics.chassis.Wheel;
import lejos.robotics.chassis.WheeledChassis;
import lejos.robotics.navigation.*;
public class TestNavigator{
  public static void main(String[] args){
    
	  
	  Wheel wheelL = WheeledChassis.modelWheel(Motor.A, 43.2).offset(-51);
	  Wheel wheelR = WheeledChassis.modelWheel(Motor.B, 43.2).offset(51);
	  
	  Chassis chassis = new WheeledChassis(new Wheel[] { wheelL, wheelR }, WheeledChassis.TYPE_DIFFERENTIAL);

	  MovePilot pilot = new MovePilot(chassis); 
	  
	  pilot.setAngularSpeed(450);// degree per sec
	  pilot.setLinearSpeed(40);  // mm per sec
    
	  Navigator robot = new Navigator(pilot);
	  
	  robot.goTo(100,100);
	  robot.goTo(0,0);
	  while(robot.isMoving()) Sound.pause(500);
	  robot.rotateTo(0);
}  }
