import GameState;

GameState state = new GameState();

int dist_wall = 15;

void setup()
{
  size(200, 200);
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
  
  state.ball_x += state.ball_dir * 1.0;
  state.ball_y += state.dy;
  if(state.ball_x > width+state.ball_size) {
    state.ball_x = -width/2 - state.ball_size;
    state.ball_y = random(0, height);
    state.dy = 0;
  }
  
  // Constrain paddle to screen
  state.paddle_y = constrain(mouseY, state.paddle_height, height-state.paddle_height);

  // Test to see if the ball is touching the paddle
  float py = width-dist_wall-state.paddle_width-state.ball_size;
  if(state.ball_x == py 
     && state.ball_y > state.paddle_y - state.paddle_height - state.ball_size 
     && state.ball_y < state.paddle_y + state.paddle_height + state.ball_size) {
    state.ball_dir *= -1;
    if(mouseY != pmouseY) {
      state.dy = (mouseY-pmouseY)/2.0;
      if(state.dy >  5) { state.dy =  5; }
      if(state.dy < -5) { state.dy = -5; }
    }
  } 
  
  // If ball hits paddle or back wall, reverse direction
  if(state.ball_x < state.ball_size && state.ball_dir == -1) {
    state.ball_dir *= -1;
  }
  
  // If the ball is touching top or bottom edge, reverse direction
  if(state.ball_y > height-state.ball_size) {
    state.dy = state.dy * -1;
  }
  if(state.ball_y < state.ball_size) {
    state.dy = state.dy * -1;
  }

  // Draw ball
  fill(255);
  ellipse(state.ball_x, state.ball_y, state.ball_size, state.ball_size);
  
  // Draw the paddle
  fill(153);
  rect(width-dist_wall, state.paddle_y, state.paddle_width, state.paddle_height);
}
