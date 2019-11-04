// Glowing rect

// 配列で着色するための準備
ArrayList<Coloring> colors;

void setup() {
  size( 600, 600 );
  colorMode(HSB, 360, 100, 100, 100);
  smooth();  
  background( 0, 0, 50 ); // 50-55
  pattern();
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
    shapeSize = int( random(width/5) ); 
    float hue = 360/random(3);      // 2 - 10
    col = color( hue, 100, 100);
    position = new PVector( random(width), random(height) );
  }
  // draw関数に入れるもの
  void run() {
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
    fill( col, 2 );  // 1 - 10
    blendMode( ADD ); // ADD or SCREEN 
    noStroke();
    ellipse( position.x, position.y, shapeSize, shapeSize );
    blendMode(BLEND);
  }
}
// 図形を並べる
void pattern() {
  float position;
  position = (height+width) / random(5, 15);

  for ( int tate = 0; tate < height/3; tate++ ) { 
    for ( int yoko= 0; yoko < width/3; yoko++ ) { 
      pushMatrix();
      translate(yoko, tate);
      noStroke();
      fill(0,0,0);
      rectMode(CENTER);
      // rect(yoko*position, tate*position, position-(height/50), position-(width/50));
       rect(yoko*position, tate*position, position-(height/50), position-(width/50),random(120));
      // rect(yoko*position, tate*position, position-(height/50), position-(width/50));
      popMatrix();
    }
  }
}
// 点々
void bgMaterial() {
  for (int py = 0; py < height; py += 10) {
    for (int px = 0; px < width; px += 10) {
      pushMatrix();
      blendMode( DIFFERENCE );
      strokeWeight(random(10));  // 10 - 50
      stroke( 0, 0, 100);
      translate(px, py);
      point(random(px), random(py));
      blendMode(BLEND);
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



/* -----------------------
 
 出典
  Processing Tutorial
   http://jkoba.net/prototyping/processing/basic_class_practice.html
 
  blendMode() \ Language (API) \ Processing 3+
   https://processing.org/reference/blendMode_.html
 
 -------------------------*/
