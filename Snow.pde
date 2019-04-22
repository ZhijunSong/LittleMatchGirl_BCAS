class Snow {
  PVector loc;
  PVector vel;
  float dia;
  float g = 0.02;
  int minFlakeSize = 1;
  int maxFlakeSize = 8;
  float flake;
  PImage img;

  Snow() {
    //loc = new PVector(random(-width/2,width/2),random(-height/2,height/2),random(-height/2,height/2));
    loc = new PVector(random(width), random(height), random(height));
    vel = new PVector(0, random(0.5, 2), 0);
    dia = random(height/800.0, height/400.0);
    flake = random(minFlakeSize, maxFlakeSize);
    if (random(1) < 0.5)
      flake *= -1;
    if(random(1) < giftPercent){
      img = loadImage((int(random(100))+1)+".png");
    }else{
      img = null;
    }
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    fill(255, map(loc.z, 0, height, 150, 255));
    noStroke();
    if (img != null) {
      image(img,0,0);
    } else {
      if (sphereMode)
        sphere(dia);
      else
        ellipse(0, 0, dia, dia);
    }
    popMatrix();
  }

  void applyForce(PVector t) {
    vel.add(t);
  }

  void update() {
    if (loc.y > height) {
      loc = new PVector(random(width), random(height), random(height));
      vel = new PVector(0, random(0.5, 2), 0);
    }
    if (loc.x > width)
      loc.x = 0;
    if (loc.x < 0)
      loc.x = width;
    vel.x -= (vel.x)/30;
    loc.x += map(flake, minFlakeSize, maxFlakeSize, 0.05, 0.5);
    vel.y += g;
    loc.add(vel);
  }
}
