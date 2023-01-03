class Button {
  color fill; 
  String texts;
  float x, y; 
  Button(float xb, float yb, color filling, String text) {
      x = xb;
      y = yb; 
      fill = filling;
      texts = text;
  }
  void display() {
    stroke(255);
    strokeWeight(2);
    rectMode(CENTER);
    fill(0);
    rect(x,y, 200,100);
    textAlign(CENTER, CENTER);
    fill(fill);
    textSize(50);
    text(texts, x, y-10);
  }
 
    
}
