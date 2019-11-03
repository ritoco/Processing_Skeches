
float nX = 0.01;    // xのノイズ
float nY = 0.01;    // yのノイズ（x,yで二次元のノイズ）
float nTime = 0.02; // 時間経過していくノイズ
float start = 0.0;  // 二次元ノイズ初期値
float step = 0.004; // ノイズが増加する値


void setup() {
  fullScreen();
  // testRun
  // size(700,700);
  noLoop();
}


void draw() {
  // ノイズの調整
  noiseDetail(2, 2.5f);
  
  loadPixels(); //ノイズを読み込む
  nY = start;  

  for (int y = 0; y < height; y ++) {

    nX = start;

    for (int x = 0; x < width; x ++) {

      // 色をマウスに反応させる
      float col1 = noise(nX+mouseX, nY+mouseY, nTime/.5)  * mouseX;
      float col2 = noise(nX-mouseX, nY+mouseY, nTime/22.5)  * mouseX;
      pixels[y * width + x] = color(col1+mouseX, col2+mouseY, col1*mouseY); 

      nX += step;
    }
    nY += step;
  }
  nTime += step;
  updatePixels(); //ノイズを更新していく
}



void keyPressed() {

  // noLoop()が有効の時、aキーを押したらdrawの中が実行される
  if (key == 'a' || key == 'A') {
    redraw();
  }


  // 画像保存
  if (key == 'p' || key == 'P') {
    saveFrame("yumekawa-######.png");
    pixelDensity(displayDensity());
  }
}



/*--------------------------------------
 
 出典
 
 　偶然性のデザイン2（ノイズ） – Yasushi Noguchi Class
 　　http://r-dimension.xsrv.jp/classes_j/noise/
 
 

 　displayDensity() \ Language (API) \ Processing 3+
　　 https://processing.org/reference/displayDensity_.html

　　この関数は、画面が高密度画面（OS XではRetinaディスプレイ、WindowsおよびLinuxではhigh-dpiと呼ばれる）である場合は「2」、そうでない場合は「1」を返します。
    この情報は、プログラムがそれをサポートする画面で2倍のピクセル密度で実行するように適応させるのに役立ちます。
 
 
 --------------------------------------*/
