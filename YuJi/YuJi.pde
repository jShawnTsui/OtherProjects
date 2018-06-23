/* Programming Languages and Techniques
 * Homework 7
 * Name: YuJi
 * Description: Using Processing, draw a picture.
 * Author: Xiangyang Cui
 * Date: 10/23/2016
 */
void setup(){
  size(430, 560);
  
  // Background, method is provided by Dave in class
  color lightBlue = color(150, 255, 255);
  color lightred = color(225, 75, 75);
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
void drawHands(){
  fill(#FDEFEF);
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
void drawClothes(){
  fill(#FCFD0D);
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
void drawSkirt(){
  stroke(0);
  strokeWeight(1);
  fill(#FCFD0D);
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
void drawBiXi(){
  stroke(0);
  strokeWeight(1);
  fill(#FBC90A);
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
void drawBelt(){
  stroke(0);
  strokeWeight(1);
  fill(#0583EA);
  rect(86, 195, 40, 12);
}

// Draw sleeves
void drawSleeves(){
  stroke(0);
  strokeWeight(1);
  fill(#FCFD0D);
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
void drawXiaPei(){
  stroke(0);
  strokeWeight(1);
  fill(#FF0000);
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
void drawAccessory(){
  stroke(0);
  strokeWeight(1);
  fill(#FCC80A);
  ellipse(103, 201, 18, 18);
  pushMatrix();
  translate(103, 201);
  fill(#06ECE7);
  strokeWeight(0.1);
  for(int i = 0;i < 30; i++){
    rotate(radians(12));
    ellipse(9, 0, 2, 2);
  }
  popMatrix();
}

// Draw the head
void drawHead(){
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
void drawEars(){
  stroke(0);
  strokeWeight(1);
  fill(#FFFAF1);
  ellipse(55, 140, 23, 23);
  ellipse(153, 138, 23, 23);
}

// Draw the shape of head
void drawHeadShape(){
  stroke(0);
  strokeWeight(1);
  fill(0);
  ellipse(103, 112, 120, 115);
}

// Draw face
void drawFace(){
  noStroke();
  fill(#FFFAF1);
  bezier(61, 130, 53, 182, 156, 182, 145, 130);
  bezier(61, 130, 53, 78, 156, 78, 145, 130);
}

// Draw mouth
void drawMouth(){
  noStroke();
  fill(#FEACB5);
  arc(105, 160, 15, 15, 5 * QUARTER_PI, 7 * QUARTER_PI, CHORD);
  arc(105, 149, 15, 15, QUARTER_PI, 3 * QUARTER_PI, CHORD);
}

// Draw Eyes
void drawEyes(){
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
void eye(){
  noStroke();
  fill(#FEACB5);
  ellipse(18, 10, 36, 20);
  fill(0);
  ellipse(18, 10, 30, 3);
}

// Draw Pian Zi, which are oval things around the face
void drawPianZi(){
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
void drawWhitePearls(){
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
void drawFlowers(){
  stroke(0);
  strokeWeight(2);
  fill(#07FBF7);
  ellipse(48, 100, 17, 17);
  ellipse(158, 100, 17, 17);
}

// Draw green pearls
void drawGreenPearls(){
  fill(#F6910B);
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
void drawThrone(){
  fill(#FCC80A);
  strokeWeight(0.7);
  rect(75, 20, 53, 7);
  rect(95, 27, 15, 10);
  
  fill(#06ECE7);
  for(int i = 0;i < 7; i++){
    ellipse(75 + 8.9 * i, 27, 4, 4);
  }
  
  fill(#FCC80A);
  ellipse(103, 42, 18, 18);
  
  pushMatrix();
  translate(103, 42);
  fill(#06ECE7);
  for(int i = 0;i < 30; i++){
    rotate(radians(12));
    ellipse(9, 0, 2, 2);
  }
  popMatrix();
  
  pushMatrix();
  translate(103, 82);
  rotate(radians(-60));
  noStroke();
  fill(#0FA8F7);
  ellipse(22, 0, 24, 17);
  fill(#0FF8FA);
  ellipse(22, 0, 13, 6);
  rotate(radians(-31));
  fill(#0FA8F7);
  ellipse(22, 0, 24, 17);
  fill(#0FF8FA);
  ellipse(22, 0, 13, 6);
  rotate(radians(-31));
  fill(#0FA8F7);
  ellipse(22, 0, 24, 17);
  fill(#0FF8FA);
  ellipse(22, 0, 13, 6);
  popMatrix();
}

// Draw the signature
void drawSignature(){
  PFont myFont; 
  myFont = createFont("STXingkaiSC-Bold", 15);  textFont(myFont); 
  fill(255, 0 , 0); 
  text("Xiangyang Cui", 130, 270);
}

// Draw the larger Pian Zi, the reference points should be (90, 74)
void mainPianZi(){
  stroke(0);
  strokeWeight(2);
  fill(#3A3602);
  ellipse(13, 17, 26, 34);
  noStroke();
  fill(#FD0306);
  ellipse(13, 17, 13, 17);
}

// Draw the smaller Pian Zi, the reference point should be (105, 150)
void smallPianZi(){
  stroke(0);
  strokeWeight(2);
  fill(#3A3602);
  ellipse(0, -59, 21, 30);
  noStroke();
  fill(#FDFD0C);
  ellipse(0, -59, 11, 15);
}

// Draw a white pearl, the reference point should be (105, 150)
void whitePearl(){
  noStroke();
  fill(#06ECE7);
  ellipse(0, -65, 5, 5);
}

// This method is provided by Dave
// Fill a rectangle with a gradient
void linearGradient(float x, float y,
                    float w, float h,
                    color c1, color c2,
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
