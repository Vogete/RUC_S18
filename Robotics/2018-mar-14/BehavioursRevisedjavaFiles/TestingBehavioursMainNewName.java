import lejos.robotics.RegulatedMotor;
import lejos.robotics.subsumption.Arbitrator;
import lejos.robotics.subsumption.Behavior;
import lejos.hardware.motor.*;
import lejos.hardware.port.MotorPort;

public class TestingBehavioursMainNewName {
	//static Arbitrator arby;
	public static void main(String[] args) {
		RegulatedMotor leftMotor = new EV3LargeRegulatedMotor(MotorPort.B);
		RegulatedMotor rightMotor = new EV3LargeRegulatedMotor(MotorPort.A);
		Behavior b1 = new BehaviourForward(leftMotor,rightMotor);
		InfraredAdapter ir = new InfraredAdapter();
		Behavior b2 = new BehaviourAvoidObject(leftMotor,rightMotor,ir);
		Behavior b3 = new BehaviourStopByTouch();
		Behavior[] b1b2b3 = {b1,b2,b3};
		Arbitrator arby = new Arbitrator(b1b2b3);
		arby.go();
	}
	
}
