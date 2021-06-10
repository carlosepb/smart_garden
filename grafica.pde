import processing.video.*;
import java.lang.*;
import cvimage.*;
import org.opencv.core.*;
import processing.serial.*;

float[] temperatura, luz, humedad;
int[] range = {25,50,75};
int[] levelState={5,5,5};
int posGraphX, posGraphY;
int posButtonsX, posButtonsY; 
int posLevelsX, posLevelsY;
int posCamX, posCamY;
int timer;
CVImage img,auximg,pimg;
Capture cam;
Serial port;
String val;

int[][]  bluePalette ={{0, 255, 255}, {1, 146, 253}, {0,0,255}, {0, 0, 91}};
int[][]  redPalette ={{255, 255, 0}, {255, 67, 0}, {255,0,0}, {146, 0, 0}};
int[][]  greyPalette ={{0, 0, 0}, {50,50,50}, {100, 100, 100},{215, 215, 215}};

PImage luces, aspersor, calefaccion, on, off;

boolean stateL, stateP, stateH, camSet, movement;

void setup() {
  size(1200, 800, P3D);
  noStroke();
  
  temperatura = new float[10];
  luz = new float[10];
  humedad = new float[10];

  timer=60;
  ///parámetros para desplazar lo paneles de componentes
  ///si se quieren mover modificar aquí
  posGraphX = 470;
  posGraphY = 720;
  
  posButtonsX = 70;
  posButtonsY = 130;
  
  posLevelsX = 110;
  posLevelsY = 447;
  
  posCamX = 470;
  posCamY = 70;
  /////-----------------------------------
  luces=loadImage("images/luces.jpg"); 
  aspersor=loadImage("images/aspersor.jpg"); 
  calefaccion=loadImage("images/calefaccion.jpg");
  on=loadImage("images/on.JPG"); 
  off=loadImage("images/off.JPG"); 
  
  stateL = false;
  stateP = false;
  stateH = false;
  camSet = false;
  movement = false;
  
  cam = new Capture(this, 694, 394);
  cam.start();
  
  //OpenCV
  //Carga biblioteca core de OpenCV
  System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
  println(Core.VERSION);
  //Crea imágenes
  img = new CVImage(cam.width, cam.height);
  auximg=new CVImage(cam.width, cam.height);
  pimg=new CVImage(cam.width, cam.height);
  
/*String portName = Serial.list()[0];
  port = new Serial(this, portName, 9600);*/
}

void draw() {
  background(0, 135, 102);
 
  pushMatrix();
  translate(posLevelsX,posLevelsY,0); 
  fill(101, 0, 0);
  rect(-63,-90,366, 60);
  rect(-63,-28,366, 341);
  fill(233, 254, 254);
  rect(-60,-87,360, 54);
  rect(-60,-25,360, 335);
  
  fill(52, 0, 0);
  textSize(40);
  text("POTENCIA",20,-45);
  
  drawLevels();
  popMatrix(); 
 
  pushMatrix();
  translate(posButtonsX,posButtonsY,0);
  fill(101, 0, 0);
  rect(-23,-90,366, 60);
  rect(-23,-28,366, 221);
  fill(233, 254, 254);
  rect(-20,-87,360, 54); 
  rect(-20,-25,360, 215);
  
  fill(52, 0, 0);
  textSize(40);
  text("COMPONENTE",20,-45);
  
  drawButtons();
  popMatrix(); 
  
  pushMatrix();
  translate(posGraphX,posGraphY,0);
  fill(101, 0, 0);
  rect(-13,-268,701, 60);
  rect(-13,-206,701, 245);
  fill(233, 254, 254);
  rect(-10,-265,695, 54);
  rect(-10,-203,695, 239);
  
  fill(52, 0, 0);
  textSize(40);
  text("ESTADO DEL ENTORNO",100,-222);
  
  drawGraph(humedad, 0, 0, 15, 2,"Humedad", 15, bluePalette, range);
  drawGraph(temperatura, 0+250, 0, 15, 2,"Temperatura", 15, redPalette, range);
  drawGraph(luz, 0+500, 0, 15, 2,"Luz", 15, greyPalette, range);
  popMatrix();
  
  pushMatrix();
  translate(posCamX,posCamY,0);
  fill(101, 0, 0);
  rect(-13,-28,700, 400);
  cam.read();
  //Obtiene la imagen de la cámara
  img.copy(cam, 0, 0, cam.width, cam.height, 0, 0, img.width, img.height);
  img.copyTo();
  //Imagen de grises
  Mat gris = img.getGrey();
  Mat pgris = pimg.getGrey(); 
  Core.absdiff(gris, pgris, gris);
  //Copia de Mat a CVImage
  cpMat2CVImage(gris,auximg);
  if(camSet){
    image(auximg, -10, -25);
  }else{
    image(cam, -10, -25);
  }
  pimg.copy(img, 0, 0, img.width, img.height, 0, 0, img.width, img.height);
  pimg.copyTo();
  gris.release();
  
  popMatrix();
   
  if(timer==0){
    /*if(port.available() > 0){
      val = port.readStringUntil('\n');
    }else{*/
    updateVector(temperatura, random(0, 100));
    updateVector(luz, random(0, 100));
    updateVector(humedad, random(0, 100));
    movement=checkMovement();
    //}
    timer=60;
  }else{
    timer--;
  }
}

