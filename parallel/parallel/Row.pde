
class Row {
  ArrayList <Float>columnData = new ArrayList<Float>();
  float x1, y1, x2, y2; 
  int columnNumber;
  int yoffset = 80;
  int xoffset = 60;
  
  Row() {}
  
  void addColumnYCoord(float y) {
    columnData.add(y);
  }
  
  void setCoordinates() {
    float xpos = 2000 / columnNumber;          
      
    for (int i = 0; i < columnNumber-1; i++) {
      x1 = (xpos * i) + xoffset;
      y1 = columnData.get(i)+yoffset;
      x2 = (xpos * (i+1)) + xoffset;
      y2 = columnData.get(i+1)+yoffset;
      display(x1, y1, x2, y2);
      x2 = x1;        //reset x2 values
      y2 = y1;        //reset y2 values
    }
  }
  
  void setColumnNumber(int num) {
    columnNumber = num;
  }
  
  void display(float x1, float y1, float x2, float y2) {
    strokeWeight(1);
    stroke(112,175,150);
    line(x1,y1,x2,y2);
  }
}