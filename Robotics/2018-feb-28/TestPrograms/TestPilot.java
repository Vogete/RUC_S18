import lejos.hardware.motor.Motor;
import lejos.robotics.chassis.Chassis;
import lejos.robotics.chassis.Wheel;
import lejos.robotics.chassis.WheeledChassis;
import lejos.robotics.navigation.*;

public class TestPilot{
  public static void main(String[] args){
	  
	  Wheel wheelL = WheeledChassis.modelWheel(Motor.A, 43.2).offset(-51);
	  Wheel wheelR = WheeledChassis.modelWheel(Motor.B, 43.2).offset(51);
	  
	  Chassis chassis = new WheeledChassis(new Wheel[] { wheelL, wheelR }, WheeledChassis.TYPE_DIFFERENTIAL);

	  MovePilot pilot = new MovePilot(chassis);
	  
	  pilot.setAngularSpeed(45); 	// degrees per sec
	  pilot.setLinearSpeed(20); 	// cm per sec
	  pilot.travel(100);         	// cm
	  pilot.rotate(-30);        	// degree 
	  pilot.travel(-100);  			// move backward 
	  pilot.arc(100,40); 			// radius, degree
	  pilot.travel(-80);  			// move backward 
	  pilot.rotate(-13);        	// degree 
	  pilot.stop();      
  }
}
