import GameState;

GameState state;

void setup()
{
  size(800, 600);
  rectMode(CENTER_RADIUS);
  ellipseMode(CENTER_RADIUS);
  noStroke();
  smooth();
  
  state = new GameState();
}

void draw() 
{
  background(51);
  
  if (state.keyIsDown) {
    state.blobman.move_y(5);
  } else {
    // float vertically
    state.blobman.move_y(-3);
  }
  
  if (random(1) > 0.98) {
    state.bubbles.add(new Bubble(random(width * 1.5)));
  }
  
  state.lowerTerrain.step(0.8);
  
  state.blobman.draw();
  
  // Draw the bubbles
  for (int i = 0; i < state.bubbles.size(); i++) {
    Bubble bubble = state.bubbles.get(i);
    
    if (state.blobman.bubbleInEatingRange(bubble)) {
      state.bubbles.remove(i);
    } else if (bubble.pos_y + bubble.BUBBLE_SIZE < 0.0){
      // bubble is off the screen - remove it
      state.bubbles.remove(i);
    } else {
      bubble.draw();
      bubble.step();
    }
  }
  
  state.lowerTerrain.draw();
}

void keyPressed() {
  if (keyCode == DOWN) {
    state.keyIsDown = true;
  }
}

void keyReleased(){
  state.keyIsDown = false;
}
