import lejos.robotics.RegulatedMotor;
import lejos.robotics.subsumption.Behavior;

// adapted from Bagnall p. 274
public class BehaviourAvoidObject implements Behavior {
	RegulatedMotor leftMotor;
	RegulatedMotor rightMotor;
	InfraredAdapter irAdapter;
    boolean backing_up=false;
	
	public BehaviourAvoidObject(RegulatedMotor left, RegulatedMotor right, InfraredAdapter irA) {
		this.leftMotor = left; this.rightMotor = right; this.irAdapter=irA;
	}

	public boolean takeControl() {
		return irAdapter.objectDistance < 25; // global variable
	}

	public void action() {
		backing_up=true;
		RegulatedMotor[] syncList = {leftMotor};
		rightMotor.synchronizeWith(syncList );
		rightMotor.startSynchronization();
		   leftMotor.rotate(-600);
		   rightMotor.rotate(-600);
		rightMotor.endSynchronization();
		rightMotor.startSynchronization();
		   leftMotor.rotate(450);
		   rightMotor.rotate(-450);
		rightMotor.endSynchronization();
		backing_up=false;
	}

	public void suppress() {
		// The following from the book looks weird; not in accordance with the specification
		while(backing_up) Thread.yield();
	}
	

}
