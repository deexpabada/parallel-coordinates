import java.util.Arrays;

class TableReader {
  Table table;
  String name;
  ArrayList columnHeadings;
  ArrayList axesList = new ArrayList();;
  float columnHeight = 700;
  
  TableReader(String name) {
    this.name = name;
  }
  
  void tableRead() {
    table = loadTable(name);
    
    //get column headings
    columnHeadings = new ArrayList();
    for (int i = 1; i<table.getColumnCount(); i++) {  //iterate over columns that is not the first column
      columnHeadings.add(table.getString(0, i));    //add column headings to a list
      String tempType = table.getString(1,i);      //get type of data of column

      if (tempType.equals("string")) {    //if string column
          axesList.add(isString(i));      //call isString method to get unique categories, returns a map; add map to axesList
      } else {
          axesList.add(isFloat(i));
        }
      }
      //print(axesList);
    }
    
  //Store unique categories in a list and return a map of categories  
  HashMap isString(int column) {
    ArrayList categoryTypes = new ArrayList();
    HashMap yCoordMap = new HashMap();
    
    for (int i = 2; i<table.getRowCount(); i++) {        //starting at row 2 check for categories
      if (!(categoryTypes.contains((table.getString(i, column))))) {   //if unique category...
        categoryTypes.add(table.getString(i, column));            //...add to categoryTypes list
      }
    }
    

    float scale = columnHeight / categoryTypes.size();        //create scale: columnHeight / # of unique categories
    for (int i = 0; i<categoryTypes.size(); i++) {            
      yCoordMap.put(categoryTypes.get(i),scale * i);        //create hashmap with categories as keys and y coordinate as values
    }
    
    return yCoordMap;
  }
  
  HashMap isFloat(int column) {
    float[] numList = new float[table.getRowCount()-2];
    int x = 0;
    float min, max, actualValue, scale, scaledPoint, y, span;
    HashMap yCoordMap = new HashMap();
    
    for (int i = 2; i<table.getRowCount(); i++) {
      numList[x] = table.getFloat(i, column);    //contains all actual values
      x++;
    }
    Arrays.sort(numList);      //sort from min to max
    min = numList[0];          //min from column
    max = numList[numList.length-1];  //max from column
    span = max - min;        
    scale = columnHeight / span;    //scale
    for (int i = 2; i<table.getRowCount(); i++) {        
      actualValue = table.getFloat(i, column);        //actual value
      scaledPoint = actualValue - span;
      y = columnHeight - (scale * scaledPoint);      //y value for each data point
      y = Math.abs(y);
      print(y, "\n");
      yCoordMap.put(actualValue, y);    //create hashmap with actualValues as keys and y coordinates as values;
    }
    
    return yCoordMap;
  }
}