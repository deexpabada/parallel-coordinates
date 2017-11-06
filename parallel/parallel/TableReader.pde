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
     table = loadTable(name);
    
    //get column headings
    for (int i = 1; i<table.getColumnCount(); i++) {  //iterate over columns that is not the first column
      columnHeadings.add(table.getString(0, i));
      String tempType = table.getString(1,i);         //get type of data of column
      columnTypes.add(tempType);    
 
      if (tempType.equals("string")) {                //if string column
          axesList.add(isString(i));                  //call isString method to get unique categories, returns a map; add map to axesList
      } else {
          axesList.add(isFloat(i));
        }
      }
      
    }s}
   
  //Store unique categories in a list and return a map of categories  
  HashMap isString(int column) {
    
    ArrayList categoryTypes = new ArrayList();
    HashMap yCoordMap = new HashMap();
    
    for (int i = 2; i<table.getRowCount(); i++) {                       //starting at row 2 check for categories (looping through an entire column)
      if (!(categoryTypes.contains((table.getString(i, column))))) {    //if unique category...
        categoryTypes.add(table.getString(i, column));                  //...add to categoryTypes list
      }
    }
    //print(categoryTypes);
    
    float scale = columnHeight / categoryTypes.size();        //create scale: columnHeight / # of unique categories
    for (int i = 0; i<categoryTypes.size(); i++) {            
      yCoordMap.put(categoryTypes.get(i),scale * i);          //create hashmap with categories as keys and y coordinate as values
                                                              //Y coordinates define where a line starts for this category
    }
    //print(yCoordMap);
    return yCoordMap;
  }
  
  
  //Store float values in an array and then find the max and min of the category.
  //Returns hashmap with numbers in the data as keys and y coordinates as values.
  HashMap isFloat(int column) {
    
    float[] numList = new float[table.getRowCount()-2];
    int x = 0;
    float min, max, actualValue, scale, scaledPoint, y, span;
    HashMap yCoordMap = new HashMap();
    
    for (int i = 2; i<table.getRowCount(); i++) {
      numList[x] = table.getFloat(i, column);          //Fill numList with "actual values"
      x++;
    }
    
    Arrays.sort(numList);                              //sort from min to max
    min = numList[0];                                  //min from column
    max = numList[numList.length-1];                   //max from column
    span = max - min;        
    scale = columnHeight / span;                       //scale
    
    for (int i = 2; i<table.getRowCount(); i++) {        
      actualValue = table.getFloat(i, column);        //actual value
      scaledPoint = max - actualValue;
      y = columnHeight - (scale * scaledPoint);      //y value for each data point
      yCoordMap.put(actualValue, y);    //create hashmap with actualValues as keys and y coordinates as values;
    }
    
    return yCoordMap;
  }
}