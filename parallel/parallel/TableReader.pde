import java.util.Arrays;

class TableReader {
  Table table;
  String name;
  ArrayList columnHeadings = new ArrayList();
  ArrayList columnTypes = new ArrayList();
  
  
  TableReader(String name) {
    this.name = name;
  }
  
  
  void tableRead() {

     table = loadTable(name);
    
    //get column headings
    for (int i = 1; i<table.getColumnCount(); i++) {  //iterate over columns that is not the first column

      columnHeadings.add(table.getString(0, i));      //Example: group, protein, carbs, etc.
      String tempType = table.getString(1,i);         //get type of data of column: string, float, etc.
      columnTypes.add(tempType);    
    }
  }
}