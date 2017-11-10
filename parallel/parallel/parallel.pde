PFont font;
Table table;
TableReader tb;
ArrayList <String>columnHeadings;
ArrayList <String>categoryTypes = new ArrayList();
HashMap<String, Float> categoryCoord;
Row[] rows;
ArrayList<Axis> axes = new ArrayList<Axis>();
int selectedAxisIndex;
float[] minList, maxList;
float columnHeight = 900;
boolean clicked = false;
boolean locked = false;
float xOffset = 0.0, yOffset = 0.0;
boolean overlabel = false;
boolean overAxis = false;
float span;
int yoffset = 80;



void setup() {
  //size(2200,1200, P2D);
  fullScreen(P2D);
  pixelDensity(displayDensity());
 

  font = createFont("Verdana", 10);
  textFont(font);

  //Read Tables
  //tb = new TableReader("nutrients-cleaned.tsv");
  //tb = new TableReader("cameras-cleaned.tsv");
  tb = new TableReader("cars-cleaned.tsv");

  tb.tableRead();
  createLists();

    
  //Change axis positions eventually
  span = 2000 / tb.columnHeadings.size(); 
  
  for (int i = 0; i< tb.columnHeadings.size(); i++) {
    String label = tb.columnHeadings.get(i);
    Axis axis = new Axis(label);
    axes.add(axis);
    axis.span = span;
    axis.updateX(axes.indexOf(axis));
  }
}


//Creates lists of maxs, mins, and category values for a given row of data.
void createLists() {        
  rows = new Row[tb.table.getRowCount()-2];                //Only consider rows that will produce lines
  
  for (int i = 2; i < tb.table.getRowCount() ; i++) {      //iterate through rows 2:tb.table.getRowCount();
  
    minList = new float[tb.table.getColumnCount()];        //List of mins for a given category
    maxList = new float[tb.table.getColumnCount()];        //List of maxs for a given category
    rows[i-2] = new Row();                                 //Create new row to add to rows list
    ArrayList columnValues = new ArrayList();              //array containing column values
    
    for (int j = 1; j < tb.table.getColumnCount(); j++) {  //iterate through columns of the table of data
    
      columnValues.add(tb.table.getString(i,j));           //Get of the value of current intersection of row and column (i and j)
      
      if (tb.columnTypes.get(j-1).equals("string")) {      //If the previous column corresponds to a string value
        getCategoryTypes(j);                               //add category types to list
        categoryLocations();                               //generate y val for string categories
        float y1 = categoryCoord.get(columnValues.get(j-1));  //get y coord when "string" is used as a key
                                                              //columnValues.get(j-1) = "string"
        rows[i-2].addColumnYCoord(y1);                        //add y coordinate to row object
        
      } else {                                             //if the i,j intersection is a float value
        getMinMax(j);      //add min, max vlaues to list          //get min, max for each column
        float span = maxList[j] - minList[j];
        float scale = columnHeight / span;                        //Determines how line gets placed in axis
        float actualValue = Float.valueOf(columnValues.get(j-1).toString());  //Get "actual" value from stored row/column intersections
        float scaledPoint = maxList[j] - actualValue;
        float y1 = columnHeight - (scale * scaledPoint);
        rows[i-2].addColumnYCoord(y1);                              //add y coordinate to row object
      }
    }
    rows[i-2].setColumnNumber(columnValues.size());                 //number of columns
  }
}

//Return locations of categories
void categoryLocations() {
  
  float scale = columnHeight / categoryTypes.size();
  categoryCoord = new HashMap<String, Float>();                    //Map that will hold string value and its corresponding y-value
  
  for (int k = 0; k <categoryTypes.size(); k++) {                  //Loop through each string category
    categoryCoord.put(categoryTypes.get(k), scale * k);
  }
}


//Return ArrayList of categoryTypes
//For string values in the data ONLY
void getCategoryTypes(int column) {                                    //Considers one column

  for (int i = 2; i<tb.table.getRowCount(); i++) {                     //Loop through each row within that column
    
    if (!(categoryTypes.contains((tb.table.getString(i, column))))) {  //If categoryTypes does not already contain the string value being considered..
      categoryTypes.add(tb.table.getString(i, column));                //...add to categoryTypes 
    }
  }  
}

//Return array of floats with max and min for each axis
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
  background(255); 
  
  //draw coordinates
  for (int i = 0; i < rows.length; i++) {
    rows[i].setCoordinates();
  }
  
  //draw axes
  for (int i = 0; i<axes.size(); i++) {
    axes.get(i).display();
    
    //test if cursor is  over a label
    if (mouseX > axes.get(i).x - 10 && (mouseX < axes.get(i).x+10)) {
      overlabel = true;
      overAxis = true;
      if (!locked) {
        selectedAxisIndex = i;
      }
    }
    if (mouseY > 90) {
      overlabel = false;
    }
    
    if (!overAxis) {
      selectedAxisIndex = -1;
    }
  }

}

void mousePressed() {
  if(overlabel) {
    locked = true;
  } else {
    locked = false;
  }
  if (overlabel && selectedAxisIndex != -1) {
  xOffset = mouseX - axes.get(selectedAxisIndex).x;
  }
  
  if( overAxis && !overlabel && selectedAxisIndex != - 1) {
    axes.get(selectedAxisIndex).boxy = mouseY;
    axes.get(selectedAxisIndex).makeBox();
  }
}

void mouseDragged() {
  if(overlabel && locked && selectedAxisIndex != -1){
    axes.get(selectedAxisIndex).x = mouseX - xOffset;
    axes.get(selectedAxisIndex).checkSelected();
  }
  if (overAxis && !overlabel && selectedAxisIndex != -1) {
    axes.get(selectedAxisIndex).boxw = 10;
    axes.get(selectedAxisIndex).boxh = mouseY - axes.get(selectedAxisIndex).boxy;
  }
}

void mouseReleased(){
  if (overlabel && selectedAxisIndex != -1) {
    locked=false;
    reorderAxis();
  }
  if (selectedAxisIndex != -1) {
    filtered();
  }
  selectedAxisIndex = -1;
}

void filtered() {
  for (int i = 0; i<rows.length; i++) {
      if (rows[i].columnData.get(selectedAxisIndex) + yoffset > axes.get(selectedAxisIndex).maxY) {
        rows[i].display = false;
    }
     if (rows[i].columnData.get(selectedAxisIndex) + yoffset < axes.get(selectedAxisIndex).minY) {
        rows[i].display = false;
    }
  }
}

void reorderAxis() {
  axes.get(selectedAxisIndex).unselect();
  span = 2200 / tb.columnHeadings.size();
  int closestIndex = -1;
  float smallestDistance = 1000;
  for (int i = 0; i < tb.columnHeadings.size(); i++) {
    float distance = abs(mouseX - axes.get(i).x);
    if (i != selectedAxisIndex && distance < smallestDistance) {
      closestIndex = i;
      smallestDistance = distance;
    }
  }  
  Axis temp = axes.get(selectedAxisIndex);
  axes.remove(selectedAxisIndex);
  axes.add(closestIndex, temp);
  
  //remap rows
  for (Row row: rows) {
    float rowtemp = row.columnData.get(selectedAxisIndex);
    row.columnData.remove(selectedAxisIndex);
    row.columnData.add(closestIndex, rowtemp);
    
  }
  for (int i = 0; i < axes.size(); i++) {
    axes.get(i).updateX(i);
  }
}