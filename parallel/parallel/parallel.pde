PFont font;
Table table;
ArrayList columnHeadings;

void setup() {
  size(2000,1500);
  pixelDensity(displayDensity());

  font = createFont("SansSerif", 10);
  textFont(font);

  loadData();
}


void loadData () {
  table = loadTable("cars-cleaned.tsv");

  for (int i = 0; i<table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
  }

  //get column headings
  columnHeadings = new ArrayList();
  for (int i = 0; i<table.getColumnCount()-1; i++) {
    columnHeadings.add(table.getString(0, i));
  }
    print(columnHeadings);
  
}