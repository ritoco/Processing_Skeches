// Glowing circle

// 配列で着色するための準備
ArrayList<Coloring> colors;

void setup() {
  size( 600, 600 );
  colorMode(HSB, 360, 100, 100, 100);
  smooth();  
  background( 220, 10, 100 );


  bgMaterial(); // 背景の質感


  // 着色オブジェクトの量
  colors = new ArrayList<Coloring>();
  for ( int i = 1; i < 15; ++i ) {
    colors.add( new Coloring() );
  }
}

void draw() {
  for ( Coloring b : colors ) {
    b.run();
  }
}
// 着色オブジェクトの設定
class Coloring {
  int shapeSize;
  color col;
  PVector position;

  Coloring() {
    shapeSize = int( random(100, 150) );
    col = color( 360/random(2), 100, 100);
    position = new PVector( random(width), random(height) );
  }
  // draw関数に入れるもの
  void run() {
    pattern();
    update();
    output();
  }
  // 着色するオブジェクトの動き方
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
  // 着色するオブジェクトの色や形の設定
  void output() {
    fill( col, 2);
    blendMode(ADD);
    noStroke();
    ellipse( position.x, position.y, shapeSize, shapeSize  );
  }
}
// ellipseを並べる
void pattern() {

  int patternSize = 150;
  for ( int tate = 0; tate < 10; tate++ ) { 
    for ( int yoko= 0; yoko < 10; yoko++ ) { 
      noStroke();
      fill(0);
      ellipse(yoko*patternSize, tate*patternSize, patternSize, patternSize);
    }
  }
}
// 背景の質感
void bgMaterial() {
  for (int py = 0; py < height; py ++) {
    for (int px = 0; px < width; px ++) {
      pushMatrix();
      stroke( 0, 0, 10);
      translate(px, py);
      point(random(px), random(py));
      popMatrix();
    }
  }
}
// 画像保存
void keyPressed() {
  if (key == 'p' || key == 'P') {
    saveFrame("######.png");
    pixelDensity(displayDensity());
  }
}



/* ---------------------------------------------
 
  出典
   Processing Tutorial
   http://jkoba.net/prototyping/processing/basic_class_practice.html
 
 -----------------------------------------------*/
