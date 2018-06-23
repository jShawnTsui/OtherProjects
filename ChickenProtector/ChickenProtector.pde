/* Programming Languages and Techniques
 * Homework 8
 * Name: ChickenProtector
 * Description: Using Processing, write a game(details in readme.txt).
 * Author: Xiangyang Cui
 * Date: 10/29/2016
 */
 
import processing.sound.*;

SoundFile gunShot;
SoundFile bgMusic;
float gunX, gunY;
int score = 0;
int bullet = 10;
int time = 0;
PImage img;
PImage imgHen;
ArrayList<Chick> listChicken = new ArrayList();
ArrayList<Eagle> listEagles = new ArrayList();
ArrayList<LuckyBag> listLuckyBags = new ArrayList();

void setup(){
  size(1000, 667);
  imageMode(CENTER);
  img = loadImage("background.jpg");
  imgHen = loadImage("hen.png");
  gunShot = new SoundFile(this, "gunshot.wav"); 
  bgMusic = new SoundFile(this, "the-secret-base.mp3");
  bgMusic.loop();
  listChicken.add(new Chick());
  frameRate(30);
}

void draw(){
  background(img);
  image(imgHen, 850, 532);
  drawScore();
  drawBullet();
  drawGun();
  drawChicken();
  drawEagles();
  drawLuckyBags();
  if(gameOver()){
    drawGameOver();
  } else{
    time += 1;
    if (time % 150 == 0) {
      listChicken.add(new Chick());
    }
    //drawChicken();
    moveChicken();
    if (time % 50 == 0) {
      listEagles.add(new Eagle());
    }
    //drawEagles();
    moveEagles();
    if (time % 250 == 0) {
      listLuckyBags.add(new LuckyBag());
    }
    //drawLuckyBags();
    moveLuckyBags();
    currentLuckyBags();
    currentChicken();
  }
}

void drawScore() {
  fill(0);
  textSize(24);
  text("Score: " + score, 20, 30);
}

void drawBullet() {
  fill(0);
  textSize(24);
  text("Bullet: " + bullet, 850, 30);
}

void drawGun(){
  noFill();
  stroke(0);
  strokeWeight(1);
  ellipse(mouseX, mouseY, 100, 100);
  line(mouseX - 40, mouseY, mouseX + 40, mouseY);
  line(mouseX, mouseY - 40, mouseX, mouseY + 40);
}

void drawChicken(){
  for (Chick chick : listChicken){
    chick.drawChick();
  }
}
  
void moveChicken() {
    for (Chick chick : listChicken) {
    chick.moveChick();
  }
}

void drawEagles(){
  for (Eagle eagle : listEagles){
    eagle.drawEagle();
  }
}
  
void moveEagles() {
    for (Eagle eagle : listEagles){
    eagle.moveEagle();
  }
}

void drawLuckyBags(){
  for (LuckyBag luckyBag : listLuckyBags){
    luckyBag.drawLuckyBag();
  }
}
  
void moveLuckyBags() {
  for (LuckyBag luckyBag: listLuckyBags){
    luckyBag.moveLuckyBag();
  }
}

void currentLuckyBags(){
  ArrayList<LuckyBag> outOfBoundLuckyBags = new ArrayList();
  for (LuckyBag luckyBag : listLuckyBags){
    if(luckyBag.outOfBound()){
      outOfBoundLuckyBags.add(luckyBag);
    }
  }
  for (LuckyBag luckyBag: outOfBoundLuckyBags){
      listLuckyBags.remove(luckyBag);
  }
}

void currentChicken(){
  ArrayList<Chick> catchedChicken = new ArrayList();
  for(Chick chick : listChicken){
    for(Eagle eagle : listEagles){
      if(chick.catchByEagle(eagle)){
        catchedChicken.add(chick);
        break;
      }
    }
  }
  for(Chick chick: catchedChicken){
      listChicken.remove(chick);
  }
}

void mousePressed() { 
  if(!gameOver()){
    gunShot.play();
    bullet -= 1;
    ArrayList<Eagle> shotEagles = new ArrayList();
    ArrayList<LuckyBag> shotLuckyBags = new ArrayList();
    for(Eagle eagle : listEagles){
      if(eagle.shotByGun(mouseX, mouseY)){
        shotEagles.add(eagle);
        score += 1;
        break;
      }
    }
    for(Eagle eagle : shotEagles){
        listEagles.remove(eagle);
    }
    for(LuckyBag luckyBag : listLuckyBags){
      if(luckyBag.shotByGun(mouseX, mouseY)){
        shotLuckyBags.add(luckyBag);
        bullet += 10;
        break;
      }
    }
    for(LuckyBag luckyBag : shotLuckyBags){
        listLuckyBags.remove(luckyBag);
    }
  }
}

boolean gameOver(){
  return (bullet <= 0) || (listChicken.size() <= 0);
}

void drawGameOver() {
  fill(255, 0, 0);
  textSize(70);
  text("Game Over!", 300, 300);
}