
class Row {
  ArrayList columnData = new ArrayList();
  float x1, y1, x2, y2; 
  int columnNumber;
  
  Row() {
  }
  
  void addColumnYCoord(float y) {
    columnData.add(y);
  }
  
  void setCoordinates() {
    float xpos = 1200 / columnNumber;
      x1 = 20;
      y1 = Float.valueOf(columnData.get(0).toString())+150;
      x2 = xpos + 20;
      y2 = Float.valueOf(columnData.get(1).toString())+150;
      display(x1, y1, x2, y2);
    for (int i = 1; i < columnNumber-1; i++) {
      x1 = (xpos * i) + 20;
      y1 = Float.valueOf(columnData.get(i).toString())+150;
      x2 = (xpos * (i+1)) + 20;
      y2 = Float.valueOf(columnData.get(i+1).toString())+150;
      display(x1, y1, x2, y2);
      x2 = x1;
      y2 = y1;
    }
    
  }
  
  void setColumnNumber(int num) {
    columnNumber = num;
  }
  
  void display(float x1, float y1, float x2, float y2) {
    fill(0); 
    strokeWeight(0.01);
    line(x1,y1,x2,y2);
  }
}