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

	@Override
	public boolean takeControl() {
		return irAdapter.objectDistance < 25; // global variable
	}

	@Override
	public void action() {
		backing_up=true;
		leftMotor.rotate(-600,true); rightMotor.rotate(-600);
		leftMotor.rotate(450,true); rightMotor.rotate(-450);
		backing_up=false;
	}

	@Override
	public void suppress() {
		// The following from the book looks weird; not in accordance with the specification
		while(backing_up) Thread.yield();
	}
	

}
