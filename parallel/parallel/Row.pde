
class Row {
  ArrayList columnData = new ArrayList();
  float x1, y1, x2, y2; 
  int columnNumber;
  
  Row() {}
  
  void addColumnYCoord(float y) {
    columnData.add(y);
  }
  
  void setCoordinates() {
    //for first column
    float xpos = 2000 / columnNumber;          
      x1 = 60;
      y1 = Float.valueOf(columnData.get(0).toString())+60;
      x2 = xpos + 60;
      y2 = Float.valueOf(columnData.get(1).toString())+60;
      display(x1, y1, x2, y2);
      
    //for all other columns
    for (int i = 1; i < columnNumber-1; i++) {
      x1 = (xpos * i) + 60;
      y1 = Float.valueOf(columnData.get(i).toString())+60;
      x2 = (xpos * (i+1)) + 60;
      y2 = Float.valueOf(columnData.get(i+1).toString())+60;
      display(x1, y1, x2, y2);
      x2 = x1;        //reset x2 values
      y2 = y1;        //reset y2 values
    }
  }
  
  void setColumnNumber(int num) {
    columnNumber = num;
  }
  
  void display(float x1, float y1, float x2, float y2) {
    pushMatrix();
    fill(0); 
    strokeWeight(0.01);
    stroke(0);
    line(x1,y1,x2,y2);
    popMatrix();
  }
}