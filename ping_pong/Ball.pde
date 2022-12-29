
class Ball {
  float r, Xb, Yb, speedX, speedY, diameter;
  
  Ball(float radius) {
    r = radius;
    diameter = r*2;
    Xb = width/2;      
    Yb = width/2;
    speedX = 0; 
    speedY = 0;

  }
  void move() {
    Xb += speedX;
    Yb += speedY;
  }
  void display() {
    ellipse(Xb,Yb,r,r);
  }
  float left() {
    return Xb-(diameter/2);
  }
  float right() { 
    return Xb+(diameter/2);
  }
  float top() {
    return Yb-(diameter/2);
  }
  float bottom() {
    return Yb+(diameter/2);
  }
  
  
  
  
}
