class Match{
  PImage img;
  PVector loc;
  PVector vel;
  
  Match(){
    loc = new PVector(random(width),height-random(bk.height));
    vel = new PVector(random(-5,5),-random(10,20));
    img = loadImage("match.png");
    img.resize(0,height/15);
  }
  
  void display(){
    image(img,loc.x,loc.y);
  }
  
  void update(){
    if(loc.x > width)
      loc.x = 0;
    if(loc.x < 0)
      loc.x = width;
      
    vel.y += 0.2;
    loc.add(vel);
  }
}
