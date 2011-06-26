class Blobman {
  float EATING_BOX_X = 10;
  float EATING_BOX_Y = 5;
  float POS_X = 50;
  
  int size_w = 5;
  int size_h = 40;
  float pos_y = 40;
  
  void draw(){
    fill(153);
    rect(POS_X, pos_y, size_w, size_h);
  }
  
  void move_y(offset) {
    // Constrain vertical position to screen
    pos_y = constrain(pos_y + offset, size_h, height - size_h);
  }
  
  boolean bubbleInEatingRange(Bubble bubble) {
    float mouth_x = POS_X + size_w;
    boolean inEatingRange = bubble.pos_x >= mouth_x &&
      bubble.pos_x < mouth_x + EATING_BOX_X &&
      bubble.pos_y > pos_y - EATING_BOX_Y &&
      bubble.pos_y < pos_y + size_h + EATING_BOX_Y;
    return inEatingRange;
  }
}
