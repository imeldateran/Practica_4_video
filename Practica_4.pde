import processing.video.*;
//video sin alteraciones
// image(mov, 0, 0, width, height);

Movie mov;

void setup() {
  size(640, 380);
  frameRate(120);
  
  mov = new Movie(this,"mariposa.mov" );
  mov.play();
  mov.speed(2);
  mov.loop();
  
  colorMode(HSB, 2);
  background(0);

  noStroke();
  
  
}

 
 void movieEvent(Movie m) {
  m.read();
}
// cargar pixeles
void draw() {
  mov.loadPixels();
  
  int x = width/2;
  int y = height/2;
  //Dibujar cantidad de cuadros
  for(int i=0; i<300; i++) {
  int c = mov.pixels[y*2*width+x*2];

  //color
    float h = hue(c);
    float s = saturation(c);
    float b = brightness(c);
    fill(h, s, b);
    rect(x,y,s*3,s*3);
 
    x += sin(h*15) * b * 80;
    y += cos(h*15) * b * 40;

   if(x<0 || y<0 || x >= width || y>= height) {
     break;
   }
  
}
}