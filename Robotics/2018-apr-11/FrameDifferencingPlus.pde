/**
 * Frame Differencing 
 * by Golan Levin. 
 *
 * Quantify the amount of movement in the video frame using frame-differencing.
 */ 

// found at
// https://code.google.com/p/processing/source/browse/trunk/processing/java/libraries/video/examples/Capture/FrameDifferencing/FrameDifferencing.pde?r=9732
// 16 Oct, 2014

// modified by Henning Christiansen 17 oct 2014 for indication center of movement

import processing.video.*;

int numPixels;
int[] previousFrame;
Capture video;
int[] movementArray;

void setup() {
  size(640, 480, P2D); // Change size to 320 x 240 if too slow at 640 x 480
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height);
  video.start();  
  numPixels = video.width * video.height;
  // Create an array to store the previously captured frame
  previousFrame = new int[numPixels];
  movementArray = new int[numPixels];
  loadPixels();
}

PVector center_of_mass() {
  int weightedX=0; int weightedY=0; int allMass=0;
  for (int y = 0; y < video.height; y++)
     for (int x = 0; x < video.width; x++) {
       weightedX+= x* getMovement(x,y);
       weightedY+= y* getMovement(x,y);
       allMass+= getMovement(x,y);}
   if(allMass< int(numPixels*0.5)) return new PVector(-100, -100); // hack: a point outside the screen
   return new PVector(weightedX/allMass, weightedY/allMass);
}


int getMovement(int x, int y) {
  //println("x: "+x+" y: "+y+"index: " + (x*video.width + y));
    return movementArray[y*video.width + x];
}

void draw() {
  if (video.available()) {
    // When using video to manipulate the screen, use video.available() and
    // video.read() inside the draw() method so that it's safe to draw to the screen
    video.read(); // Read the new frame from the camera
    video.loadPixels(); // Make its pixels[] array available
    
    int movementSum = 0; // Amount of movement in the frame
    for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame...
      color currColor = video.pixels[i];
      color prevColor = previousFrame[i];
      // Extract the red, green, and blue components from current pixel
      int currR = (currColor >> 16) & 0xFF; // Like red(), but faster
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
      // Extract red, green, and blue components from previous pixel
      int prevR = (prevColor >> 16) & 0xFF;
      int prevG = (prevColor >> 8) & 0xFF;
      int prevB = prevColor & 0xFF;
      // Compute the difference of the red, green, and blue values
      int diffR = abs(currR - prevR);
      int diffG = abs(currG - prevG);
      int diffB = abs(currB - prevB);
      // Add these differences to the running tally
      movementSum += diffR + diffG + diffB;
      movementArray[i] = diffR + diffG + diffB; if(movementArray[i]<200)movementArray[i]=0;
      // Render the difference image to the screen
      pixels[i] = color(diffR, diffG, diffB);
      // The following line is much faster, but more confusing to read
      //pixels[i] = 0xff000000 | (diffR << 16) | (diffG << 8) | diffB;
      // Save the current color into the 'previous' buffer
      previousFrame[i] = currColor;
    }
    // To prevent flicker from frames that are all black (no movement),
    // only update the screen if the image has changed.
    if (movementSum > 0) {
      // mirror image:
      for (int y = 0; y < video.height; y++) for (int x = 0; x < video.width/2; x++) {
        color c = pixels[y*width+x]; pixels[y*width+x] = pixels[(y+1)*width-1 -x]; pixels[(y+1)*width-1 -x] = c;}
      updatePixels();
      //println(movementSum); // Print the total amount of movement to the console
      //println("video.width: "+video.width+" video.height: " + video.height +
      //" numPixels: "+numPixels );
      println(center_of_mass());
      noFill(); stroke(255); strokeWeight(5);
      PVector p = center_of_mass();
      // mirror point
      p.x = width-1-p.x;
      ellipse(p.x, p.y, 50,50); line(p.x-25,p.y,p.x+25,p.y); line(p.x,p.y-25,p.x,p.y+25);
    }
  }
}