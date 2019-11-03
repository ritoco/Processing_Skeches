ArrayList<Bubble> bubbles;

void setup() {
  size( 800, 800 );
  colorMode(HSB, 360, 100, 100, 100);
  smooth();  
  noLoop();
  background( 0, 0, 100 );

  bubbles = new ArrayList<Bubble>();
  for ( int i = 0; i < 20; ++i ) {
    bubbles.add( new Bubble() );
  }
}
void draw() {
  moyou();
  for ( Bubble b : bubbles ) {
    b.run();
  }
}
class Bubble {
  int shapeWidth;
  int shapeHeight;
  color col;
  PVector pos;

  Bubble() {


    shapeWidth = int( random(200, 250) );
    shapeHeight = int( random(200, 250) );
    col = color( 360/random(9), 100, 100);
    pos = new PVector( random(width), random(height) );
  }

  void run() {

    update();
    display();
  }

  void update() {
    float temp;

    temp = pos.x + random(-100, 100);
    if ( 0 < temp && temp < width ) {
      pos.x = temp;
    }
    temp = pos.y + random(-100, 100);
    if ( 0 < temp && temp < height ) {
      pos.y = temp;
    }
  }

  void display() {
    fill( col, 1);


    noStroke();
    rect( pos.x, pos.y, shapeWidth, shapeHeight  );
  }
}

void moyou() {

  for ( int i2 = 0; i2 < 10; ++i2 ) { 

      for ( int i = 0; i < 10; ++i ) { 

        fill( 0, 0, 0);
        noFill();
        strokeWeight(20);
        ellipse(i*200, i2*200, 200, 200);
        blendMode(BLEND);
    }
  }
}


// SaveImage
void keyPressed() {
  if (key == 'p' || key == 'P') {
    saveFrame("line-######.png");
    pixelDensity(displayDensity());
  }

  if (key == 'a' || key == 'A') {
    redraw();
  }
}



/* -----------------------
 
 出典
 Processing Tutorial
 http://jkoba.net/prototyping/processing/basic_class_practice.html
 
 -------------------------*/
