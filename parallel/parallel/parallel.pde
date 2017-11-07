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
Axis[] axes;



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
  
  //Currently selected axis
  int chosenAxis = -1;

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
    categoryCoord.put(categoryTypes.get(k).toString(), scale * k);
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
  
  //Change axis positions eventually
  int xpos = 1200 / tb.columnHeadings.size(); 
  
  axes = new Axis[tb.columnHeadings.size()];
  
  for (int i = 0; i< axes.length; i++) {
    
    String label = tb.columnHeadings.get(i).toString();
    fill(0);
    float labelX = xpos*(i)+19.5;
    float labelY = 120;
    //textSize(13);
    //textSize(9);
    //textAlign(CENTER);
    //text(label,xpos*(i)+19.5,120);
    float lineX1 = xpos*(i) + 19.5;
    float lineY1 = 150;
    float lineX2 = (xpos*(i))+19.5;
    float lineY2 = 850;
    Axis axis = new Axis(label, labelX, labelY, lineX1, lineY1, lineX2, lineY2);
    axes[i] = axis;
    axis.display();
    //line((xpos*(i))+19.5, 150, (xpos*(i))+19.5, 850);
  }
  
  //draw coordinates
  for (int i = 0; i < rows.length; i++) {      
    rows[i].setCoordinates();
  }
}

//------------------------------------------------------------------------------------
void mouseDragged() {
  
  //Make an Axis class in order to manipulate Axis objects easily
  
  
}

void mouseReleased() {
  
  
  
}