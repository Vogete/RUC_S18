import lejos.hardware.*;
import lejos.hardware.port.SensorPort;
import lejos.hardware.sensor.EV3IRSensor;
import lejos.robotics.SampleProvider;

public class Thread1{
  public static void main(String[] args){
	  IRObjectCounterThread th = new IRObjectCounterThread();
	  th.start();
      while(!Button.ESCAPE.isDown()){
    	  try { Thread.sleep(100);} catch (InterruptedException e) {
			    e.printStackTrace();}
      }
   }
  
  public static class IRObjectCounterThread extends Thread {
	  //the following copy-pasted from the TestIR program
	  EV3IRSensor infraRed;
	  SampleProvider infraRedDistanceProvider;

	  public IRObjectCounterThread(){
		    infraRed = new EV3IRSensor(SensorPort.S2);		    
		    infraRedDistanceProvider = infraRed.getMode("Distance");
		    this.setDaemon(true); // Without this, the program won't stop
	  }

	  public void run() {
		  while(true){
			  Sound.pause(50); // needs no try-catch as do sleep
		      float [] sample = new float[infraRedDistanceProvider.sampleSize()] ;
		      infraRedDistanceProvider.fetchSample(sample,0);
		      int d = (int) sample[0];
		      if(d<100) Sound.playTone(2000-d*20,200);
		  }
	  }
	  
   }
 }
