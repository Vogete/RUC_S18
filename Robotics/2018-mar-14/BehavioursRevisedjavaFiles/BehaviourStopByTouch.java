import lejos.hardware.Button;
import lejos.hardware.Sound;
import lejos.hardware.port.SensorPort;
import lejos.hardware.sensor.EV3TouchSensor;
import lejos.robotics.SampleProvider;
import lejos.robotics.subsumption.Behavior;

public class BehaviourStopByTouch implements Behavior {
	EV3TouchSensor touch = new EV3TouchSensor(SensorPort.S1);	    
	SampleProvider touched = touch.getTouchMode();
	float[] sample = new float[touched.sampleSize()];

	@Override
	public boolean takeControl() {
    	touched.fetchSample(sample,0);
    	int t = (int) sample[0];    	
		return t==1 || Button.ESCAPE.isDown();
	}

	@Override
	public void action() { System.exit(1); }

	@Override
	public void suppress() {
		//Thread.yield(); //?????		
	}


}
