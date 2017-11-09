
class Axis  {
  
  String label;
  float labelY = 30;
  float x;
  int weight = 2;
  float y1 = 60; 
  float y2 = 950;
  int index;
  float span;
  int r = 0, g =0, b = 0;
  
  boolean selected = false;
  
    
  Axis(String label)
  {
    this.label = label;
    //this.x = x;  
  }
   
  void display()
  {
    stroke(r,g,b);
    fill(0);
    textSize(16);
    strokeWeight(weight);
    textAlign(CENTER);
    text(label,x, labelY);
    line(x, y1, x, y2);
  }
  
  int checkSelected() {
    selected = true;
    weight = 5;
    r = 150;
    g = 25;
    b = 21;
    return index;
  }
  
  void updateX(int index) {
    x = span*(index) + 60;
  }
  
  
  void moveAxis(float mx) {
    if(selected) {
      x = mx;
    }
  }
  
  void unselect() {
    r = 0;
    g = 0;
    b = 0;
    weight = 2;
  }
  
}