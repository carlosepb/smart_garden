import processing.video.*;
import java.lang.*;
import cvimage.*;
import org.opencv.core.*;
import processing.serial.*;
int levell, levelt,levelh;

boolean man;
boolean ayuda;

PFont font;
PFont font2;
int gotinas;
int hora;
String[] horas;
String[] tempe;
String[] hume;
String[] lux;
int horaux;

int temperatura;
int luz;
int humedad;

int posWX, posWY; 
int posLevelsX, posLevelsY;
int posCamX, posCamY;



PImage auto, manu, gota, gotafoto, invernadero, bombi, termo;


void setup() {
  size(1200, 800, P3D);
  noStroke();
  
  font = createFont("DSEG14Classic-Bold.ttf",60);
  textFont(font);
  font2 = createFont("Calibri 400.ttf",60);
  
  
  
  gotinas =6;
  levelt=0;
  levell=0;
  levelh=0;
  man=false;
  ayuda = false;


  posWX = 70;
  posWY = 130;
  
  posLevelsX = 225;
  posLevelsY = 600;
  
  posCamX = 470;
  posCamY = 70;
  
  horaux=0;


  gota=loadImage("images/gota.png");
  bombi=loadImage("images/bombi.png");
  termo=loadImage("images/termo.png");
  manu=loadImage("images/man.png");
  auto=loadImage("images/auto.png");
  gotafoto = loadImage("images/gotafoto.png");
  invernadero = loadImage("images/invernadero.jpg");  
  
  horas = loadStrings("horas.txt");
  tempe = loadStrings("tempe.txt");
  hume = loadStrings("hume.txt");
  lux = loadStrings("lux.txt");
  
  temperatura = int(tempe[horaux]);
  luz=int(lux[horaux]);
  humedad=int(hume[horaux]);  

  

}

void draw() {
  background(246,246,246);
  
  
  if(!ayuda){
    
    //imagencolorada();
    pongotinas();
    pushMatrix();
    translate(posCamX,posCamY,0);
    fill(101, 0, 0);
    rect(-14,-29,702, 402);

    popMatrix();
    
    
    pushMatrix();
    dibujareloj();

    popMatrix();
    
    pushMatrix();
    stroke(29, 191, 108);
    fill(246,246,246);
    rect(posLevelsX-100, posLevelsY-100, 200, 100);
    fill(0);
    textSize(60);
    text(tempe[horaux]+"C", posLevelsX ,posLevelsY-25 );
    textAlign(CENTER);  
    
    
    dibujasemicirculoa();
    
    popMatrix();
    pushMatrix();
    botonest();
    popMatrix();
   
    pushMatrix();
    stroke(29, 191, 108);
    fill(246,246,246);
    rect(posLevelsX-100+375, posLevelsY-100, 200, 100);
    fill(0);
    textSize(60);
    text(hume[horaux]+"%", posLevelsX+375 ,posLevelsY-25 );
    textAlign(CENTER);  
    
    dibujasemicirculob();
  
    popMatrix();
    pushMatrix();
    botonesh();
    popMatrix();
   
    
    
    pushMatrix();
    stroke(29, 191, 108);
    fill(246,246,246);
    rect(posLevelsX-100+750, posLevelsY-100, 200, 100);
    fill(0);
    textSize(60);
    text(lux[horaux], posLevelsX+750 ,posLevelsY-25 );
    textAlign(CENTER);
    dibujasemicirculoc();
    
    popMatrix();
    pushMatrix();
    botonesl();
    popMatrix();
    pushMatrix();
    botonayuda();
    popMatrix();
    pushMatrix();
    botonavance();
    popMatrix();
    pushMatrix();
    botonautoman();
    popMatrix();
    controlautomaticot();
    controlautomaticoh();
    controlautomaticol();
   fotogotina();
    
  
    
    
    
  }else{
  
    displayayuda();
  }    
     

  
}





