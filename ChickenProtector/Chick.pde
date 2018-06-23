class Chick{
  float x, y, dx, dy;
  PImage imgChick;
  int halfWidth = 40;
  int halfHeight = 45;
  
  Chick(){
    imgChick = loadImage("chick.png");
    x = 840;
    y = 562;
    do{
      dx = random(-5, +5);
      dy = random(-5, +5);
    } while (dx == 0 && dy == 0);
  }
  
  void drawChick(){
    image(imgChick, x, y);
  }
  
  void moveChick(){
    x += dx;
    y += dy;
    if (x <= halfWidth || x >= 850 + halfWidth) dx = -dx;
    if (y <= 400 + halfHeight || y >= height - halfHeight) dy = -dy;
  }
  
  boolean catchByEagle(Eagle eagle){
    return (abs(x - eagle.x) < 40) && (abs(y - eagle.y) < 45);
  }
}
    