import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.Socket;

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
public class RemoteCarClient extends Frame implements KeyListener{
  public static final int PORT = RemoteCarServer.port;
  public static final int CLOSE = 0;
  public static final int FORWARD = 87, // W = main up
  STRAIGHT = 83, // S = straight
  LEFT = 65, // A = left
  RIGHT = 68, // D = right
  BACKWARD = 88; // X = main down
  
  Button btnConnect;
  TextField txtIPAddress;
  TextArea messages;

  private Socket socket;
  private DataOutputStream outStream;
  
  public RemoteCarClient(String title, String ip) {
    super(title);
    this.setSize(400, 300);
    this.addWindowListener(new WindowAdapter() {
      public void windowClosing(WindowEvent e) {
        System.out.println("Ending Warbird Client");
        disconnect();
        System.exit(0);
      }
    });
    buildGUI(ip);
    this.setVisible(true);
    btnConnect.addKeyListener(this);
  }
  
  public static void main(String args[]) {
	  String ip = "10.0.1.1";
	  if(args.length > 0) ip = args[0]; 
	System.out.println("Starting R/C Client...");
    new RemoteCarClient("R/C Client", ip);
  }
  
  public void buildGUI(String ip) {
    Panel mainPanel = new Panel (new BorderLayout());
    ControlListener cl = new ControlListener();

    btnConnect = new Button("Connect");
    btnConnect.addActionListener(cl);
    
    txtIPAddress = new TextField(ip,16);
    
    messages = new TextArea("status: DISCONNECTED");
    messages.setEditable(false);

    Panel north = new Panel(new FlowLayout(FlowLayout.LEFT));
    north.add(btnConnect);
    north.add(txtIPAddress);
    
    Panel center = new Panel(new GridLayout(5,1));
    center.add(new Label("A-S-D to steer, W-X to move")); 
        
    Panel center4 = new Panel(new FlowLayout(FlowLayout.LEFT));
    center4.add(messages);

    center.add(center4);

    mainPanel.add(north, "North");
    mainPanel.add(center, "Center");
    this.add(mainPanel);
  }
  
  private void sendCommand(int command){
    // Send coordinates to Server:
    messages.setText("status: SENDING command.");
    try {
      outStream.writeInt(command);
    } catch(IOException io) {
      messages.setText("status: ERROR Problems occurred sending data.");
    }

    messages.setText("status: Command SENT.");
  } 
  
  /** A listener class for all the buttons of the GUI. */
  private class ControlListener implements ActionListener{
    public void actionPerformed(ActionEvent e) {
      String command = e.getActionCommand();
      if (command.equals("Connect")) {
        try {
          socket = new Socket(txtIPAddress.getText(), PORT);
          outStream = new DataOutputStream(socket.getOutputStream());
          messages.setText("status: CONNECTED");
          btnConnect.setLabel("Disconnect");
        } catch (Exception exc) {
          messages.setText("status: FAILURE Error establishing connection with server.");
          System.out.println("Error: " + exc);
        }
      }
      else if (command.equals("Disconnect")) {
        disconnect();
      } 
    }
  }

  public void disconnect() {
    try {
      sendCommand(CLOSE);
      socket.close();
      btnConnect.setLabel("Connect");
      messages.setText("status: DISCONNECTED");
    } catch (Exception exc) {
      messages.setText("status: FAILURE Error closing connection with server.");
      System.out.println("Error: " + exc);
    }
  }
  
  public void keyPressed(KeyEvent e) {
    sendCommand(e.getKeyCode());
    System.out.println("Pressed " + e.getKeyCode());
  }

  public void keyReleased(KeyEvent e) {}

  public void keyTyped(KeyEvent arg0) {}
}