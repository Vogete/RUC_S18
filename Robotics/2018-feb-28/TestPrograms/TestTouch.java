import lejos.hardware.Button;
import lejos.hardware.Sound;
import lejos.hardware.port.SensorPort;
import lejos.hardware.sensor.EV3TouchSensor;
import lejos.robotics.SampleProvider;

public class TestTouch{
  public static void main(String[] args){
	
	EV3TouchSensor touch = new EV3TouchSensor(SensorPort.S1);	    
	SampleProvider touched = touch.getTouchMode();
	float[] sample = new float[touched.sampleSize()];
	
    Sound.setVolume(50);
    
    while(!Button.ESCAPE.isDown()){
    
    	touched.fetchSample(sample,0);
    	int t = (int) sample[0];    	
    	if(t == 1)Sound.beep();
    	Sound.pause(300);  
    }
    Sound.setVolume(10);
  }
}

 	

