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
  //tb = new TableReader("cameras-cleaned.tsv");
  //tb = new TableReader("cars-cleaned.tsv");

  tb.tableRead();
}

void draw () {
  background(255,204,204);
  
  //draw axes and columns
  int xpos = 1200 / tb.columnHeadings.size();  
  for (int i = 1; i<tb.columnHeadings.size(); i++) {
    String label = tb.columnHeadings.get(i).toString();
    fill(0);
    textSize(9);
    textAlign(CENTER);
    text(label,xpos*(i),120);
    line(xpos*(i),150,xpos*(i),850);
   
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