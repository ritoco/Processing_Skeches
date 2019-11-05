// Glowing text


ArrayList<Coloring> colors;


// 設定 
void setup() {
  size( 600, 600 );
  colorMode(HSB, 360, 100, 100, 100);
  smooth();  
  background( 0, 0, 0 ); 

  myText();     // テキストの表示
  bgMaterial(); // 背景の質感

  // 着色オブジェクトの量
  colors = new ArrayList<Coloring>();
  for ( int i = 1; i < 5; ++i ) { // 5-10
    colors.add( new Coloring() );
  }
}

void draw() {
  for ( Coloring d : colors ) {
    d.addDraw();
  }
}


// 着色設定
class Coloring {
  int shapeSize;
  color col;
  PVector position;

  // 色指定
  Coloring() {
    shapeSize = int( random(width/4) ); 
    position = new PVector( random(width), random(height) );
  }


  // draw関数に入れるための設定
  void addDraw() {
    update();
    output();
  }


  // 着色の範囲や動作指定
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

  // 着色するオブジェクトの色の設定
  void output() {
    fill( col, 4);  // 1 - 10
    float hue = 360/random(3);      // 2 - 10
    col = color( hue, 100, 100);
    blendMode(ADD);
    noStroke();
    ellipse( position.x, position.y, shapeSize, shapeSize );
    blendMode(BLEND);
  }
}



// テキストの設定
void myText() {

  // フォントの読み込み
  PFont myFont = loadFont("SegoePrint-48.vlw");
  textFont(myFont);

  // テキストの間隔調整
  float position  = (height+width) / 20;

  // テキストを並べる
  for ( int tate = 0; tate < height/10; tate++ ) { 
    for ( int yoko= 0; yoko < width/10; yoko++ ) { 

      push();
      translate(yoko, tate);
      fill(0, 0, 100);
      float fontSize  = random(0.1, 1.5);
      textAlign(CENTER);
      textSize( position * fontSize);
      text("◙", (tate*position), (yoko*position));
      text("+", random(tate*position*2), random(yoko*position*2));
      pop();
    }
  }
}


// 背景の設定
void bgMaterial() {

  // 質感で表示させる背景を並べる
  for (int py = 0; py < height; py += 3) {
    for (int px = 0; px < width; px += 3) {

      push();
      blendMode( EXCLUSION ); // ADD , EXCLUSION ,DIFFERENCE
      fill( 0, 0, 100, 5);
      translate(px, py);
      textSize(10);
      //text("/////", random(px), random(py));
      text("▼", random(px), random(py));
      blendMode(BLEND);
      pop();
    }
  }
}

// 画像保存
void keyPressed() {
  if (key == 'p' || key == 'P') {
    saveFrame("######.png");
    pixelDensity(1);
  }
}



/* -----------------------
 
 参照
 
 Processing Tutorial
 http://jkoba.net/prototyping/processing/basic_class_practice.html
 
 b-03 文字を使う - Processing 学習ノート
 http://www.d-improvement.jp/learning/processing/2011-b/03.html
 
 blendMode() \ Language (API) \ Processing 3+
 https://processing.org/reference/blendMode_.html
 
 Windowsに標準搭載されているフォントの利用条件 – 某氏の猫空
 https://blog2.k05.biz/2014/10/windows-font-license.html
 
 -------------------------*/
