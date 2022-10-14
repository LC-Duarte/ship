class Target extends GameShip{
  Target(PVector p, PVector d){
    super(p, d); 
  }
  
  void update(float elapsedTime){
   
    println(millis()/100);
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
    fill(TargetColor);
    circle(pos.x, pos.y, 20);
    fill(BaseColor);
    
    //Display DIR
    stroke(255);
    line(pos.x, pos.y,(pos.x+dir.x*20), (pos.y+dir.y*20));
    

  }
  

}
