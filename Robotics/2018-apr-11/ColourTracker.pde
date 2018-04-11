import processing.video.*;

int numPixels;
int[] theFrame;
Capture video;
int[] movementArray;

void setup() {
  size(640, 480, P2D); // Change size to 320 x 240 if too slow at 640 x 480
  video = new Capture(this, width, height);
  video.start();  
  numPixels = video.width * video.height;
  theFrame = new int[numPixels];
  loadPixels();
}

PVector center_of_mass(int [] a) {  // modify later
  int weightedX=0; int weightedY=0; int allMass=0;
  for (int y = 0; y < height; y++)
     for (int x = 0; x < width; x++) {
       weightedX+= x* ofTheRightColor(x,y,a);
       weightedY+= y* ofTheRightColor(x,y,a);
       allMass+= ofTheRightColor(x,y,a);}
   if(allMass< int(numPixels*0.005)) return new PVector(-100, -100); // hack: a point outside the screen
   return new PVector(weightedX/allMass, weightedY/allMass);
}


int ofTheRightColor(int x, int y, int[] a) {
    if(x<0||x>=width||y<0||y>=height) return 0;
    if(a[y*width + x]==color(0,0,0)) return 0; else return 1;
}

int ofTheRightColorAndSouroundedBySuch(int x, int y, int [] a) {
  if(ofTheRightColor(x,y,a)==0) return 0;
  int neighourColors = ofTheRightColor(x+1,y+1,a)
                     + ofTheRightColor(x-1,y+1,a)
                     + ofTheRightColor(x+1,y-1,a)
                     + ofTheRightColor(x-1,y-1,a)
                     + ofTheRightColor(x,y+1,a)
                     + ofTheRightColor(x,y-1,a)
                     + ofTheRightColor(x+1,y,a)
                     + ofTheRightColor(x-1,y,a);
  if(neighourColors>=8) return 1; else return 0;
}

void setPixel(int x, int y, int[] a, int val) {a[y*width + x]=val;}

int getPixel(int x, int y, int[] a) {return a[y*width + x];}

void draw() {
  if (video.available()) {
    video.read(); // Read the new frame from the camera
    video.loadPixels(); // Make its pixels[] array available
    
    // keep only the right color
    for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame...
      color currColor = video.pixels[i];
      int currR = (currColor >> 16) & 0xFF; // Like red(), but faster
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
      float hue = hue(currR, currG, currB);
      // remove all but yellow colour; pure yellow = 60;
      if(hue>45 && hue < 75) pixels[i]=color(255,255,0); else pixels[i]=color(0,0,0);
    }
    
    int [] pixelsClone;
    
    // filter isolated pixel islands
    for(int k=0;k<=3;k++) {
      pixelsClone = pixels.clone();
      for (int y = 0; y < height; y++) for (int x = 0; x < width; x++) //setPixel(x,y,pixels,getPixel(x,y,pixelsClone));
         if(ofTheRightColorAndSouroundedBySuch(x,y,pixelsClone)==0) setPixel(x,y,pixels,color(0,0,0));
    }

    // do this before mirroring!!!
    PVector p = center_of_mass(pixels);


    // mirror image:
    for (int y = 0; y < height; y++) for (int x = 0; x < width/2; x++) {
      color c = pixels[y*width+x]; pixels[y*width+x] = pixels[(y+1)*width-1 -x]; pixels[(y+1)*width-1 -x] = c;}
    updatePixels();
    println(center_of_mass(pixels));
    noFill(); stroke(color(255,0,0)); strokeWeight(5);
    // mirror point
    p.x = width-1-p.x;
    ellipse(p.x, p.y, 50,50); line(p.x-25,p.y,p.x+25,p.y); line(p.x,p.y-25,p.x,p.y+25);
  }
}

float hue(int r, int g, int b) {
 //make them between 0 and 1
 float rf =((float)r)/255; float gf = ((float)g)/255; float bf=((float)b)/255;
 float minRGB = Math.min(r,Math.min(g,b));
 float maxRGB = Math.max(r,Math.max(g,b));
 if(minRGB==maxRGB) return 0;
 float d = (r==minRGB) ? g-b : ((b==minRGB) ? r-g : b-r);
 float h = (r==minRGB) ? 3 : ((b==minRGB) ? 1 : 5);
 return 60*(h - d/(maxRGB - minRGB));
}