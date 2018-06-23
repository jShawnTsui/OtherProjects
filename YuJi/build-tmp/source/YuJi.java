import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class YuJi extends PApplet {

/* Programming Languages and Techniques
 * Homework 7
 * Name: YuJi
 * Description: Using Processing, draw a picture.
 * Author: Xiangyang Cui
 * Date: 10/23/2016
 */
public void setup(){
  
  
  // Background, method is provided by Dave in class
  int lightBlue = color(150, 255, 255);
  int lightred = color(225, 75, 75);
  linearGradient(0, 0, width, height, lightBlue, lightred, "up"); 
  
  // Set the scale, so I can directly use numbers I measured from paper
  scale(2);

  // Draw Hands
  drawHands();
  // Draw clothes
  drawClothes();
  // Draw head
  drawHead();
  // Draw throne
  drawThrone();
  // Draw Signature
  drawSignature();  
}

// Draw the hands
public void drawHands(){
  fill(0xffFDEFEF);
  stroke(0);
  strokeWeight(1);
  
  pushMatrix();
  // Right hand
  translate(62, 186);
  rotate(radians(45));
  ellipse(0, 0, 15, 6);
  popMatrix();
  
  // Left hand
  pushMatrix();
  translate(145, 186);
  rotate(radians(-45));
  ellipse(0, 0, 15, 6);
  popMatrix();
}

// Draw clothes
public void drawClothes(){
  fill(0xffFCFD0D);
  noStroke();
  rect(82, 166, 43, 44);
  
  // Skirt
  drawSkirt();
  
  // Bi Xi, which is a towel-like thing hanging on the belt
  drawBiXi();
  
  // Belt
  drawBelt();
  
  // Sleeves
  drawSleeves();
  
  // Xia Pei, something cover the shoulder, back and chest
  drawXiaPei();
  
  // Accessory on the belt
  drawAccessory();
}

// Draw skirt
public void drawSkirt(){
  stroke(0);
  strokeWeight(1);
  fill(0xffFCFD0D);
  beginShape(); 
    vertex(88, 195);
    vertex(80, 250);
    curveVertex(80, 250);
    curveVertex(90, 255);
    curveVertex(110, 255);
    curveVertex(126, 250);
    curveVertex(126, 250);
    vertex(118, 195);
  endShape();
}

// Draw Bi Xi, which is a towel-like thing hanging on the belt
public void drawBiXi(){
  stroke(0);
  strokeWeight(1);
  fill(0xffFBC90A);
  beginShape(); 
    vertex(92, 195);
    vertex(84, 254);
    curveVertex(84, 254);
    curveVertex(90, 259);
    curveVertex(110, 259);
    curveVertex(122, 254);
    curveVertex(122, 254);
    vertex(114, 195);
  endShape();
}

// Draw belt
public void drawBelt(){
  stroke(0);
  strokeWeight(1);
  fill(0xff0583EA);
  rect(86, 195, 40, 12);
}

// Draw sleeves
public void drawSleeves(){
  stroke(0);
  strokeWeight(1);
  fill(0xffFCFD0D);
  // Left sleeve
  beginShape(); 
    curveVertex(82, 166);
    curveVertex(82, 166);
    curveVertex(75, 175);
    curveVertex(75, 188);
    curveVertex(62, 183);
    curveVertex(60, 208);
    curveVertex(75, 225);
    curveVertex(88, 205);
    curveVertex(91, 195);
    curveVertex(91, 195);
  endShape();
  
  // Right sleeve
  beginShape(); 
    curveVertex(125, 166);
    curveVertex(125, 166);
    curveVertex(131, 175);
    curveVertex(131, 188);
    curveVertex(144, 183);
    curveVertex(146, 208);
    curveVertex(131, 225);
    curveVertex(118, 205);
    curveVertex(115, 195);
    curveVertex(115, 195);
  endShape();
}

// Draw Xia Pei, something cover the shoulder, back and chest
public void drawXiaPei(){
  stroke(0);
  strokeWeight(1);
  fill(0xffFF0000);
  beginShape(); 
    vertex(82, 166);
    vertex(75, 175);
    curveVertex(75, 175);
    curveVertex(85, 185);
    curveVertex(110, 185);
    curveVertex(131, 175);
    curveVertex(131, 175);
    vertex(125, 166);
  endShape();
}

// Draw accessory on the belt
public void drawAccessory(){
  stroke(0);
  strokeWeight(1);
  fill(0xffFCC80A);
  ellipse(103, 201, 18, 18);
  pushMatrix();
  translate(103, 201);
  fill(0xff06ECE7);
  strokeWeight(0.1f);
  for(int i = 0;i < 30; i++){
    rotate(radians(12));
    ellipse(9, 0, 2, 2);
  }
  popMatrix();
}

// Draw the head
public void drawHead(){
  //ears
  drawEars();
  
  // head
  drawHeadShape();
  
  // face
  drawFace();
  
  // mouth
  drawMouth();
  
  //eyes
  drawEyes();
  
  // Pian Zi, some oval things around the face
  drawPianZi();
  
  // White pearls
  drawWhitePearls();
  
  //flowers, which I use two circle instead
  drawFlowers();
  
  //green pearls
  drawGreenPearls();
}

// Draw ears
public void drawEars(){
  stroke(0);
  strokeWeight(1);
  fill(0xffFFFAF1);
  ellipse(55, 140, 23, 23);
  ellipse(153, 138, 23, 23);
}

// Draw the shape of head
public void drawHeadShape(){
  stroke(0);
  strokeWeight(1);
  fill(0);
  ellipse(103, 112, 120, 115);
}

// Draw face
public void drawFace(){
  noStroke();
  fill(0xffFFFAF1);
  bezier(61, 130, 53, 182, 156, 182, 145, 130);
  bezier(61, 130, 53, 78, 156, 78, 145, 130);
}

// Draw mouth
public void drawMouth(){
  noStroke();
  fill(0xffFEACB5);
  arc(105, 160, 15, 15, 5 * QUARTER_PI, 7 * QUARTER_PI, CHORD);
  arc(105, 149, 15, 15, QUARTER_PI, 3 * QUARTER_PI, CHORD);
}

// Draw Eyes
public void drawEyes(){
  pushMatrix();
  translate(107, 130);
  rotate(radians(-20));
  eye();
  popMatrix();
  pushMatrix();
  translate(67, 118);
  rotate(radians(20));
  eye();
  popMatrix();
}

// Draw eye, the reference points should be (67, 118) or (107, 130)
public void eye(){
  noStroke();
  fill(0xffFEACB5);
  ellipse(18, 10, 36, 20);
  fill(0);
  ellipse(18, 10, 30, 3);
}

// Draw Pian Zi, which are oval things around the face
public void drawPianZi(){
  pushMatrix();
  translate(90, 74);
  mainPianZi();
  popMatrix();
  pushMatrix();
  translate(105, 150);
  rotate(radians(22));
  smallPianZi();
  rotate(radians(21));
  smallPianZi();
  rotate(radians(21));
  smallPianZi();
  rotate(radians(-90));
  smallPianZi();
  rotate(radians(-21));
  smallPianZi();
  rotate(radians(-21));
  smallPianZi();
  popMatrix();
}

// Draw white pearls
public void drawWhitePearls(){
  pushMatrix();
  translate(105, 150);
  rotate(radians(11));
  whitePearl();
  rotate(radians(22));
  whitePearl();
  rotate(radians(21));
  whitePearl();
  rotate(radians(-70));
  whitePearl();
  rotate(radians(-21));
  whitePearl();
  rotate(radians(-21));
  whitePearl();
  popMatrix();
}

// Draw flowers, which I use two circle instead
public void drawFlowers(){
  stroke(0);
  strokeWeight(2);
  fill(0xff07FBF7);
  ellipse(48, 100, 17, 17);
  ellipse(158, 100, 17, 17);
}

// Draw green pearls
public void drawGreenPearls(){
  fill(0xffF6910B);
  pushMatrix();
  translate(153, 45);
  rotate(radians(80));
  for(int i = 0;i < 6;i++){
    rotate(radians(12));
    ellipse(40, 0, 8, 8);
  }
  popMatrix();
  pushMatrix();
  translate(53, 45);
  rotate(radians(102));
  for(int i = 0;i < 6;i++){
    rotate(radians(-12));
    ellipse(40, 0, 8, 8);
  }
  popMatrix();
}

// Draw the throne
public void drawThrone(){
  fill(0xffFCC80A);
  strokeWeight(0.7f);
  rect(75, 20, 53, 7);
  rect(95, 27, 15, 10);
  
  fill(0xff06ECE7);
  for(int i = 0;i < 7; i++){
    ellipse(75 + 8.9f * i, 27, 4, 4);
  }
  
  fill(0xffFCC80A);
  ellipse(103, 42, 18, 18);
  
  pushMatrix();
  translate(103, 42);
  fill(0xff06ECE7);
  for(int i = 0;i < 30; i++){
    rotate(radians(12));
    ellipse(9, 0, 2, 2);
  }
  popMatrix();
  
  pushMatrix();
  translate(103, 82);
  rotate(radians(-60));
  noStroke();
  fill(0xff0FA8F7);
  ellipse(22, 0, 24, 17);
  fill(0xff0FF8FA);
  ellipse(22, 0, 13, 6);
  rotate(radians(-31));
  fill(0xff0FA8F7);
  ellipse(22, 0, 24, 17);
  fill(0xff0FF8FA);
  ellipse(22, 0, 13, 6);
  rotate(radians(-31));
  fill(0xff0FA8F7);
  ellipse(22, 0, 24, 17);
  fill(0xff0FF8FA);
  ellipse(22, 0, 13, 6);
  popMatrix();
}

// Draw the signature
public void drawSignature(){
  PFont myFont; 
  myFont = createFont("STXingkai-SC-Bold", 15);  textFont(myFont); 
  fill(255, 0 , 0); 
  text("Xiangyang Cui", 130, 270);
}

// Draw the larger Pian Zi, the reference points should be (90, 74)
public void mainPianZi(){
  stroke(0);
  strokeWeight(2);
  fill(0xff3A3602);
  ellipse(13, 17, 26, 34);
  noStroke();
  fill(0xffFD0306);
  ellipse(13, 17, 13, 17);
}

// Draw the smaller Pian Zi, the reference point should be (105, 150)
public void smallPianZi(){
  stroke(0);
  strokeWeight(2);
  fill(0xff3A3602);
  ellipse(0, -59, 21, 30);
  noStroke();
  fill(0xffFDFD0C);
  ellipse(0, -59, 11, 15);
}

// Draw a white pearl, the reference point should be (105, 150)
public void whitePearl(){
  noStroke();
  fill(0xff06ECE7);
  ellipse(0, -65, 5, 5);
}

// This method is provided by Dave
// Fill a rectangle with a gradient
public void linearGradient(float x, float y,
                    float w, float h,
                    int c1, int c2,
                    String dir) {
  if (dir.equals("down")) { 
    for (float dy = 0; dy < h; dy += 1) {
      stroke(lerpColor(c1, c2, dy / h)); 
      line(x, y + dy, x + w - 1, y + dy);
    } 
  } else if (dir.equals("up")) { 
      for (float dy = 0; dy < h; dy += 1){
        stroke(lerpColor(c2, c1, dy / h));
        line(x, y + dy, x + w - 1, y + dy); 
      } 
  } else if (dir.equals("left")) { 
      for (float dx = 0; dx < w; dx += 1){
        stroke(lerpColor(c1, c2, dx / w));
        line(x + dx, y, x + dx, y + h -1);
      } 
  } else if (dir.equals("right")) { 
      for (float dx = 0; dx < w; dx += 1){
        stroke(lerpColor(c2, c1, dx / w));
        line(x + dx, y, x + dx, y + h - 1);
      }
  }
}
  public void settings() {  size(430, 560); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "YuJi" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
