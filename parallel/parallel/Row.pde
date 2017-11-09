
class Row {
  ArrayList <Float>columnData = new ArrayList<Float>();
  float x1, y1, x2, y2; 
  int columnNumber;
  
  Row() {}
  
  void addColumnYCoord(float y) {
    columnData.add(y);
  }
  
  void setCoordinates() {
    float xpos = 2000 / columnNumber;          
      
    for (int i = 0; i < columnNumber-1; i++) {
      x1 = (xpos * i) + 60;
      y1 = columnData.get(i)+60;
      x2 = (xpos * (i+1)) + 60;
      y2 = columnData.get(i+1)+60;
      display(x1, y1, x2, y2);
      x2 = x1;        //reset x2 values
      y2 = y1;        //reset y2 values
    }
  }
  
  void setColumnNumber(int num) {
    columnNumber = num;
  }
  
  void display(float x1, float y1, float x2, float y2) {
    fill(232,235,50); 
    strokeWeight(0.01);
    stroke(0);
    line(x1,y1,x2,y2);
  }
}