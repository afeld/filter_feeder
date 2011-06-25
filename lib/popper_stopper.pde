import GameState;

GameState state = new GameState();

void setup()
{
  size(800, 600);
  rectMode(CENTER_RADIUS);
  ellipseMode(CENTER_RADIUS);
  noStroke();
  smooth();
  state.ball_y = height/2;
  state.ball_x = 1;
}

void draw() 
{
  background(51);
  
  if (state.keyIsDown) {
    state.offset_paddle_y(5);
  } else {
    // float the paddle
    state.offset_paddle_y(-3);
  }
  
  if (random(1) > 0.98) {
    state.bubbles.add(new Bubble(random(width * 1.5)));
  }
  
  // Draw the paddle
  fill(153);
  rect(state.blobman.POS_X, state.blobman.pos_y, state.blobman.size_w, state.blobman.size_h);
  
  // Draw the bubbles
  for (int i = 0; i < state.bubbles.size(); i++) {
    Bubble bubble = state.bubbles.get(i);
    
    // check if bubble is off the screen
    if (bubble.pos_y + bubble.BUBBLE_SIZE < 0.0){
      // remove the bubble
      state.bubbles.remove(i);
    } else {
      bubble.draw();
      bubble.step();
    }
  }
}

void keyPressed() {
  if (keyCode == DOWN) {
    state.keyIsDown = true;
  }
}

void keyReleased(){
  state.keyIsDown = false;
}
