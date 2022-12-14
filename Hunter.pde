class Hunter extends GameShip{
  Hunter(PVector p, PVector d){
    super(p, d); 
  }
  
  void update(float elapsedTime){
   
    //println(millis()/100);
    if(frameCount%60 ==0)// a cada 2 segundos
    {
      //muda direção aleatoriamente
       dir.rotate(random(-velAng,velAng));
    }
    PVector m = PVector.mult(this.dir, this.vel/3 * elapsedTime);
    //Reinicia posição da nave nas bordas da tela 
    this.resetOnBorder();
    //update posição da nave
    this.pos.add(m);
    
  }
  void render(){
    fill(HunterColor);
    circle(pos.x, pos.y, 20);
    fill(BaseColor);
    
    //Display DIR
    stroke(255);
    line(pos.x, pos.y,(pos.x+dir.x*20), (pos.y+dir.y*20));
    

  }
  
  
  boolean hasTarget(GameObject target){
    //Verifica se jogador esta sobre alcance
    //TODO: função esta invertida, esta funcionado quando jogador esta atras do caçador
    PVector cn = PVector.sub(this.pos, target.pos);
    float angle = acos(cn.dot(dir)/(cn.mag() * this.dir.mag()));
    if (angle < av/2) {
      return this.pos.dist(target.pos) < critDist;
    }
    
    return false;
    }
    

}
