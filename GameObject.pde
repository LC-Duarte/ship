color BaseColor = color (200,200,200);
color PlayerColor = color(0,0,200);
color TargetColor = color(255,100,100);
color TargetRuning = color(255,0,0);
color HunterColor = color(220,0,200);
float velN0 = 120; //Valocidade inicial da nave 
float velAng = PI/3; //Velocidade angular (60°/s)
float critDist  = 250; //Distância crítca
float av = PI/6; //Angulo de visão (30°)
enum ArrowKey{
  Left,
  Right,
  Not,
}

class GameObject{
  PVector pos;
  GameObject(){
    this.pos = new PVector(0,0);
  }
  GameObject(PVector pos){
    this.pos = pos;
  }
  
  
  void update(float elapsedTime ){
  }
  void render(){
  }
  
  void pKeyPressed(ArrowKey k){
  }
  void pKeyReleased(){
  }



}

void debugOnScreen(String str, float... attr){
  //Imprimir debug na tela
  // string, x, y, tamanho[opcional], r[opcional], g[opcional], b[opcional]
  float x= attr[0];
  float y= attr[1];
  float size = 20;
  float r = 225, g = 255, b = 20;
  try{
    size = attr[2];
  }catch(ArrayIndexOutOfBoundsException exception){
  }
  try{
    r = attr[3];
  }catch(ArrayIndexOutOfBoundsException exception){
  }
  try{
    g = attr[4];
  }catch(ArrayIndexOutOfBoundsException exception){
  }
  try{
    b = attr[5];
  }catch(ArrayIndexOutOfBoundsException exception){
  }  
  fill(int(r),int(g), int(b));
  textSize(size);
  text(str, x,y);
  
}
