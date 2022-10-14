color BaseColor = color (200,200,200);
color PlayerColor = color(0,0,200);
color TargetColor = color(255,0,0);
color HunterColor = color(220,0,200);
float velN0 = 120; //Valocidade inicial da nave 
float velAng = PI/3; //Velocidade angular (60°/s)

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
  
  
  void update(float elapsedTime ){
  }
  void render(){
  }
  
  void pKeyPressed(ArrowKey k){
  }
  void pKeyReleased(){
  }



}
