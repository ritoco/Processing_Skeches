/*
2018.04.29 ver1.0
*/



float angle = 0; //回転の値の初期値

void setup() {
   size(500, 500);  //カンバスのサイズ
   background(#ffffff); //背景色（今回はカラーコードの白）
   noFill(); //塗りはなし
}

void draw() {
   stroke(#000000,50); //線の色,透明度（今回はカラーコードの黒で透明度50%）
   translate(mouseX, mouseY); //マウス追跡でxとyの座標移動を行う
   rotate(angle);//回転させる
   ellipse(-20, 10, 150,10); //円1
   ellipse(10, -10, 161, 10); //円2
   angle += 0.01; //0.01のスピードで円形に描かれていく
}

//pのキーを押したらpng形式で画像保存
void keyPressed() {
  if ( key == 'p' ) {
    save( "sketch1.png" );
  }
}
