//import ddf.minim.*;
////import codeanticode.syphon.*;

////SyphonServer server;
//Minim minim;
//AudioInput in;
boolean recording = false;
GOL gol;

PImage bk;

ArrayList<Match> matches = new ArrayList<Match>();

///processing sound library
import processing.sound.*;

AudioIn input;
Amplitude loudness;
///////////////////////////

boolean sphereMode = false;
Snow snow[] = new Snow[5000];
float maxSound = 0.05;
float n = 0;
float giftPercent = 0.05;
//////animation
Animation animation1;
///////arrow
PImage img;
int quantity=20 ;
float time = 0;
Arrows[] arrow= new Arrows[quantity];
boolean keyisPressed =false;
void setup() {
  size(displayWidth, displayHeight, P3D);
  smooth();
  imageMode(CENTER);
  gol = new GOL();

  //minim = new Minim(this);
  //in = minim.getLineIn();
  bk = loadImage("bk.png");
  bk.resize(width, 0);


  ///////////////////////sound inpout//////////////////////////

  Sound s = new Sound(this);
  //s.list();
  s.inputDevice(3);
  input = new AudioIn(this, 0);
  input.start();
  loudness = new Amplitude(this);

  loudness.input(input);


  ////////////////////////////////////////////////////////////////



  for (int i = 0; i < snow.length; i++) {
    snow[i] = new Snow();
  }
  animation1 = new Animation("l", 113);
  for (int i = 0; i<quantity-1; i++) {

    arrow[i]= new Arrows(150*i+80, height/4, 150*i+160, height/4, 150*i, height/2, 150*i+80, height/2, 150*i+80, height*3/4, 150*i+160, height*3/4);
  }
  img = loadImage("light.png");
  //server = new SyphonServer(this, "Processing Syphon");
}

void draw() {
  time++;

  background(#7B8F98);
  image(bk, width/2, height-bk.height/2);

  lights();
  fill(255);
  rectMode(CENTER);

  //if (keyisPressed==false) {
  //  rect(displayWidth/2, displayHeight*14/16, displayWidth, displayHeight*1/16);
  //  rect(displayWidth/2, displayHeight, displayWidth, displayHeight*4/16);
  //}
  float all=0;
  //////////////////////
  float inputLevel =  1.0;
  input.amp(inputLevel);

  all = loudness.analyze();


  float tn = constrain(map(all, 0, maxSound, snow.length*0.4, snow.length), 0, snow.length);
  n += (tn-n)/20;

  for (int i = 0; i < n; i++) {
    snow[i].display();
    snow[i].update();
    if (all>maxSound) {
      snow[i].applyForce(new PVector(-0.2, 0, 0));
    }
  } 
  if (all > maxSound&&matches.size()<10) {
    matches.add(new Match());
  }
  for (int i = matches.size()-1; i >= 0; i --) {
    Match m = matches.get(i);
    m.display();
    m.update();
    if (m.loc.y > height)
      matches.remove(i);
  }
  if (keyisPressed ==false) {
    if (all> maxSound) {
      animation1.display1(width/2, height*5/8, 432, 696);
    } else {
      image(img, width/2, height*5/8);
    }
  }

  //server.sendScreen();
  if (mousePressed == true) {

    if (key==' ') {
      keyisPressed=!keyisPressed;
    }
  }
  println(keyisPressed);
  if (keyisPressed == true) {
    //background(#7B8F98);
    for (int i =0; i<quantity-1; i++) {
      arrow[i].display();
      arrow[i].achange(time/20-50*i);
    }
  }
  if (recording==true) {
    saveFrame("output/gol_####.png");    
    //fill(255, 0, 0);
  }
  
  
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    recording = !recording;
  }
}
