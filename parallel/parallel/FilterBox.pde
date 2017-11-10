class FilterBox{
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  
  FilterBox(float mx, float my, float w, float h){
    x = mx;
    y = my;
    this.w = w;
    this.h = h;
  }
  
  void display() {
    stroke(2,8,122);
    strokeWeight(1);
    fill(2,8,122);
    rect(x,y,w,h);
  }
}