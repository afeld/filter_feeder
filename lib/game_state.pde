import Bubble;

class GameState {
  boolean keyIsDown = false;
  
  // Global variables for the ball
  float ball_x;
  float ball_y;
  float ball_dir = 1;
  float ball_size = 5;  // Radius
  float dy = 0;  // Direction
  
  // Global variables for the paddle
  int paddle_width = 5;
  int paddle_height = 40;
  float paddle_y = 40;
  
  ArrayList bubbles = new ArrayList();
  
  void offset_paddle_y(offset) {
    // Constrain paddle to screen
    paddle_y = constrain(paddle_y + offset, paddle_height, height - paddle_height);
  }
}
