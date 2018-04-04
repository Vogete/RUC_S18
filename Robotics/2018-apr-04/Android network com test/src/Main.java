import java.io.*;
import java.net.*;
import lejos.hardware.*;
import lejos.hardware.motor.*;
import lejos.hardware.port.*;

public class Main extends Thread {

	public static final int port = 7360;
	private Socket client;
	private static boolean looping = true;
	private static ServerSocket server;
//	private static EV3MediumRegulatedMotor A = new EV3MediumRegulatedMotor(MotorPort.A);
//	private static EV3MediumRegulatedMotor B = new EV3MediumRegulatedMotor(MotorPort.B);	

	
	public static void main(String[] args) throws IOException, InterruptedException {

        GreetServer server=new GreetServer();
        while (true) {

        	String message = server.start(port);
        	
        	if (message.equals("move")) {
        	      Motor.A.setSpeed(360);
        	      Motor.B.setSpeed(360);

        	      Motor.A.forward();
        	      Motor.B.forward();
        	      
        	      try{Thread.sleep(1000);}catch(Exception e){}

        	      Motor.B.stop(true);
        	      Motor.A.stop(true);
        	}
			
		}
	}

}
