
class Arrows {

  float x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6;
  float c=255;
  boolean keypressed =false;
  Arrows(float x1_, float y1_, float x2_, float y2_, float x3_, float y3_, float x4_, float y4_, float x5_, float y5_, float x6_, float y6_) {
    x1= x1_;
    y1= y1_;
    x2=x2_;
    y2=y2_;
    x3= x3_;
    x4=x4_;
    y4= y4_;
    y3 = y3_;
    x5=x5_;
    x6=x6_;
    y5=y5_;
    y6=y6_;
  }


  
  void display( ) {
      noStroke();

      fill(#FFDB74, c);
      quad(x1, y1, x2, y2, x4, y4, x3, y3);
      quad(x3, y3, x4, y4, x6, y6, x5, y5);
    
  }

  void achange(float t){

          c=255*sin(t);



  }
}
