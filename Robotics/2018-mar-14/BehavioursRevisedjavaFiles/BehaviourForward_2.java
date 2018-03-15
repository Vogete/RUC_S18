import lejos.robotics.RegulatedMotor;
import lejos.robotics.subsumption.Behavior;

// Modified version:
// - here adapted to fit better the informal spec's
//   by explicitly stopping the motors in suppress()

// Strange result: It works for a while, but many activations in a row
// of BehaviourAvoidObject may stress the system, so that
// the BehaviourForward_2 cannot be interrupted by the two other behaviours

public class BehaviourForward_2 implements Behavior {
	RegulatedMotor leftMotor;
	RegulatedMotor rightMotor;
	
	public BehaviourForward_2(RegulatedMotor left, RegulatedMotor right) {
		this.leftMotor = left; this.rightMotor = right;
	}
	
	public boolean takeControl() {
		return true;
	}

	public void action() {
		leftMotor.forward();
		rightMotor.forward();
	}

	public void suppress() {
	    leftMotor.stop(); 
		rightMotor.stop();
	}
}
