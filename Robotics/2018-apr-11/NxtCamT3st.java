import lejos.hardware.Button;
import lejos.hardware.device.NXTCam;
import lejos.hardware.port.SensorPort;
import lejos.robotics.geometry.Rectangle2D;

public class NxtCamT3st {
	
	final static int INTERVAL = 500; // milliseconds
	
	public static void main(String[] args) 
		throws Exception{
		
		NXTCam camera = new NXTCam(SensorPort.S1);
		
		System.out.println(camera.getProductID());
		// System.out.println(camera.getVersion());
		
		int numObjects;
		int counter = 0;
		
		camera.sendCommand('A'); // sort objects by size
		camera.sendCommand('E'); // start tracking
		
		int OBJ_Min = 6; // minimum size
		
		while (!Button.ESCAPE.isDown()){
			System.out.println(camera.getProductID());
			System.out.println(camera.getVersion());
			System.out.println("Objects: " + (numObjects = camera.getNumberOfObjects()));
			System.out.println("Counter = " + counter++);
			if (numObjects >= 1 && numObjects <= 8){
				Rectangle2D r = camera.getRectangle(0);
				if(r.getHeight() > OBJ_Min || r.getWidth() > OBJ_Min){
					System.out.println("X: " + r.getX());
					System.out.println("Y: " + r.getY());
					System.out.println("Ht: " + r.getHeight());
					System.out.println("Wd: " + r.getWidth());
					System.out.print(" ");
					;
					
					
				}
			}
			Thread.sleep(INTERVAL);
		}	
	}
}
