class FilterBox{
  float x = 0;
  float y = 0;
  float h = 0;
  
  FilterBox(float mx, float my){
    x = mx;
    y = my;
  }
  
  void display() {
    stroke(81,86,75);
    strokeWeight(1);
    fill(81,86,75);
    rect(x,y,10,h);
  }
}