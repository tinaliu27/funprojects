boolean isGameOver = false; 
float r, Xb, Yb, speedX, speedY;
// when true, just draw the GameOver message and stop the animation loop to end the game  
int score = 0;
Ball ball;
Paddle pleft, pright;
void setup() {
  size(800, 600);
  frameRate(100);
  ball = new Ball(15);
  pleft = new Paddle(15, height/2,30, 200);
  pright = new Paddle(width-15, height/2,30, 200);
  stroke(255);
  line(400,0,400,600);

}

void draw() {  
    background(0);
    ball.display();
    if (!isGameOver) {              //play as long as it is not game over
       //  stroke(0, 255, 0);  strokeCap(ROUND);  strokeWeight(h);
      pleft.move();
      pleft.display();
      pright.move();
      pright.display();
      
      fill(255, 0, 0); textAlign(LEFT);  textSize(16);
      text("Score: " + score, 5, 15);
    if (ball.left() < pleft.right() && ball.Yb > pleft.top() && ball.Yb < pleft.bottom()) {
        ball.speedX = -ball.speedX;
    }
    
    if (ball.right() < pright.left() && ball.Yb > pright.top() && ball.Yb < pright.bottom()) {
        ball.speedX = -ball.speedX;
    }
    // REQ2: Add code to check if ball lands on the paddle. Here is the pseudo-code:
    if (ball.Yb > height) {
      if (pleft.xp+pleft.w<pleft.xp+2*pleft.w) { 
         score++;
      } else if (pright.xp+pright.w<pright.xp+2*pright.w) { 
         score++; 
      } else {
      isGameOver = true;
        }
    }
    
    // if the ball is at the bottom edge (hint: check Yb)                         
    //     if ball lands on paddle (hint: see the assignment on how to check this) 
    //         increment score, bounce ball up, and increase speed by 10%         
    //     else                                                                    
    //         set isGameOver to true;                                           

} else { // if game over
    //REQ3: Add code for putting the GameOver message and stoping the animation loop 
   fill(255, 204,0);
   textSize(50);
   text("Game Over", width/4.8, height/2);
   text("Score: " + score, width/3.4, height/1.5);
   
}
 saveFrame("animations/####.png");

} 
void keyPressed() {
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