private void drawGraph(float[] vec, int posX, int posY, int widthBar, int heightBar, String title, int titleSize, int[][] paletteColors, int[] ranges){

  fill(0);
  textSize(titleSize);
  text(title, posX+titleSize, posY+titleSize*2);
  
  for (int i=0;i<vec.length;i++) {
    if (vec[i]<ranges[0]){
      fill(paletteColors[0][0],paletteColors[0][1],paletteColors[0][2]);
    }else if(vec[i]<ranges[1]){
      fill(paletteColors[1][0],paletteColors[1][1],paletteColors[1][2]);
    }else if(vec[i]<ranges[2]){
      fill(paletteColors[2][0],paletteColors[2][1],paletteColors[2][2]);
    }else{
      fill(paletteColors[3][0],paletteColors[3][1],paletteColors[3][2]);
    }
    
    rect(posX+(widthBar+3)*i, posY, widthBar, -vec[i]*heightBar);
    fill(0);
    textSize(widthBar/2);
    text(int(vec[i]), posX+(widthBar+3)*i, posY+widthBar/2);
  } 
}

private void drawButtons(){
   fill(0);
   for(int i=0;i<3;i++){
     square(i*110-2,18,104);
     circle(25+110*i,0,29);
     circle(75+110*i,0,29);
   }
  
   image(luces, 0, 20, 100, 100);
   image(aspersor, 110, 20, 100, 100);
   image(calefaccion, 220, 20, 100, 100);
   
   if(stateL){
     fill(0, 255, 0);
     circle(25,0,26);
     fill(102, 0, 0);
     circle(75,0,26);
     image(on, 35, 130, 30, 50);
   } else{
     fill(0, 79, 0);
     circle(25,0,26);
     fill(255, 0, 0);
     circle(75,0,26);
     image(off, 35, 130, 30, 50);
   }
   
   if(stateP){
     fill(0, 255, 0);
     circle(135,0,26);
     fill(102, 0, 0);
     circle(185,0,26);
     image(on, 150, 130, 30, 50);
   } else{
     fill(0, 79, 0);
     circle(135,0,26);
     fill(255, 0, 0);
     circle(185,0,26);
     image(off, 150, 130, 30, 50);
   }
   
   if(stateH){
     fill(0, 255, 0);
     circle(245,0,26);
     fill(102, 0, 0);
     circle(295,0,26);
     image(on, 255, 130, 30, 50);
   } else{
     fill(0, 79, 0);
     circle(245,0,26);
     fill(255, 0, 0);
     circle(295,0,26);
     image(off, 255, 130, 30, 50);
   }
}

