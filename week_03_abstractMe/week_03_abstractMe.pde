import toxi.color.*;
import toxi.util.datatypes.*;

import processing.pdf.*;

float print_width = 17;
float print_height = 23;

// This will help make the sketch window bigger
float make_bigger = 30;

int rectSize = 15;
int spacing = 10;

void setup() 
{
  size(round(print_width * make_bigger), round(print_height * make_bigger));
  beginRecord(PDF, "grab" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + "_" + millis() + ".pdf");
  background(70);
  smooth();
  stroke(0);
  colorMode(HSB, 1, 1, 1, 1);
  //background(0.3, 1, 1);
  fill(0, 0, 0, 0.3);
  noStroke();
  // rect(0, 0, width, height/3);
  // rect(0, height -height/3, width, height/3);
  stroke(0);
  line(width/2 - 50, height/8, width/6, height - 50);
  line(width/2 + 50, height/8, width - width/6, height - 50);
  // line(width/2, height-10, width/2, height/8+20);


  // first shape/layer
  // create a color range object ranges of hue, saturation and brightness
  FloatRange h = new FloatRange(0.9, 1.0);
  FloatRange s = new FloatRange(0.7, 1);
  FloatRange b = new FloatRange(0.9, 1);
  ColorRange range = new ColorRange(h, s, b, "My range");

  for (int i = 0; i < 20; i++)
  {
    TColor ranColor = range.getColor();
    fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness());
    noStroke();
    // ellipse(random(width), random(height/3), random(15, 50), random(15, 50));
    rect(random(100, width-100), random(height/3 - 50), random(15, 50), random(15, 50));
  }

  // second shape/layer
  h = new FloatRange(0.4, 0.7);
  s = new FloatRange(0.3, 0.8);
  b = new FloatRange(0.3, 1);
  //   h = new FloatRange(0.0, 0.1);
  //  s = new FloatRange(0.0, 0.3);
  //  b = new FloatRange(0.0, 0.4);
  ColorRange range2 = new ColorRange(h, s, b, "My range 2");

  int xPos = 0;
  for (int i = 0; i < 45; i++)
  {
    TColor ranColor = range2.getColor();
    fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness());
    noStroke();
    ellipse(random(width), random(height/3, height-height/3), random(10, 30), random(10, 30));
    //rect(random(width), random(height/3, height-height/3), random(10, 30), random(10, 30));
    //    rectMode(CENTER);
    //    rect(xPos, height/2, rectSize, 100);
    //    xPos += rectSize + spacing;
  }

  // third shape/layer
  h = new FloatRange(0.8, 1.0);
  s = new FloatRange(0.3, 0.8);
  b = new FloatRange(0.3, 1);
  ColorRange range3 = new ColorRange(h, s, b, "My range 3");

  for (int i = 0; i < 15; i++)
  {
    TColor ranColor = range3.getColor();
    fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness());
    noStroke();
    // ellipse(random(width), random(height-height/3, height),  random(20, 60), random(20, 60));
    //lines for bottom 3rd
    stroke(ranColor.hue(), ranColor.saturation(), ranColor.brightness());
    line(random(width), random(height-height/3, height), random(width), random(height-height/3, height));
  }
  endRecord();
}

