
class Axis  {
  
  String label;
  float labelX;
  float labelY;
  float x1;
  float y1;
  float x2; 
  float y2;
  
  boolean isDisplaced;
  
    
  Axis(String label, float labelX, float labelY, float x1, float y1, float x2, float y2)
  {
    this.label = label;
    this.labelX = labelX;
    this.labelY = labelY;
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;    
  }
   
  void display()
  {
    textSize(13);
    textSize(9);
    textAlign(CENTER);
    text(label,labelX, labelY);
    line(x1, y1, x2, y2);
  }
  
}