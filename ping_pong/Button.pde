class Button {
  color fill; 
  String texts;
  Button(color filling, String text) {
      fill = filling;
      texts = text;
  }
  void display() {
    stroke(255);
    strokeWeight(2);
    rectMode(CENTER);
    fill(0);
    rect(width/2,height/2, 200,100);
    textAlign(CENTER, CENTER);
    fill(0, 408, 612, 816);
    textSize(50);
    text(texts, 400, 290);
  }
 
    
}
