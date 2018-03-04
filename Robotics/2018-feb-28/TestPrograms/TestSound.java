import lejos.hardware.Sound;

public class TestSound{
	
	public static void main(String[] args){
    Sound.beepSequence();
    Sound.setVolume(50);
    Sound.pause(1000);
    int[] scale ={440,494,523,587,659,698,783};
    for(int i=0;i<50;i++){
      Sound.playTone(scale[random(scale.length)],500);
      Sound.pause(300);     
    }
    Sound.setVolume(10); 
  }
  
	static int random(int x){
    return (int) (Math.random()*x);
  }
}
