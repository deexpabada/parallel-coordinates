import java.util.Arrays;

class TableReader {
  Table table;
  String name;
  ArrayList columnHeadings;
  ArrayList axesList = new ArrayList();
  float columnHeight = 700;
  ArrayList columnTypes = new ArrayList();
  
  
  TableReader(String name) {
    this.name = name;
  }
  
  
  void tableRead() {
    
    table = loadTable(name);
    
    //get column headings
    columnHeadings = new ArrayList();
    for (int i = 1; i<table.getColumnCount(); i++) {  //iterate over columns that is not the first column
      columnHeadings.add(table.getString(0, i));      //add column headings to a list
      
      String tempType = table.getString(1,i);         //get type of data of column
      columnTypes.add(tempType);
      
      }
    }
}   