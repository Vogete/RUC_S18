package pcClient;

import java.io.IOException;
import java.net.UnknownHostException;

public class Main {
	
	public static void main(String[] args) throws UnknownHostException, IOException {
	    GreetClient client = new GreetClient();
	    client.startConnection("192.168.43.40", 7360);
	    String response = client.sendMessage("move");
	    System.out.println(response);
	}	
}
