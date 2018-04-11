import lejos.hardware.Button;
import lejos.hardware.Sound;
import lejos.hardware.device.NXTCam;
import lejos.hardware.port.SensorPort;
import lejos.robotics.geometry.Rectangle2D;

public class colorBeep {

  final static int INTERVAL = 500; // milliseconds

  public static void main(String[] args) 
  throws Exception{

    NXTCam camera = new NXTCam(SensorPort.S1);
    camera.sortBy(NXTCam.SIZE);
    camera.enableTracking(true);

    while (!Button.ESCAPE.isDown()){
      int n = camera.getNumberOfObjects();
      if(n>0) {
        Rectangle2D r = camera.getRectangle(0);
        int size = ((int)(r.getHeight())) * ((int)r.getWidth());
        int vol = size/88/144*100;
        int freq;
        if(camera.getObjectColor(0)==0) freq=1000; //blue  
        else freq=500; // red
        Sound.playTone(freq,INTERVAL,vol); }
      else Thread.sleep(INTERVAL);
    }
  }
}