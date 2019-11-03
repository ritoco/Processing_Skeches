// bubble
ArrayList<Coloring> colors;

void setup() {
  size( 600, 600 );
  colorMode(HSB, 360, 100, 100, 100);
  smooth();  
  background( 220, 10, 100 );
  material();
  colors = new ArrayList<Coloring>();
  for ( int i = 0; i < 15; ++i ) {
    colors.add( new Coloring() );
  }
  //noLoop();
}

void draw() {
  for ( Coloring b : colors ) {
    b.run();
  }
}

class Coloring {
  int shapeWidth;
  int shapeHeight;
  color col;
  PVector position;

  Coloring() {
    shapeWidth = int( random(100, 150) );
    //shapeHeight = int( random(20, 50) );
    col = color( 360/random(2), 100, 100);
    position = new PVector( random(width), random(height) );
  }
  void run() {
    pattern();
    update();
    output();
  }
  
  void update() {
    float colorShape;
    colorShape = position.x + random(-50, 50);
    if ( 0 < colorShape && colorShape < width ) {
      position.x = colorShape;
    }
    colorShape = position.y + random(-50, 50);
    if ( 0 < colorShape && colorShape < height ) {
      position.y = colorShape;
    }
  }
  void output() {
    fill( col, 2);
    blendMode(ADD);
    noStroke();
    ellipse( position.x, position.y, shapeWidth, shapeWidth  );
  }
}
// pattern
void pattern() {
  for ( int tate = 0; tate < 10; tate++ ) { 
    for ( int yoko= 0; yoko < 10; yoko++ ) { 
      noStroke();
      fill(0);
      ellipse(yoko*150, tate*150, 150, 150);
    }
  }
}
// material
void material() {
  for (int py = 0; py < height; py ++) {
    for (int px = 0; px < width; px ++) {
      pushMatrix();
      //blendMode(ADD);
      stroke( 0, 0, 10);
      translate(px, py);
      point(random(px), random(py));
      popMatrix();
    }
  }
}

// SaveImage
void keyPressed() {
  if (key == 'p' || key == 'P') {
    saveFrame("######.png");
    pixelDensity(displayDensity());
  }
}



/* -----------------------
 
 出典
 Processing Tutorial
 http://jkoba.net/prototyping/processing/basic_class_practice.html
 
 -------------------------*/
