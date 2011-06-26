import GameState;

float FLOAT_EASING = 0.2;

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
  background(45, 145, 237);
  
  if (state.keyIsDown) {
    state.blobman.move_y(FLOAT_EASING * state.ticksSincePress);
  } else {
    // float vertically
    state.blobman.move_y((state.ticksSincePress - (2 * state.ticksSinceRelease)) * FLOAT_EASING);
  }
  
  state.ticksSincePress += 1;
  state.ticksSinceRelease += 1;
  
  if (random(1) > 0.98) {
    state.bubbles.add(new Bubble(random(width * 1.5)));
  }
  
  state.lowerTerrain.step(0.8);
  
  // Draw the bubbles
  for (int i = 0; i < state.bubbles.size(); i++) {
    Bubble bubble = state.bubbles.get(i);
    
    if (state.blobman.bubbleInEatingRange(bubble)) {
      state.bubbles.remove(i);
    } else if (bubble.pos_y + bubble.BUBBLE_SIZE < 0.0){
      // bubble is off the screen - remove it
      state.bubbles.remove(i);
    } else {
      bubble.draw(state.bubbleImage);
      bubble.step();
    }
  }
  
  state.blobman.draw();
  state.lowerTerrain.draw();
}

void keyPressed() {
  if (keyCode == DOWN) {
    if (!state.keyIsDown){
      state.ticksSincePress = 0;
      state.keyIsDown = true;
    }
  }
}

void keyReleased(){
  if (keyCode == DOWN) {
    state.ticksSinceRelease = 0;
    state.keyIsDown = false;
  }
}
