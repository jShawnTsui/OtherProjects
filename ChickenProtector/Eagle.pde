class Eagle{
  float x, y, dx, dy;
  PImage imgEagle;
  int halfWidth = 60;
  int halfHeight = 50;
  
  Eagle(){
    imgEagle = loadImage("eagle.png");
    do{
      x = random(width);
      y = random(400);
    } while (x <= halfWidth || x >= width - halfWidth ||
             y <= halfHeight || y >= height - halfHeight);
    do{
      dx = random(-5, +5);
      dy = random(-5, +5);
    } while (dx == 0 && dy == 0);
  }
  
  void drawEagle(){
    image(imgEagle, x, y);
  }
  
  void moveEagle(){
    x += dx;
    y += dy;
    if (x <= halfWidth || x >= width - halfWidth) dx = -dx;
    if (y <= halfHeight || y >= height - halfHeight) dy = -dy;
  }
  
  boolean shotByGun(float gunX, float gunY){
    return (abs(x - gunX) < 30) && (abs(y - gunY) < 30);
  }
}