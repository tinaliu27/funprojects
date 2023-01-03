float isGameOver = 0; 
float r, Xb, Yb, speedX, speedY;
// when true, just draw the GameOver message and stop the animation loop to end the game  
int scoreright = 0;
int scoreleft = 0;
Ball ball;
Ball[] balls;
Paddle pleft, pright;
Button reset, start;
int num = 0; 
void setup() {
  size(800, 600);
  frameRate(100);
  ball = new Ball(40, 255);
  ball.speedX=random(-3,3);
  ball.speedY= random(-3,3);
  pleft = new Paddle(15, height/2,30, 200);
  pright = new Paddle(width-15, height/2,30, 200);
  start = new Button(width/2, height/2, 255, "Start");
  reset = new Button(width/4, height/4, 0, "Reset");
  balls = new Ball[10];
  for (int i = 0; i < balls.length; i++) {
     balls[i] = new Ball(50,0);
     balls[i].speedX=random(-4,4);
     balls[i].speedY=random(-4,4);
  }



}
void draw() { 
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
}

void scene0() {
   background(152,190,100);
   textSize(100);
   fill(0);
   text("PONG GAME", width/2, 40);
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
    if (isGameOver<5) {              //play as long as it is not game over
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
      if(pleft.top() < 0) {
          pleft.yp = pleft.h/2;
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
      
     if (ball.left() < pleft.right() && ball.Yb > pleft.top() && ball.Yb < pleft.bottom()) {
        ball.speedX = -ball.speedX;

    }
    if (ball.right() > pright.left() && ball.Yb > pright.top() && ball.Yb < pright.bottom()) {
        ball.speedX = -ball.speedX;
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
}
} void scene2() {
// if game over
   background(0);
   reset.display();
   fill(255, 204,0);
   textSize(50);
   text("Game Over", width/2.9, height/2);
   if (scoreleft > scoreright) {
     text("Player Left Wins!", width/3.7, height/1.7);
   } else {
     text("Player Right Wins!", width/3.7, height/1.7);
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
            num = 1;
        case 1:
        case 2:
            num = 0;
    }
}
 // saveFrame("animations/####.png");
