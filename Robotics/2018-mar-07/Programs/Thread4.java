import lejos.hardware.*;
import lejos.hardware.port.SensorPort;
import lejos.hardware.sensor.EV3IRSensor;
import lejos.hardware.sensor.EV3TouchSensor;
import lejos.robotics.SampleProvider;

public class Thread4{
  public static void main(String[] args){
	  startDaemons();
      while(!Button.ESCAPE.isDown()){
    	  try { Thread.sleep(100);} catch (InterruptedException e) {
			e.printStackTrace();}
      }
   }
  
  // A variable shared among different threads
  public static volatile int count=0;
  //the following looks really weird; necessary since count is not an object!!
  public static Object countLockObject = new Object();


  
  public static class IRObjectBeeperThread extends Thread {
	  EV3IRSensor infraRed;
	  SampleProvider infraRedDistanceProvider;

	  public IRObjectBeeperThread(){
		    infraRed = new EV3IRSensor(SensorPort.S2);		    
		    infraRedDistanceProvider = infraRed.getMode("Distance");
		    this.setDaemon(true);
	  }
	  public void run() {
		  while(true){
			  Sound.pause(50); // needs no try-catch as do sleep
		      float [] sample = new float[infraRedDistanceProvider.sampleSize()] ;
		      infraRedDistanceProvider.fetchSample(sample,0);
		      int d = (int) sample[0];
		      if(d<100) {Sound.playTone(2000-d*20,200);
		                 // synchronization is probably not needed,
		                 // but who will trust "probably"
		                 synchronized(countLockObject){count++;}}
		  }
	  }
	  
   }
  
  public static class TouchBeeperThread extends Thread {
		EV3TouchSensor touch;	    
		SampleProvider touchProvider;
		
		public TouchBeeperThread() {
			touch = new EV3TouchSensor(SensorPort.S1);		    
			touchProvider = touch.getTouchMode();
		    this.setDaemon(true);		
		}
		public void run() {
     	  while(true){
			 Sound.pause(50);
			 float [] sample = new float[touchProvider.sampleSize()] ;
			 touchProvider.fetchSample(sample,0);
			 int yesNo = (int) sample[0];
			  if(yesNo>0.5) {Sound.playTone(2000,400);
			                 synchronized(countLockObject){count++;}}
			  }
     	  }
  }
 
  public static class PrintNumberOfBeepsNowAndThen extends Thread {
	  public PrintNumberOfBeepsNowAndThen() {
		  this.setDaemon(true);
	  }
	 public void run() {
	    while(true){
	      try { Thread.sleep(5000);} catch (InterruptedException e) {e.printStackTrace();}
	      System.out.println("Number of beeps: "+count);
	    	  
	      }
	    }
  }
 
  public static void startDaemons() {
	  IRObjectBeeperThread th1 = new IRObjectBeeperThread();
	  TouchBeeperThread th2 = new TouchBeeperThread();
	  PrintNumberOfBeepsNowAndThen th3 = new PrintNumberOfBeepsNowAndThen();
	  th1.start();
	  th2.start();
	  th3.start();
    }
 }
