class Target extends GameShip{
  boolean escape; //Se true target deve iniciar fuga
  Target(PVector p, PVector d){
    super(p, d); 
    escape = false;
  }
  
  void update(float elapsedTime){
    PVector m = new PVector(0,0);
    if(escape){
      //Se esta fugindo
      //TODO: Implementar escape
      
    }  
    else{
      //Se não esta fugindo
      //println(millis()/100);
      if(frameCount%60 ==0)// a cada 2 segundos
      {
          //muda direção aleatoriamente
         dir.rotate(random(-velAng,velAng));
      }
      m = PVector.mult(this.dir, this.vel/3 * elapsedTime);
    }

    //Reinicia posição da nave nas bordas da tela 
    this.resetOnBorder();
    //update posição da nave
    this.pos.add(m);
    
  }
  void render(){
    fill(TargetColor);
    if(escape){
      fill(TargetRuning);
    }
    
    circle(pos.x, pos.y, 20);
    fill(BaseColor);
    
    //Display DIR
    stroke(255);
    line(pos.x, pos.y,(pos.x+dir.x*20), (pos.y+dir.y*20));
    

  }
  boolean isUTG(GameObject hunter){
    //Is Under the gun
    //Atualiza o atributo escape em relação ao objeto que estaria caçando 
    //esse alvo e retona este valor atualizado
    float currDist = PVector.dist(hunter.pos, this.pos);//cn.mag()//sqrt((dx*dx)+(dy*dy));
    String debugMsg = "player to target distA = "+currDist+"; critical dist =" + critDist;
    debugOnScreen(debugMsg, 600, 40, 15, 190,240,0);
    this.escape =  currDist < critDist;
    return this.escape;
    
  }
  

}
