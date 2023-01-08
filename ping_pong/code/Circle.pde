class Ball {
  float r, Xb, Yb, speedX, speedY, diameter,fill;
  
  Ball(float x, float y, float radius, color fill) {
    r = radius;
    diameter = r*2;
    Xb = x;      
    Yb = y;
    speedX = 0; 
    speedY = 0;
    this.fill = fill;

  }
  void move() {
    Xb += speedX;
    Yb += speedY;
  }
  void display() {
    fill(fill);
    ellipse(Xb,Yb,r,r);
  }
  float left() {
    return Xb+(r/2);
  }
  float right() { 
    return Xb-(r/2);
  }
  float top() {
    return Yb-(r/2);
  }
  float bottom() {
    return Yb+(r/2);
  }  
}
