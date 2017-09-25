/*
Create a MONSTER
5 colors
7 shapes
*/


int speed = 1; //for the wave
int ex1 = 0; //for the wave
int rise = 0; //for the bubble
int b = 0; //
int bc = 0; //for the body to change color

PVector v1, v2;

float arms;
float bubbleX = random(1000);

void setup() {
  size(1000, 1000);
}

void draw() {
  background(0, 100, 175); //air
  noStroke();
  
  fill(50, 60, 130);
  rect(0, 100, width, height); //water      
  for (int ex = ex1; ex < 1000; ex = ex + 75){ //wave
    ellipse(ex, 110, 100, 50);
  }
  ex1 = ex1 + speed;
  if (ex1 > 50){
      speed = -1;
  }
  if (ex1 < 0){
      speed = 1;
  }
  
  //BUBBLES
  noStroke();
  fill(225, 225, 225, 100);
  //b = 30 % frameCount;
  //for (int b = 0; b < second(); b = b+1){
      ellipse(bubbleX, 1000-rise, 20, 20);
  //     }
  bubbleX = bubbleX + random(-2,2);
    rise = rise + 1;
  //BODY
    stroke(0);
    strokeWeight(5);
    fill(120);
    ellipse(500, 680, 300, 500);
    
  //HEAD    
    fill(120);
    ellipse(500, 350, 125, 175);
      noStroke();
      fill(200, 0, 0);                                                    
      // R eye                                      
      //  |----p1---|---p2---|----p3---|----p4---|
      quad(515, 350, 525, 340, 530, 315, 515, 320); //    p1--p2
                                                    //    |    |
                                                    //    p4--p3
      // L eye                                      
      //  |----p1---|---p2---|----p3---|----p4---|      
      quad(470, 340, 480, 350, 480, 320, 465, 315); //    p2--p3
                                                    //    |    |
                                                    //    p1--p4
      //nose
      stroke(0);
      point(488, 360);
      point(508, 360);
      //Mouth
      noStroke();
      fill(255);
      triangle(480, 390, 490, 390, 485, 400);
      triangle(505, 390, 515, 390, 510, 400);
      stroke(0);
      line(480, 390, 515, 390);
      if(mouseX > 400 && mouseX < 600){  //mouth OPENS
        if (mouseY > 260 && mouseY < 500){
          fill(50);
          ellipse(499, 405, 50, 50);
          noStroke();
          fill(255);
          triangle(480, 390, 490, 385, 485, 400);  //TL tooth
          triangle(505, 385, 515, 390, 510, 400);  //TR tooth
          triangle(480, 420, 485, 410, 490, 425);  //BL tooth
          triangle(505, 425, 515, 420, 510, 410);  //BR tooth
          noFill();
          ellipse(499, 405, 50, 50);          
        } 
      }
  
  //ARMS
  v1 = new PVector(mouseX-670,mouseY-700); //establish the x/y components of the vector
                                           //  x-component: (mouse x-position)-(elbow x-position)
                                           //  y-component: (mouse y-position)-(elbow y-position)
  v1.setMag(200); //set the magnitude of v1 to 100
  v2 = new PVector(mouseX-330,mouseY-700); //establish the x/y components of the vector
                                           //  x-component: (mouse x-position)-(elbow x-position)
                                           //  y-component: (mouse y-position)-(elbow y-position)
  v2.setMag(200); //set the magnitude of v1 to 100
    fill(50, 50, 50, 50);
    stroke(100, 100, 100);
    strokeWeight(50);
    strokeJoin(ROUND);
      //pushMatrix();
        //translate(mouseX-500, mouseY-450);
        //arms = atan2(450,500);
        
          beginShape(); //RIGHT arm
            vertex(610, 540);//Shoulder
            vertex(670, 700);//Elbow
            vertex(670+v1.x, 700+v1.y);//Hand
          endShape();
      
          beginShape(); //LEFT arm
            vertex(390, 540);//Shoulder
            vertex(330, 700);//Elbow
            vertex(330+v2.x, 700+v2.y);//Hand
          endShape();
      //popMatrix();

  //Crosshairs BEGIN
    //stroke(255);  // white colored line
    //strokeWeight(1); // thickness
    //line(0, mouseY, width, mouseY); //Horizontal
    //line(mouseX, 0, mouseX, height); //Vertical
    print("Mouse X is:  "); print(mouseX); print(" Mouse Y is: "); println(mouseY);
  //Crosshairs END
}