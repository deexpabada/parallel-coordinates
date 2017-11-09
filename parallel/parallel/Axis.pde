
class Axis  {
  
  String label;
  float labelY = 30;
  float x;
  int weight = 1;
  float y1 = 60; 
  float y2 = 950;
  int index;
  int r = 0, g =0, b = 0;
  
  boolean selected = false;
  
    
  Axis(String label, float x)
  {
    this.label = label;
    this.x = x;  
  }
   
  void display()
  {
    pushMatrix();
    stroke(r,g,b);
    textSize(16);
    strokeWeight(weight);
    textAlign(CENTER);
    text(label,x, labelY);
    line(x, y1, x, y2);
    popMatrix();
  }
  
  int checkSelected() {
    selected = true;
    weight = 3;
    r = 255;
    g = 0;
    b = 0;
    return index;
  }
  
  void updateX(float xpos) {
    x = xpos*(index) + 60;
  }
  
  
  void moveAxis(float mx) {
    if(selected) {
      x = mx;
    }
  }
}