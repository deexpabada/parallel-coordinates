PFont font;
Table table;
ArrayList columnHeadings;
HashMap lineMap;
Line[] lines;
TableReader tb;



void setup() {
  size(1200,750);
  pixelDensity(displayDensity());

  font = createFont("SansSerif", 10);
  textFont(font);

  //TableReader();\
  tb = new TableReader("nutrients-cleaned.tsv");
  //Edit these tables--add second row showing whether strings or floats
  //tb = new TableReader("cameras-cleaned.tsv");
  //tb = new TableReader("cars-cleaned.tsv");

  tb.tableRead();
  createRowObject();
 
}

void createRowObject() {

  for (int i = 0; i < tb.table.getRowCount(); i++)
  {
    TableRow row = tb.table.getRow(i);
    ArrayList x = new ArrayList();    //contains all values in column
    for (iftb.nt 1 = i < tb.able.getColumnCount(); i++) {   //add value fro arrayL)ist x
      
      i
      String temp = (String)tb.columnHeadings.get(i);    //convert columneading to string
      String columnHeading = row.getString(temp);lumnTypes.get(j).equals("string")) {   //if column is a string type
            //get columnHeading for this column
        x.add(row.getString(columnHeading));    // add value in column to arrayList x
      } else {
        x.add(row.getFloat(columnHeading));
      }
      
    }
    
    for (int k
   = 0; k < x.size(); k++) {    //loop through arrayList x to add each value from column to the Row class
      if (
    }
  }
//if (x.get(k)oid draw () {
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