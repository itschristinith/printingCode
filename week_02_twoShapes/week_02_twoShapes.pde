import processing.pdf.*;

// Set these variables to the print size you want (in inches)
// The resulting PDF will be this aspect ratio
float print_width = 17;
float print_height = 23;

// This will help make the sketch window bigger
float make_bigger = 30;

void setup()
{  
  size(round(print_width * make_bigger), round(print_height * make_bigger));

  beginRecord(PDF, "grab" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + "_" + millis() + ".pdf");

  smooth();
  background(255);
  translate(width / 3, height / 3);

  int circleRadiusSh = 70;
  float numVerticesSh = 10;
  float vertexDegreeSh = 360 / numVerticesSh;
  int spikesSh = 40;

  int circleRadiusW = 100;
  float numVerticesW = 8;
  float vertexDegreeW = 360 / numVerticesW;
  int spikesW = 40;

  beginShape();
  for (int i = 0; i < numVerticesSh +1; i++)
  {
    float x = cos(radians(i * vertexDegreeSh)) * circleRadiusSh;
    float y = sin(radians(i * vertexDegreeSh)) * circleRadiusSh;
    fill(255);
    stroke(0);
    vertex(x+spikesSh, y+spikesSh);
    spikesSh = spikesSh*-1;
  }
  endShape();

  translate(width/3 +30, height/3+30);
  beginShape();
  for (int i = 0; i < numVerticesW; i++)
  {
    float x = cos(radians(i * vertexDegreeW)) * circleRadiusW;
    float y = sin(radians(i * vertexDegreeW)) * circleRadiusW;
    fill(0);
    stroke(255);
    curveVertex(x+spikesW, y+spikesW);
    spikesW = spikesW*-1;
  }
  endShape();

  endRecord();
}

