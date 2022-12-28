
class Ball {
  float r, Xb, Yb, speedX, speedY;
  
  Ball(float radius) {
    r = radius*2;
    Xb = random(r, width-r);      
    Yb = 30;
    speedX = int(random(-2, 2)); 
    speedY = int(random(-2, 2));

  }
  void move() {
    Xb += speedX;
    Yb += speedY;
    if (Xb > width || Xb < 0)
        speedX = -speedX;
    if(Yb < 0) 
        speedY = -speedY;
  }
  void display() {
    ellipse(Xb,Yb,r,r);
  }
  float left() {
    return Xb-(2*r)/2;
  }
  float right() { 
    return Xb+(2*r)/2;
  }
  float top() {
    return Yb-(2*r)/2;
  }
  float bottom() {
    return Yb+(2*r)/2;
  }
  
  
  
  
}
