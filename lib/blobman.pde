/* @pjs preload="images/Blobman_sprite_neutral.png"; */
/* @pjs preload="images/Blobman_sprite_mouthOpen5.png"; */

class Blobman {
  float EATING_BOX_X = 10;
  float EATING_BOX_Y = 5;
  float POS_X = 50;
  PImage neutralSprite = loadImage("images/Blobman_sprite_neutral.png");
  PImage eatingSprite = loadImage("images/Blobman_sprite_mouthOpen5.png");
  
  int size_w = 50;
  int size_h = 54;
  float pos_y = 40;
  
  void draw(){
    image(eatingSprite, POS_X, pos_y, size_w, size_h);
  }
  
  void move_y(offset) {
    // Constrain vertical position to screen
    pos_y = constrain(pos_y + offset, 0, height - size_h);
  }
  
  boolean bubbleInEatingRange(Bubble bubble) {
    float mouth_x = POS_X + size_w;
    boolean inEatingRange = bubble.pos_x > mouth_x - EATING_BOX_X &&
      bubble.pos_x < mouth_x &&
      bubble.pos_y > pos_y - EATING_BOX_Y &&
      bubble.pos_y < pos_y + size_h + EATING_BOX_Y;
    return inEatingRange;
  }
}
