class Bubble {
  float BUBBLE_SIZE = 8.0;
  float BUBBLE_STEP_X = 0.8;
  float BUBBLE_STEP_Y = 1.0;
  float pos_x;
  float pos_y = height;
  
  Bubble(float start_x){
    pos_x = start_x;
  }
  
  void draw() {
    fill(255);
    ellipse(pos_x, pos_y, BUBBLE_SIZE, BUBBLE_SIZE);
  }
  
  void step() {
    // float the bubble
    pos_x -= BUBBLE_STEP_X;
    pos_y -= BUBBLE_STEP_Y;
  }
}
