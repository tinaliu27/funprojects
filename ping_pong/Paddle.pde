

class Paddle{
    float xp, yp, w, h, speedX, speedY;     //paddle location, wdith and height 
    color c;
    
    Paddle(float x, float y, float ww, float hh) {
      xp = x;
      yp = y;
       w = ww; 
       h = hh;
       speedY = 0;
       speedX = 0;
       c=(255);
      }
    void move() {
      xp += speedY;
      yp += speedX;
    }
    void display() {
      fill(c);
      line(xp-w/2, yp-h/2, w,h);
    }
    float left() {
        return xp-w/2;
    }
    float right() {
        return xp+w/2;
    }
    float top() {
      return yp-h/2;
    }
    float bottom() {
      return yp+h/2;
    }
}
