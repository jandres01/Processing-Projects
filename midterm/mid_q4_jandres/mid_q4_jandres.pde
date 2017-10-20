ArrayList<q4Data> q4Array = new ArrayList<q4Data>();
BufferedReader reader;
String line = "grablines";
//ArrayList<curseData> curseArray = new ArrayList<curseData>();

void setup() {
  size(800,600);
  background(255);
  reader = createReader("tarantino copy.txt");
}

void draw() {
  fillArray();
  drawScatterPlot();
}

void drawScatterPlot() {
  
  strokeWeight(3);
 // line(50, 50, 50, 550);
  line(50, 550, 700, 550); 
  fill(0);
  for(int i =0; i<9;i++) {
    line(50+((700-50)/8)*i, 50, 50+((700-50)/8)*i, 550);
    text(2000+i,35+((700-50)/8)*i,40);
  }
  
  for(int lbl =0; lbl<8; lbl++) {
    float y= map(10*lbl,70,0,60,550);
    text(10*lbl,30,y);
  }
  text("Homicide Rates per 100,000 per year", 275, 575);
  
  for(int i =1; i< q4Array.size(); i++) {
    ArrayList<Float> yearValues = new ArrayList<Float>();
    yearValues.add(q4Array.get(i).yr1); 
    yearValues.add(q4Array.get(i).yr2); 
    yearValues.add(q4Array.get(i).yr3);
    yearValues.add(q4Array.get(i).yr4);
    yearValues.add(q4Array.get(i).yr5);
    yearValues.add(q4Array.get(i).yr6);
    yearValues.add(q4Array.get(i).yr7);
    yearValues.add(q4Array.get(i).yr8);
    yearValues.add(q4Array.get(i).yr9);
    float y1= map(yearValues.get(0),0,70,50,550);
    println(yearValues.size());
    for(int j =0; j<9;j++) {
      float y2= map(yearValues.get(j),70,0,60,550);
      if(j!=0) {
        strokeWeight(1);
        stroke(211,211,211);
        float x1 = 50+((700-50)/8)*(j-1);
        float x2 = 50+((700-50)/8)*j;
        line(x1, y1, x2,y2);
      }
      y1 = y2;
    }
  }
   
  
  //strokeWeight(5);
  //stroke(0);
  //for(int i = 0; i < curseTimes.size(); i++) {
  //  float x = map(curseTimes.get(i),0, findMaxOfCurseTimes(), 100, 575);
  //  numOccur += 1;
  //  float y = map(numOccur, 0, curseTimes.size(), 550, 50);
  //  //println("x = " + x + " y = " + y);
  //  //line(x, y, 0,0);
  //  Points pnt = new Points(x, y, "Reservoir Dogs", curseTimes.get(i), "dick", 0);
  //  pnt.display();
  //}
}


void fillArray() {
  while(line != null) {
    try {
      line = reader.readLine();
    } catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) {
      // Stop reading because of an error or file is empty
      noLoop();  
    } else {
      String[] list = split(line, "\t");
      q4Data tmpData = new q4Data(list[0], list[1], float(list[2]), float(list[3]),float(list[4]), float(list[5]),float(list[6]), float(list[7]),float(list[8]), float(list[9]),float(list[10])); 
      q4Array.add(tmpData);
    } 
  }
  //sets up margins for data]
    //println("data is = "+q4Array.get(i));
  //}
  //barGraphFilter();
}