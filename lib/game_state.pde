import Bubble;
import Blobman;

class GameState {
  boolean keyIsDown = false;
  
  // Global variables for the ball
  float ball_x;
  float ball_y;
  float ball_dir = 1;
  float ball_size = 5;  // Radius
  float dy = 0;  // Direction
  
  Blobman blobman = new Blobman();
  
  ArrayList bubbles = new ArrayList();
  
  void offset_paddle_y(offset) {
    // Constrain paddle to screen
    blobman.pos_y = constrain(blobman.pos_y + offset, blobman.size_h, height - blobman.size_h);
  }
}
