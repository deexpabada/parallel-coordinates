PFont font;
Table table;
ArrayList columnHeadings;
Row[] rows;
TableReader tb;
float[] minList;
float[] maxList;
ArrayList categoryTypes = new ArrayList();
float columnHeight = 700;
HashMap<String, Float> categoryCoord;


void setup() {
  size(1200,900);
  pixelDensity(displayDensity());

  font = createFont("SansSerif", 10);
  textFont(font);

  //Read Tables
  //tb = new TableReader("nutrients-cleaned.tsv");
  tb = new TableReader("cameras-cleaned.tsv");
  //tb = new TableReader("cars-cleaned.tsv");

  tb.tableRead();
  createLists();

}

void createLists() {        //create lists with max, min, category values
  rows = new Row[tb.table.getRowCount()-2];
  for (int i = 2; i < tb.table.getRowCount() ; i++) {      //iterate through rows 2:tb.table.getRowCount();
    minList = new float[tb.table.getColumnCount()];
    maxList = new float[tb.table.getColumnCount()];
    rows[i-2] = new Row();
    ArrayList columnValues = new ArrayList();        //array containing column values
    for (int j = 1; j < tb.table.getColumnCount(); j++) {      //iterate through columns
      columnValues.add(tb.table.getString(i,j));            //add column value to array
      
      if (tb.columnTypes.get(j-1).equals("string")) {
        getCategoryTypes(j);      //add category types to list
        categoryLocations();                                    //generate y val for string categories
        float y1 = categoryCoord.get(columnValues.get(j-1));      //get y coord
        rows[i-2].addColumnYCoord(y1);                              //add y coordinate to row object
        
      } else {                                            //if float
        getMinMax(j);      //add min, max vlaues to list          //get min, max for each column
        float span = maxList[j] - minList[j];
        float scale = columnHeight / span;
        float actualValue = Float.valueOf(columnValues.get(j-1).toString());
        float scaledPoint = maxList[j] - actualValue;
        float y1 = columnHeight - (scale * scaledPoint);
        rows[i-2].addColumnYCoord(y1);                              //add y coordinate to row object
      }
    }
    rows[i-2].setColumnNumber(columnValues.size());                        //number of columns
  }
}

//return locations of categories
void categoryLocations() {
  float scale = columnHeight / categoryTypes.size();
  categoryCoord = new HashMap<String, Float>();
  for (int k = 0; k<categoryTypes.size(); k++) {
    categoryCoord.put(categoryTypes.get(k).toString(), scale * k);
  }
}


//return ArrayList of categoryTypes
void getCategoryTypes(int column) {  
  for (int i = 2; i<tb.table.getRowCount(); i++) {
    if (!(categoryTypes.contains((tb.table.getString(i, column))))) {
      categoryTypes.add(tb.table.getString(i, column));
    }
  }  
}

//return array of floats with max and min for each column
void getMinMax(int column) {
  float[] numList = new float[tb.table.getRowCount()-2];
  int x = 0;
  float min, max;
  for (int i = 2; i<tb.table.getRowCount(); i++) {
    numList[x] = tb.table.getFloat(i, column);
    x++;
  }
  
  Arrays.sort(numList);
  min = numList[0];
  max = numList[numList.length-1];
  minList[column] = min;
  maxList[column] = max;
}
  

void draw () {
  background(255,204,204);
  
  //draw axes and columns
  int xpos = 1200 / tb.columnHeadings.size();  
  for (int i = 0; i<tb.columnHeadings.size(); i++) {
    String label = tb.columnHeadings.get(i).toString();
    fill(0);
    textSize(10);
    textAlign(CENTER);
    text(label,xpos*(i)+20,120);
    line(xpos*(i)+20,150,xpos*(i)+20,850);
  }
  
  //draw coordinates
  for (int i = 0; i < rows.length; i++) {      
    rows[i].setCoordinates();
  }
}