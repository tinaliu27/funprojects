class Button {
  color fill; 
  String texts;
  float x, y, w,h;
  Button(float xb, float yb, float w, float h, color filling, String text) {
      x = xb;
      y = yb; 
      this.w=w;
      this.h=h;
      fill = filling;
      texts = text;
  }
  void display() {
    stroke(255);
    strokeWeight(2);
    fill(0);
    rect(x+30,y-20, 200,100);
    fill(fill);
    textSize(50);
    text(texts, x+80, y+50);
  }
 
    
}
