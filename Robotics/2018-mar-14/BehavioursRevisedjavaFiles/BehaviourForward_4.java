import lejos.robotics.RegulatedMotor;
import lejos.robotics.subsumption.Behavior;

// Modified version
// - as BehaviourForward_3 but using separate threads for each stopping of a motor
//   ... now they stop simultaneously

public class BehaviourForward_4 implements Behavior {
	RegulatedMotor leftMotor;
	RegulatedMotor rightMotor;
	
	public BehaviourForward_4(RegulatedMotor left, RegulatedMotor right) {
		this.leftMotor = left; this.rightMotor = right;
	}
	
	@Override
	public boolean takeControl() {
		return true;
	}
	
	private boolean suppressed = false;
	
	@Override
	public void action() {
		suppressed = false;
		leftMotor.forward();
		rightMotor.forward();
		while(!suppressed) Thread.yield();
		new Thread(new Runnable(){public void run() {rightMotor.stop();}});
		new Thread(new Runnable(){public void run() {leftMotor.stop();}});
		//leftMotor.stop();
	}
	@Override
	public void suppress() {
		suppressed=true;
	}

}
