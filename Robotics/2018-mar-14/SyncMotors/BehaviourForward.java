import lejos.robotics.RegulatedMotor;
import lejos.robotics.subsumption.Behavior;

// Modified version
// use synchronization to have motors work more symetrically

public class BehaviourForward implements Behavior {
	RegulatedMotor leftMotor;
	RegulatedMotor rightMotor;
	
	public BehaviourForward(RegulatedMotor left, RegulatedMotor right) {
		this.leftMotor = left; this.rightMotor = right;
	}
	
	public boolean takeControl() {
		return true;
	}
	
	private boolean suppressed = false;
	
	public void action() {
		suppressed = false;
		// NEW STUFF: synchronizing motors (apoligize Java syntax)
		RegulatedMotor[] syncList = {leftMotor};
		rightMotor.synchronizeWith(syncList );
		rightMotor.startSynchronization();
		  leftMotor.forward();
		  rightMotor.forward();
		rightMotor.endSynchronization();
		while(!suppressed) Thread.yield();
		rightMotor.startSynchronization();
		  leftMotor.stop();
		  rightMotor.stop();
		rightMotor.endSynchronization();
	}

	public void suppress() {
		suppressed=true;
	}

}
