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
  //Checar se o target esta em distancia de tiro pelo player
  g1.isUTG(player);
  
  //Checar se jogador esta em perigo
  boolean danger = g0.hasTarget(player);
  String dangerAlert = danger ? "DANGER!" : "";
  debugOnScreen(dangerAlert, 20, 40, 30, 255,0,0);
  
  for(GameObject obj : gobjs){
    obj.update(elapsedTime);
  }
 
}

void render() {
   for(GameObject obj : gobjs){
    obj.render();
  }
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
