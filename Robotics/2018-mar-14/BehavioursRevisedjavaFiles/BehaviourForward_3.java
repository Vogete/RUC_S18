import lejos.robotics.RegulatedMotor;
import lejos.robotics.subsumption.Behavior;

// Modified version
// - now having the action() method to depend on a boolean flag, so that it
//   busy-waits until suppress is called, and that the motors are stopped within
//   action()
// - disadvantage: the two motors does not stop at the same time!!

public class BehaviourForward_3 implements Behavior {
	RegulatedMotor leftMotor;
	RegulatedMotor rightMotor;
	
	public BehaviourForward_3(RegulatedMotor left, RegulatedMotor right) {
		this.leftMotor = left; this.rightMotor = right;
	}
	
	public boolean takeControl() {
		return true;
	}
	
	private boolean suppressed = false;
	
	public void action() {
		suppressed = false;
		leftMotor.forward();
		rightMotor.forward();
		while(!suppressed) Thread.yield();
		leftMotor.stop();
		rightMotor.stop();
	}

	public void suppress() {
		suppressed=true;
	}

}
