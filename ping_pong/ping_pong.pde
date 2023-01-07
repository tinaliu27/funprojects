float isGameOver = 0; 
float r, Xb, Yb, speedX, speedY;
// when true, just draw the GameOver message and stop the animation loop to end the game  
int scoreright = 0;
int scoreleft = 0;
float hit = 1;
Ball ball;
Ball[] balls;
Paddle pleft, pright,hpleft,hpright;
Button reset, start;
boolean pressed; 
boolean refresh; 
int num = 0; 
void setup() {
  size(900, 600);
  ball = new Ball(width/2,height/2,40, 255);
  ball.speedX=2.5;
  ball.speedY= random(-4,4);
  pleft = new Paddle(15, height/2,30,200,255);
  pright = new Paddle(width-15, height/2,30, 200,255);
  hpleft = new Paddle(15, height/2,30,200,255);
  hpright = new Paddle(width-15, height/2,30, 200,255);
  start = new Button(width/3, height/3, 200,100, 255, "Start");
  reset = new Button(width/3+15, height/4,200,100,255, "Reset");
  balls = new Ball[10];
  for (int i = 0; i < balls.length; i++) {
     balls[i] = new Ball(width/2,height/3,50,0);
     balls[i].speedX=random(-4,4);
     balls[i].speedY=random(-4,4);
  }
}
void draw() { 
  // frameRate(20);
  switch(num) {
    case 0:
        scene0();
        break;
    case 1:
        scene1();
        break;
    case 2:
        scene2();
        break;   
 }
//saveFrame("animations/####.png");

}

void scene0() {
   background(130,190,100);
   textSize(100);
   fill(0);
   pressed = false; 
   text("PONG GAME", width/6, 100);
   for (int i = 0; i < balls.length; i++) {
      balls[i].move();
      balls[i].display();
      if (balls[i].top() < 0) {
          balls[i].speedY = -balls[i].speedY;
       } 
      if (balls[i].bottom() > height) {
          balls[i].speedY = -balls[i].speedY;
       }
       if (balls[i].left() > width) {
          balls[i].speedX = -balls[i].speedX;
       }
       if (balls[i].right() < 0) {
          balls[i].speedX = -balls[i].speedX;
        }
  }
    start.display();

}
void scene1() {
    background(0);
    ball.move();
    ball.display();
    if(refresh == true) {
      isGameOver=0;
      scoreright = 0;
      scoreleft = 0;
    }
      if (scoreright<5 && scoreleft<5) {              //play as long as it is not game over
        if (ball.top() < 0) {
        ball.speedY = -ball.speedY;
        }
      if (ball.bottom() > height) {
        ball.speedY = -ball.speedY;
      }
      pleft.move();
      pleft.display();
      pright.move();
      pright.display();
      if(pleft.top()< 0) {
          pleft.yp = pleft.h;
      } 
      if (pleft.bottom() > height) {
          pleft.yp = height-pleft.h/2;
      } 
      if (pright.top() < 0) {
          pright.yp = pright.h/2;
      } 
      if (pright.bottom() > height) {
          pright.yp = height-pright.h/2;
      } 
      
     if (ball.left()-ball.r< pleft.right() && ball.Yb > pleft.top() && ball.Yb< pleft.bottom()) {
        ball.speedX = -ball.speedX;
        hit++;
    }
    if (ball.right()+ball.r> pright.left() && ball.Yb> pright.top() && ball.Yb < pright.bottom()) {
        ball.speedX = -ball.speedX;
        hit++;
    }
   if (ball.right() > width) {
     ball.Xb = width/2;
     ball.Yb = height/2;
     scoreleft++;
     isGameOver++;
   }
   if (ball.left() < 0) {
     ball.Xb = width/2;
     ball.Yb = height/2;
     scoreright++;
     isGameOver++;
   }
    fill(255, 0, 0); textSize(16);
    text("Score: " + scoreright, 739, 15);
    fill(255, 0, 0); textAlign(LEFT);  textSize(16);
    text("Score: " + scoreleft, 5, 15);
   
    stroke(152,190,100);
    line(400,0,400,600);
    stroke(255);
} else {
  num = 2; 
  refresh = false; 
}

} void scene2() {
  pressed = false; 
// if game over
   if (pressed==false) {
   background(255);
   reset.display();
   fill(255, 204,0);
   textSize(50);
   text("Game Over", width/2.9, height/2);
   if (scoreleft > scoreright) {
     text("Player Left Wins!", width/3.7, height/1.7);
   } else {
     text("Player Right Wins!", width/3.7, height/1.7);
   }
   } else {
      num = 0;
   }
   
} void keyPressed() {
    if(keyCode == UP) {
      pright.speedY=-3;
    }
    if (keyCode == DOWN) {
      pright.speedY=3;
    }
    if (key == 'a') {
      pleft.speedY=-3;
    }
    if (key == 'z') {
      pleft.speedY=3;
    }
}
void keyReleased(){
  if(keyCode == UP){
      pright.speedY=0;
  }
  if(keyCode == DOWN){
    pright.speedY=0;
  }
  if(key == 'a'){
    pleft.speedY=0;
  }
  if(key == 'z'){
    pleft.speedY=0;
  }
}
void mousePressed() {
    switch(num) {
        case 0: 
            if (mouseX > start.x && mouseX< (start.x+start.w) && mouseY > start.y && mouseY < (start.y+start.h))
                  num=1;
                  pressed = true; 
            break;
        case 1:
            break;
        case 2:
            if (mouseX > reset.x && mouseX< (reset.x+reset.w) && mouseY > reset.y && mouseY < (reset.y+reset.h))
                  num = 0;
                  pressed = true;
           break;
    }

}
