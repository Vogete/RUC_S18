import lejos.hardware.*;

public class TestButton{
  public static void main(String[] args){
    Button.waitForAnyPress();
    Sound.beep();
    while(!Button.ESCAPE.isDown()){
      if(Button.RIGHT.isDown())
		Sound.beepSequenceUp();  
      if(Button.LEFT.isDown())
		Sound.beepSequence();
      Sound.pause(300);  
    }
  }
}