private void drawLevels(){
  for(int i=0; i<3;i++){
    fill(125);
    rect(-5+i*100,-5,40,180);
    fill(0);
    square(-5+i*100,205,40);
    square(-5+i*100,250,40);
    fill(201, 105, 78);
    square(-3+i*100,207,36);
    square(-3+i*100,252,36);
    fill(255);
    textSize(40);
    text('+',i*100,237);
    text('-',i*100+4,282);
  }
  for(int i=0; i<5;i++){
    if(levelState[0]<=i){
      fill(255);
    }else{
      fill(0);
    }
    square(0,i*30+5*i,30);  
    if(levelState[1]<=i){
      fill(0,0,255);
    }else{
      fill(0);
    }
    square(100,i*30+5*i,30);
    if(levelState[2]<=i){
      fill(255,0,0);
    }else{
      fill(0);
    }  
    square(200,i*30+5*i,30);
  }
  
}


private void updateVector(float[] vec, float value){
  for(int i=0;i<vec.length;i++){
    if(i==vec.length-1){
      vec[i]=value;
    }else{
      vec[i]=vec[i+1];
    }
  }
}

private void updateState(int state, int value){
  if(value>=0 && value<=5){
    levelState[state]=value;
  }
}

private void listenerStateButtons(){
  if((mouseX>=posLevelsX-5 && mouseX<= posLevelsX+35)
      && (mouseY>=posLevelsY+205 && mouseY<= posLevelsY+245) && stateL){
        updateState(0,levelState[0]-1 );
  }else if((mouseX>=posLevelsX+95 && mouseX<= posLevelsX+135)
      && (mouseY>=posLevelsY+205 && mouseY<= posLevelsY+245) && stateP){            
        updateState(1,levelState[1]-1 );
  }else if((mouseX>=posLevelsX+195 && mouseX<= posLevelsX+235)
      && (mouseY>=posLevelsY+205 && mouseY<= posLevelsY+245) && stateH){            
        updateState(2,levelState[2]-1 );
  }else if((mouseX>=posLevelsX-5 && mouseX<= posLevelsX+35)
      && (mouseY>=posLevelsY+250 && mouseY<= posLevelsY+290) && stateL){            
        updateState(0,levelState[0]+1 );
  }else if((mouseX>=posLevelsX+95 && mouseX<= posLevelsX+135)
      && (mouseY>=posLevelsY+250 && mouseY<= posLevelsY+290) && stateP){            
        updateState(1,levelState[1]+1 );
  }else if((mouseX>=posLevelsX+195 && mouseX<= posLevelsX+235)
      && (mouseY>=posLevelsY+250 && mouseY<= posLevelsY+290) && stateH){            
        updateState(2,levelState[2]+1 );
  }
}
  
void mouseClicked(){
  
  if((mouseX>=posButtonsX+35 && mouseX<= posButtonsX+65)
      && (mouseY>=posButtonsY+130 && mouseY<= posButtonsY+180)){      
       stateL=!stateL;
       if(!stateL)levelState[0]=5;
  }else if((mouseX>=posButtonsX+150 && mouseX<= posButtonsX+180)
      && (mouseY>=posButtonsY+130 && mouseY<= posButtonsY+180)){           
        stateP=!stateP;
        if(!stateP)levelState[1]=5;
  }else if((mouseX>=posCamX-13 && mouseX<= posCamX+687)
      && (mouseY>=posCamY-13 && mouseY<= posCamY+387)){
        camSet = !camSet;
  }else if((mouseX>=posButtonsX+255 && mouseX<= posButtonsX+285)
      && (mouseY>=posButtonsY+130 && mouseY<= posButtonsY+180)){            
        stateH=!stateH;
        if(!stateH)levelState[2]=5;
  }else{
    listenerStateButtons();
  }
}

//Copia unsigned byte Mat a color CVImage
void  cpMat2CVImage(Mat in_mat,CVImage out_img)
{    
  byte[] data8 = new byte[cam.width*cam.height];
  
  out_img.loadPixels();
  in_mat.get(0, 0, data8);
  
  // Cada columna
  for (int x = 0; x < cam.width; x++) {
    // Cada fila
    for (int y = 0; y < cam.height; y++) {
      // Posición en el vector 1D
      int loc = x + y * cam.width;
      //Conversión del valor a unsigned basado en 
      //https://stackoverflow.com/questions/4266756/can-we-make-unsigned-byte-in-java
      int val = data8[loc] & 0xFF;
      //Copia a CVImage
      out_img.pixels[loc] = color(val);
    }
  }
  out_img.updatePixels();
}

private boolean checkMovement(){
  
  return false;
}
