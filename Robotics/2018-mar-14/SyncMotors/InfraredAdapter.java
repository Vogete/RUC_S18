import lejos.hardware.port.SensorPort;
import lejos.hardware.sensor.EV3IRSensor;
import lejos.robotics.SampleProvider;

// adapted from Bagnall p. 275-276; this is an example of a high-level sensor, cf. course note
public class InfraredAdapter extends Thread {
    int objectDistance = 1000;
	EV3IRSensor irSensor = new EV3IRSensor(SensorPort.S2);
	SampleProvider sp = irSensor.getDistanceMode();
	
	public InfraredAdapter() {this.setDaemon(true);this.start();}
	
	public void run() {
		while(true) {
			float [] sample = new float[sp.sampleSize()];
			sp.fetchSample(sample, 0);
			if((int)sample[0]==0) objectDistance=1000;
			else objectDistance=(int)sample[0];
			//try {
			//	Thread.sleep(10);
			//} catch (InterruptedException e) {
			//	// TODO Auto-generated catch block
			//	e.printStackTrace();
			//}
			Thread.yield();
		}
	}
	
	public int getObjectDistance() {return objectDistance;}

}
