class Animation {
  PImage[] images;
  int imageCount;
  int frame1, frame2;
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + i + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display1(float xpos, float ypos, int a, int b ) {
    
    frame1 = (frame1+1)%imageCount;
    println(frame1);
    //if (frame<imageCount-1) {

    //  frame = frame+1;
    //} else {
    //  frame =1;
    //}

    //println(frame);


 

    image(images[frame1], xpos, ypos);
  }

  //void display2(float xpos, float ypos, int a, int b ) {

  //  frame2 = (frame2+1)%imageCount;
  //  println(frame2);
  //  //if (frame<imageCount-1) {

  //  //  frame = frame+1;
  //  //} else {
  //  //  frame =1;
  //  //}

  //  //println(frame);

  //  images[frame2].resize(a, b);

  //  image(images[frame2], xpos, ypos);
  //}

  int getWidth() {
    return images[0].width;
  }
}
