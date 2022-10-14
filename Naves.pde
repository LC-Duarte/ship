float startTime = 0;
Player player;

ArrayList<GameObject> gobjs;
void setup(){
  size(1024, 768);
  gobjs = new ArrayList<GameObject>();
  PVector posN = new PVector(50, 500); //Posição inicial da nave
  PVector dirN = new PVector(1, 0); //Direção incial da nave
  player = new Player(posN, dirN);
  gobjs.add(player);
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
  player.update(elapsedTime);
 
}

void render() {
   player.render();
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
