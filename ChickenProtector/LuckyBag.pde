class LuckyBag{
  float x, y, dx, dy;
  PImage imgLuckyBag;
  int halfWidth = 40;
  int halfHeight = 45;
  
  LuckyBag(){
    imgLuckyBag = loadImage("luckybag.png");
    do{
      x = random(width);
      y = random(400);
    } while (x <= halfWidth + 50 || x >= width - halfWidth - 50 ||
             y <= halfHeight + 50 || y >= height - halfHeight - 50);
    do{
      dx = random(-5, +5);
      dy = random(5);
    } while (dx == 0 && dy == 0);
  }
  
  void drawLuckyBag(){
    image(imgLuckyBag, x, y);
  }
  
  void moveLuckyBag(){
    x += dx;
    y += dy;
  }
  
  boolean outOfBound(){
    return (x < -halfWidth || x > width + halfWidth || y > height);
  }
  
  boolean shotByGun(float gunX, float gunY){
    return (abs(x - gunX) < 30) && (abs(y - gunY) < 30);
  }
}