import processing.pdf.*;
import geomerative.*;

boolean savePDF = false;

void setup() 
{
   size(1280, 900);
  //background(#FFEEE0, 15);
    println("Saving PDF");
    beginRecord(PDF, "grab" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + "_" + millis() + ".pdf"); 
  
  background(255);
  smooth();
  fill(0);
  noStroke();


  int fontSize = 400;

  // initialize the geomerative library
  RG.init(this);

  // create a new font
  RFont font = new RFont("FreeSans.ttf", fontSize, RFont.LEFT);

  // before we generate anything, we need to tell the library how long we want between the points of the font
  RCommand.setSegmentLength(25);

  // We can also tell it how to space them out
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  //RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  //RCommand.setSegmentator(RCommand.ADAPTATIVE); 

  // get a group from a word. Because we want the reduced points, we need to call toPolygonGroup,
  // because otherwise we would get the actual vertices
  RGroup group = font.toGroup("radish").toPolygonGroup();

  //translate(100, 300);
  translate((width / 2) - (group.getWidth() / 2)-25, (height / 2) + 2*(group.getHeight() /3 ));

  // now loop through the polygons in the group
  for (int k = 0; k < group.elements.length; k++)
  {
    // now get each character as a polygon
    RPolygon polygon = (RPolygon) group.elements[k];

    // because a character has multiple contours (the whole in the 'a' is one, the outline another),
    // let's loop through all the contours first
    for (int i = 0; i < polygon.contours.length; i++)
    {
      // for each contour, let's loop through all the points

      RContour curContour = polygon.contours[i];
      for (int j = 0; j < curContour.points.length; j++)
      {

        RPoint stalkX = polygon.getCenter();
        RPoint stalkY = polygon.getTopRight();
        //the stalks
        smooth();
        fill(255, 50);
        noStroke();
        //strokeWeight(2);
        triangle(stalkX.x, stalkY.y, stalkX.x - 30, stalkY.y -135, stalkX.x+10, stalkY.y - 150);
        triangle(stalkX.x, stalkY.y, stalkX.x + 20, stalkY.y -125, stalkX.x + 60, stalkY.y - 100);

        fill(#779951, 85);
        //stroke(#779951, 85);
        noStroke();
        strokeWeight(2);
        triangle(stalkX.x, stalkY.y, stalkX.x - 30, stalkY.y -135, stalkX.x+10, stalkY.y - 150);
        triangle(stalkX.x, stalkY.y, stalkX.x + 20, stalkY.y -125, stalkX.x + 60, stalkY.y - 100);


        //the roots
//        fill(#6F4427, 5);
//        ellipse(stalkX.x, stalkX.y, 20, 20);

        // now for each RPoint (which is a vector), make an ellipse
        RPoint curPoint = curContour.points[j];
        fill(255);
        stroke(#CE2B64);
        strokeWeight(2);
        ellipse(curPoint.x, curPoint.y, 20, 20);
        stroke(#CE2B64, 150);
        strokeWeight(1);
        ellipse(curPoint.x, curPoint.y, 17, 17);
        ellipse(curPoint.x, curPoint.y, 15, 15);
        stroke(#CE2B64, 100);
        fill(#CE2B64, 15);
        ellipse(curPoint.x, curPoint.y, 13, 13);

        //        ellipse(curPoint.x, curPoint.y, 11, 11);
        //        fill(#CE2B64, 15);
        //        strokeWeight(1);
        //        ellipse(curPoint.x, curPoint.y, 10, 10);
      }
    }
  }
    endRecord();
    println("Saved PDF");
}



