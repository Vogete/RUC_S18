import lejos.hardware.*;
import lejos.hardware.port.SensorPort;
import lejos.hardware.sensor.EV3IRSensor;
import lejos.robotics.SampleProvider;

public class TestIR{
  public static void main(String[] args){
    EV3IRSensor infraRed = new EV3IRSensor(SensorPort.S2);
    
    SampleProvider IRdistance = infraRed.getMode("Distance");
      Sound.setVolume(50);
      float [] sample = new float[IRdistance.sampleSize()] ;
   
      while(!Button.ESCAPE.isDown()){
      IRdistance.fetchSample(sample,0);
      int d = (int) sample[0];
      if(d<100) Sound.playTone(2000-d*20,200);
      Sound.pause(100);
      System.out.println("dist "+d); 
    }
      Sound.setVolume(10);
  }
}