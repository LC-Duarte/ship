class Player extends GameObject{
  PVector pos; //Posição atual (x,y)
  PVector dir; //Direção atual (x,y)
  float vel;
  ArrowKey rotating;
  Player(PVector p, PVector d){
    super();
    this.pos = p;
    this.dir = d;
    this.vel = velN0;
    this.rotating = ArrowKey.Not;
    
  }
  
  void update(float elapsedTime){
    //Rotaciona para a direita
    if(this.rotating == ArrowKey.Right){
      this.dir.rotate(velAng*elapsedTime);
    }
    if(this.rotating == ArrowKey.Left){
      this.dir.rotate(-velAng*elapsedTime);
    }
    
    PVector m = PVector.mult(this.dir, this.vel * elapsedTime);
    //Reinicia posição da nave nas bordas da tela 
    this.resetOnBorder();
    //update posição da nave
    this.pos.add(m); //<>//
    
 
    
  }
  
  
  void render(){
    fill(PlayerColor);
    circle(pos.x, pos.y, 20);
    fill(BaseColor);
    
    //Display DIR
    stroke(255);
    line(pos.x, pos.y,(pos.x+dir.x*20), (pos.y+dir.y*20));
    

  }
  
  void pKeyPressed(ArrowKey k){
     rotating = k;
  }
  void pKeyReleased(){
    rotating = ArrowKey.Not;
  }
  
  void resetOnBorder(){
    //Reinicia posição do objeto nas bordas da tela 
    if (this.pos.x > width+10) {
      this.pos.x = -5;
    }
    else if (this.pos.x < -10) {
      this.pos.x = width+5;
    }
    if (this.pos.y > height+10) {
      this.pos.y = -5;
    }
    else  if (this.pos.y < -10) {
      this.pos.y = height+5;
    }
  }

}
