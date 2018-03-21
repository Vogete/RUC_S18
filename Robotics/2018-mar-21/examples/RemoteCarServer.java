import java.io.*;
import java.net.*;
import lejos.hardware.*;
import lejos.hardware.motor.*;
import lejos.hardware.port.*;

/**
 * Maximum LEGO EV3: Building Robots with Java Brains
 * ISBN-13: 9780986832291
 * Variant Press (C) 2014
 * Chapter 14 - Client-Server Robotics
 * Robot: Remote Control Car
 * Platform: LEGO EV3
 * @author Brian Bagnall
 * @version July 20, 2014
 */
public class RemoteCarServer extends Thread {

	public static final int port = 7360;
	private Socket client;
	private static boolean looping = true;
	private static ServerSocket server;
	private static EV3MediumRegulatedMotor A = new EV3MediumRegulatedMotor(MotorPort.A);
	private static EV3LargeRegulatedMotor B = new EV3LargeRegulatedMotor(MotorPort.B);
	private static EV3LargeRegulatedMotor C = new EV3LargeRegulatedMotor(MotorPort.C);
	
	public RemoteCarServer(Socket client) {
		this.client = client;
		Button.ESCAPE.addKeyListener(new EscapeListener());
	}
	
	public static void main(String[] args) throws IOException {
		server = new ServerSocket(port);
		while(looping) {
			System.out.println("Awaiting client..");
			new RemoteCarServer(server.accept()).start();
		}
	}
	
	public void carAction(int command) {
		switch(command) {
		case RemoteCarClient.BACKWARD:
			B.rotate(-360, true);
			C.rotate(-360);
			break;
		case RemoteCarClient.FORWARD:
			B.rotate(360, true);
			C.rotate(360);
			break;
		case RemoteCarClient.STRAIGHT:
			A.rotateTo(0);
			break;
		case RemoteCarClient.RIGHT:
			A.rotateTo(-170);
			break;
		case RemoteCarClient.LEFT:
			A.rotateTo(170);
			break;
		}
	}
	
	public void run() {
		System.out.println("CLIENT CONNECT");
		try {
			InputStream in = client.getInputStream();
			DataInputStream dIn = new DataInputStream(in);
			
			while(client != null) {
				int command = dIn.readInt();
				System.out.println("REC:" + command);
				if(command == RemoteCarClient.CLOSE) {
					client.close();
					client = null;
				} else {
					carAction(command);
				}
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private class EscapeListener implements KeyListener {
	
	public void keyPressed(Key k) {
		looping = false;
		System.exit(0);
	}

	public void keyReleased(Key k) {}
	}
}