PFont font;
Table table;
ArrayList columnHeadings;
HashMap lineMap;
Line[] lines;

void setup() {
  size(1600,1500);
  pixelDensity(displayDensity());

  font = createFont("SansSerif", 10);
  textFont(font);

  TableReader();
}


void TableReader () {
  //table = loadTable("cameras-cleaned.tsv");
  table = loadTable("cars-cleaned.tsv");
  //table = loadTable("nutrients-cleaned.tsv");
  lines = new Line[table.getRowCount()];
  
  for (int i = 0; i<table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
  }

  //get column headings
  columnHeadings = new ArrayList();
  for (int i = 0; i<table.getColumnCount(); i++) {
    columnHeadings.add(table.getString(0, i));
  }
  
   for (int i = 0; i<columnHeadings.size();i++) {
     
   }
}

void draw () {
  background(255,204,204);
  
  //draw axes and columns
  int xpos = 1600 / columnHeadings.size();  
  for (int i = 1; i<columnHeadings.size(); i++) {
    String label = columnHeadings.get(i).toString();
    fill(0);
    textSize(13);
    textAlign(CENTER);
    text(label,xpos*(i),120);
    line(xpos*(i),150,xpos*(i),850);
  }
  
  //clear filter button
  fill(169,229,212);
  rect(1300,880,200,60);
  textSize(25);
  textAlign(CENTER);
  fill(0);
  text("clear", 1390,920);
}