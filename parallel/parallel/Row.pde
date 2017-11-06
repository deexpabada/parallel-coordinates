
class Row {
  ArrayList columnData = new ArrayList();
  float x1, x2, y1, y2;
  float spanConstant;
  
  Row(float spanConstant, ArrayList axesList) {
    spanConstant = spanConstant;
    axesList = axesList;
  }
  
  void addColumnString(String x) {
    columnData.add(x);
  }
  
  void addColumnFloat(Float x) {
    columnData.add(x);
  }
  
  void draw() {
    for (int i = 0; i < columnData.size(); i++) {
      x1 = (i * spanConstant) + 20;
      //y1 = axesList.get(i).columnData.get(i);
      x2 = ((i+1)*spanConstant + 20);
      //y2 = axesList.get(i+1).columnData.get(i+1);
    }
    
    line(x1,y1,x2,y2);
  }
}