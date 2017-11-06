PFont font;
Table table;
ArrayList columnHeadings;
HashMap lineMap;
Row[] rows;
TableReader tb;


void setup() {
  size(1200,750);
  pixelDensity(displayDensity());

  font = createFont("SansSerif", 10);
  textFont(font);

  //TableReader();\
  tb = new TableReader("nutrients-cleaned.tsv");
  //tb = new TableReader("cameras-cleaned.tsv");
  //tb = new TableReader("cars-cleaned.tsv");

  tb.tableRead();
  createRowObject();
}

void createRowObject() {        //create Row object for each row in table
  for (int i = 2; i < tb.table.getRowCount() ; i++) {      //iterate through rows 
    //TableRow row = tb.table.getRow(i);
    ArrayList columnValues = new ArrayList();        //array containing column values
    Row row = new Row();                              //initialize new row object
    for (int j = 1; j < tb.table.getColumnCount(); j++) {      //iterate through columns
      columnValues.add(tb.table.getString(i,j));            //add column value to array
    }
    
    for (int k = 0; k < columnValues.size(); k++) {        //iterate through columnValues list  
      if (tb.columnTypes.get(k).equals("string")) {        //if column is string type
        String value = columnValues.get(k).toString();      //get string version of column value
        row.addColumnString(value);          //add value to row object's array of values
      } else {                    //if column is float type
        Float value = Float.valueOf(columnValues.get(k).toString()); //convert to float
        row.addColumnFloat(value);       //add value to row object's array of values
      }
    }
  }
}


void draw () {
  background(255,204,204);
  
  //draw axes and columns
  int xpos = 1200 / tb.columnHeadings.size();  
  for (int i = 0; i<tb.columnHeadings.size(); i++) {
    String label = tb.columnHeadings.get(i).toString();
    fill(0);
    textSize(9);
    textAlign(CENTER);
    text(label,xpos*(i)+20,120);
    line(xpos*(i)+20,150,xpos*(i)+20,850);
   
  }
  
  //Probably start here for using Line objects
  
  //clear filter button
  fill(169,229,212);
  rect(1300,880,200,60);
  textSize(25);
  textAlign(CENTER);
  fill(0);
  text("clear", 1390,920);
}