void dibujasemicirculoa(){
   if(levelt==0){
     translate(posLevelsX, posLevelsY+150);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(termo);
   }else if(levelt==1){
     
     translate(posLevelsX, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(termo);   
     
   
   }else if(levelt==2){
     translate(posLevelsX, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(termo);
   
   }else if(levelt==3){
     translate(posLevelsX, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(termo);
   
   }else if(levelt==4){
     translate(posLevelsX, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(termo);
   
   }else if(levelt==5){
     translate(posLevelsX, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(termo);
   
   }else{
     translate(posLevelsX, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(termo);
   
   }
}   
void dibujasemicirculob(){
  
   if(levelh==0){
     translate(posLevelsX + 375, posLevelsY+150);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(gota);
   }else if(levelh==1){
     
     translate(posLevelsX + 375, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(gota);   
     
   
   }else if(levelh==2){
     translate(posLevelsX + 375, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(gota);   
   
   }else if(levelh==3){
     translate(posLevelsX + 375, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(gota);   
   
   }else if(levelh==4){
     translate(posLevelsX + 375, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(gota);   
   
   }else if(levelh==5){
     translate(posLevelsX + 375, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(gota);   
   
   }else{
     translate(posLevelsX + 375, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(gota);   
   
   }   
   

    


}

void dibujasemicirculoc(){
  

   if(levell==0){
     translate(posLevelsX+750, posLevelsY+150);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(bombi);
   }else if(levell==1){
     
     translate(posLevelsX+750, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(bombi);   
     
   
   }else if(levell==2){
     translate(posLevelsX+750, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(bombi);   
   
   }else if(levell==3){
     translate(posLevelsX+750, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(bombi);   
   
   }else if(levell==4){
     translate(posLevelsX+750, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(bombi);   
   
   }else if(levell==5){
     translate(posLevelsX+750, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(207, 207,196);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(bombi);   
   
   }else{
     translate(posLevelsX+750, posLevelsY+150);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(181), radians(209), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(211), radians(239), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(241), radians(269), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(271), radians(299), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(301), radians(329), PIE);
     noStroke();
     fill(29, 191, 108);
     arc(0, 0, 250, 250, radians(331), radians(359), PIE);
    
     internal(bombi);     

  }

}
void internal(PImage c){
  
  fill(246,246,246);
  noStroke();
  arc(0,0,225,225,radians(180), radians(360), PIE);
  image(c,-25,-50,50,50);
}

void botonest(){
  translate(posLevelsX, posLevelsY+150);
  if(!man){
    
    
    stroke(0, 0, 0);
    fill(255,0,0);
    rect(0-60,0+2, 30, 30 );
    fill(0);
    textSize(35);
    text("-", 0-45 ,0+35);
    textAlign(CENTER);
    
    stroke(0, 0, 0);
    fill(255,0,0);
    rect(0+30,0+2, 30, 30 );
    fill(0);
    textSize(35);
    text("+", 0+46,0+35);
    textAlign(CENTER);
  
  }else{
    stroke(0, 0, 0);
    fill(0,170,228);
    rect(0-60,0+2, 30, 30 );
    fill(0);
    textSize(35);
    text("-", 0-45,0+35);
    textAlign(CENTER);
    
    stroke(0, 0, 0);
    fill(0,170,228);
    rect(0+30,0+2, 30, 30 );    
    fill(0);
    textSize(35);
    text("+", 0+46,0+35);
    textAlign(CENTER);    
    
  }

}

void botonesh(){
  translate(posLevelsX+375, posLevelsY+150);
  if(!man){
    
    
    stroke(0, 0, 0);
    fill(255,0,0);
    rect(0-60,0+2, 30, 30 );
    fill(0);
    textSize(35);
    text("-", 0-45 ,0+35);
    textAlign(CENTER);
    
    stroke(0, 0, 0);
    fill(255,0,0);
    rect(0+30,0+2, 30, 30 );
    fill(0);
    textSize(35);
    text("+", 0+46,0+35);
    textAlign(CENTER);
  
  }else{
    stroke(0, 0, 0);
    fill(0,170,228);
    rect(0-60,0+2, 30, 30 );
    fill(0);
    textSize(35);
    text("-", 0-45,0+35);
    textAlign(CENTER);
    
    stroke(0, 0, 0);
    fill(0,170,228);
    rect(0+30,0+2, 30, 30 );    
    fill(0);
    textSize(35);
    text("+", 0+46,0+35);
    textAlign(CENTER);    
    
  }
}

void botonesl(){
  translate(posLevelsX+750, posLevelsY+150);
  if(!man){
    
    
    stroke(0, 0, 0);
    fill(255,0,0);
    rect(0-60,0+2, 30, 30 );
    fill(0);
    textSize(35);
    text("-", 0-45 ,0+35);
    textAlign(CENTER);
    
    stroke(0, 0, 0);
    fill(255,0,0);
    rect(0+30,0+2, 30, 30 );
    fill(0);
    textSize(35);
    text("+", 0+46,0+35);
    textAlign(CENTER);
  
  }else{
    stroke(0, 0, 0);
    fill(0,170,228);
    rect(0-60,0+2, 30, 30 );
    fill(0);
    textSize(35);
    text("-", 0-45,0+35);
    textAlign(CENTER);
    
    stroke(0, 0, 0);
    fill(0,170,228);
    rect(0+30,0+2, 30, 30 );    
    fill(0);
    textSize(35);
    text("+", 0+46,0+35);
    textAlign(CENTER);    
    
  }
}

void botonayuda(){
  
    stroke(0, 0, 0);
    fill(255,255,255);
    rect(width-50,5, 30, 30 );
    fill(0);
    textSize(30);
    text("?", width-35,37);
    textAlign(CENTER);


}

void botonavance(){
    translate(posWX,posWY);
    stroke(0, 0, 0);
    fill(255,255,255);
    rect(310,210, 30, 30 );
    fill(0);
    textSize(17);
    text("+1", 325,235);
    textAlign(CENTER);


}

void botonautoman(){
  
  if(man){
    image(manu,width-200,0,80,40);
  
  }else{
    
    image(auto,width-200,0,80,40);
  
  }



}



void mouseClicked(){
  
  if(!ayuda){
    if((mouseX <=(width-200+80) && mouseX >=(width-200) )&& (mouseY>=0 && mouseY<=40)){
      man=!man;
    }
    if((mouseX <=(width-50+30) && mouseX >=(width-50) )&& (mouseY>=0 && mouseY<=35)){
      ayuda=!ayuda;
    }
    
    if(( mouseX >=310+posWX&& mouseX <=(310+30+posWX) )&& (mouseY>=(210+posWY) && mouseY<=(240+posWY)) ){
      if(horaux<23){
        horaux=horaux+1;
        rescatadatos();
        pongotinas();
      }else{
        horaux=0;
        rescatadatos();
        pongotinas();
      }  
    
    
    }
    
      if(( mouseX >=(posLevelsX-60) && mouseX <=(posLevelsX-30) )&& (mouseY>=(2+posLevelsY+150) && mouseY<=(32+posLevelsY+150))&&man){
        if(levelt>0){
          levelt = levelt-1;
        }
      
    
    
      }else if(( mouseX >=(30+posLevelsX) && mouseX <=(posLevelsX+60))&& (mouseY>=(2+posLevelsY+150) && mouseY<=(32+posLevelsY+150))&&man){
        if(levelt<6){
          levelt = levelt+1;
        }
      
      }
      
      
      
      if(( mouseX >=(posLevelsX-60+375) && mouseX <=(posLevelsX-30+375) )&& (mouseY>=(2+posLevelsY+150) && mouseY<=(32+posLevelsY+150))&&man){
        if(levelh>0){
          levelh = levelh-1;
          pongotinas();
        }
      
    
    
      }else if(( mouseX >=(30+posLevelsX+375) && mouseX <=(posLevelsX+60+375))&& (mouseY>=(2+posLevelsY+150) && mouseY<=(32+posLevelsY+150))&&man){
        if(levelh<6){
          levelh = levelh+1;
          pongotinas();
        }
      
      }
      
      
      
      if(( mouseX >=(posLevelsX-60+750) && mouseX <=(posLevelsX-30+750) )&& (mouseY>=(2+posLevelsY+150) && mouseY<=(32+posLevelsY+150))&&man){
        if(levell>0){
          levell = levell-1;
        }
      
    
    
      }else if(( mouseX >=(30+posLevelsX+750) && mouseX <=(posLevelsX+60+750))&& (mouseY>=(2+posLevelsY+150) && mouseY<=(32+posLevelsY+150))&&man){
        if(levell<6){
          levell = levell+1;
        }
      
      }      
      
     
    
    
    
  }else{
    
    //Botón ayuda salida
    ayuda=!ayuda;
    textFont(font);
  
  
  }    
  
  
}


void controlautomaticot(){
  if(!man){
    if(temperatura >30){
      levelt=0;
    
    }else if(temperatura<=30 && temperatura>25){
      levelt=1;
    
    }else if(temperatura<=25 && temperatura>20){
      levelt=2;
    
    }else if(temperatura<=20 && temperatura>15){
      levelt=3;
    
    }else if(temperatura<=15 && temperatura>10){
      levelt=4;
    
    }else if(temperatura<=10 && temperatura>5){
      levelt=5;
    
    }else{
      levelt=6;
    
    }
    
  }    
}



void controlautomaticoh(){

   if(!man){
    if(humedad <=100&& humedad>90){
      levelh=0;
    
    }else if(humedad<=90 && humedad>80){
      levelh=1;
    
    }else if(humedad<=80 && humedad>60){
      levelh=2;
    
    }else if(humedad<=60 && humedad>40){
      levelh=3;
    
    }else if(humedad<=40 && humedad>20){
      levelh=4;
    
    }else if(humedad<=20 && humedad>10){
      levelh=5;
    
    }else{
      levelh=6;
    
    }
    
  } 


}

void controlautomaticol(){
  
   if(!man){
    if(luz <=100&& luz>90){
      levell=0;
    
    }else if(luz<=90 && luz>80){
      levell=1;
    
    }else if(luz<=80 && luz>60){
      levell=2;
    
    }else if(luz<=60 && luz>40){
      levell=3;
    
    }else if(luz<=40 && luz>20){
      levell=4;
    
    }else if(luz<=20 && luz>10){
      levell=5;
    
    }else{
      levell=6;
    
    }
    
  } 

}

void rescatadatos(){
  
  temperatura = int(tempe[horaux]);
  luz=int(lux[horaux]);
  humedad=int(hume[horaux]);  
}


void displayayuda(){
  
    fill(0);
    textSize(120);
    textFont(font2);
    text("Ayuda", width/2,50);
    textAlign(CENTER);
    
    
    fill(0);
    textSize(35);

    text("Te damos la bienvenida a la ventana de ayuda del Huertomatic 3000, \n para salir de esta ventana haz click en cualquier lugar", width/2,150);
    textAlign(CENTER);
    fill(0);
    textSize(20);

    text("Aquí aprenderás todo lo necesario sobre tu Huertomatic", width/2,250);
    textAlign(CENTER);
    fill(0);
    textSize(20);

    text("Comenzando por la izquierda podrás observar la presencia de un reloj con él sabrás la hora en todo momento", width/2,300);
    textAlign(CENTER);
    fill(0);
    textSize(20);

    text("Justo a su derecha podrás observar el estado de tu invernadero en todo momento, gracias a su cámara integrada",width/2,350);
    textAlign(CENTER);
    
    fill(0);
    textSize(20);

    text("Disfrutando de efectos en la imagen según la temperatura o el riego ",width/2,400);
    textAlign(CENTER);
    
    fill(0);
    textSize(20);

    text("Mostrándose en tonos más azulados en situaciones de frío y más rojizo en situaciones de calor ",width/2,450);
    textAlign(CENTER);
    
    fill(0);
    textSize(20);

    text("O con gotas de agua según en nivel del riego ",width/2,500);
    textAlign(CENTER);
    
    fill(0);
    textSize(20);

    text("En la zona inferior están los indicadores de intensidad del riego, calefactores y alumbrado, \n junto con los valores actuales de temperatura, humedad y luminosidad",width/2,550);
    textAlign(CENTER);
    
    
    fill(0);
    textSize(20);

    text("Podrás controlar el riego, la calefacción y el alumbrado manualmente, \n pero sólo si estás en modo manual, de otra manera se encargará Huertomatic",width/2,600);
    textAlign(CENTER);
    
    fill(0);
    textSize(20);

    text("Sabrás si estás en modo manual o automático según los colores de los botones, \n azúl para modo manual y rojo para el automático",width/2,650);
    textAlign(CENTER);
    
    fill(0);
    textSize(20);

    text("Podrás cambiar de modos en el botón junto al de ayuda",width/2,700);
    textAlign(CENTER);           
    
    
    
  
    
  


}

void dibujareloj(){
    translate(posWX,posWY);
    stroke(0, 0, 0);
    fill(246,246,246);
    rect(posWX-85, posWY-130, 350, 200);
    fill(0);
    textSize(100);
    text(horas[horaux]+":00", posWX+85 ,posWY+15 );
    textAlign(CENTER);

}

void pongotinas(){
  
  if(levelh==0){
    
    gotinas =0;
  
  }else if(levelh ==1){
    gotinas =1;
  
  }else if(levelh ==2){
    gotinas =2;
  
  }else if(levelh ==3){
    gotinas =3;
  
  }else if(levelh ==4){
    gotinas =4;
  
  }else if(levelh ==5){
  
    gotinas =5;
  }else{
    gotinas =6;
  
  }
}

void fotogotina(){
  if(temperatura <= 10) tint(0, 125, 250);
  else if (temperatura <= 17) tint(0, 250, 250);
  else if (temperatura <= 23) tint(255);
  else if (temperatura <= 27) tint(250, 125, 25);
  else if (temperatura > 30) tint(250, 25, 0);
  image(invernadero, posCamX-13, posCamY-28, 700, 400);
  tint(255);
  if(gotinas>0)image(gotafoto, posCamX+40, posCamY+40, 110, 120);
  if(gotinas>1)image(gotafoto, posCamX+240, posCamY+40, 110, 120);
  if(gotinas>2)image(gotafoto, posCamX+440, posCamY+40, 110, 120);
  if(gotinas>3)image(gotafoto, posCamX+40, posCamY+240, 110, 120);
  if(gotinas>4)image(gotafoto, posCamX+240, posCamY+240, 110, 120);
  if(gotinas>5)image(gotafoto, posCamX+440,posCamY+ 240, 110, 120);


}

  
  
