float startTime = 0;
Player player;
Hunter g0;
Target g1;

ArrayList<GameObject> gobjs;
void setup(){
  size(1024, 768);
  gobjs = new ArrayList<GameObject>();
  PVector posN = new PVector(50, 500); //Posição inicial da nave
  PVector dirN = new PVector(1, 0); //Direção incial da nave
  PVector g0posN = new PVector(100, 300); //Posição inicial da nave
  PVector g0dirN = new PVector(1, 0); //Direção incial da nave
  PVector g1posN = new PVector(100, 300); //Posição inicial da nave
  PVector g1dirN = new PVector(1, 0); //Direção incial da nave
  player = new Player(posN, dirN);
  g0 = new Hunter(g0posN, g0dirN);
  g1 = new Target(g1posN, g1dirN);
  gobjs.add(player);
  gobjs.add(g0);
  gobjs.add(g1);
  startTime = millis();
}

void draw() {
  background(0);
  float elapsedTime = (millis() - startTime) / 1000.0f;
  startTime = millis();
  clear();
  update(elapsedTime);
  render();
}


void update(float elapsedTime) {
  for(GameObject obj : gobjs){
    obj.update(elapsedTime);
  }
 
}

void render() {
   for(GameObject obj : gobjs){
    obj.render();
  }
}

boolean verificarColisao(PVector obj1, PVector obj2, PVector dir, float av, float d) {
  PVector cn = PVector.sub(obj1, obj2);
  float angle = acos(cn.dot(dir)/(cn.mag() * dir.mag()));
  if (angle < av/2) {
    return obj1.dist(obj2) < d;
  }
  
  return false;
}

void keyPressed() {
 if(keyCode == RIGHT)
    for(GameObject go : gobjs){
      go.pKeyPressed(ArrowKey.Right);
    }
  else if(keyCode == LEFT)
    for(GameObject go : gobjs){
      go.pKeyPressed(ArrowKey.Left);
    }
}

void keyReleased() {
  for(GameObject go : gobjs){
      go.pKeyReleased();
   }
 
  
}
