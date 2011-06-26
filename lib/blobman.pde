/* @pjs preload="images/Blobman_sprite_neutral.png"; */
/* @pjs preload="images/Blobman_sprite_mouthOpen5.png"; */

class Blobman {
  float EATING_BOX_X = 10;
  float EATING_BOX_Y = 5;
  float POS_X = 50;
  
  HashMap sprites = new HashMap();
  boolean _isEating = false;
  String mode = 'neutral';
  long ticksSinceEatStart = 0;
  
  int size_w = 50;
  int size_h = 54;
  float pos_y = (height - size_h) / 2;
  
  Blobman (){
    sprites.put('neutral', loadImage("images/Blobman_sprite_neutral.png"));
    sprites.put('mouth_open5', loadImage("images/Blobman_sprite_mouthOpen5.png"));
  }
  
  void draw(){
    if (mode == 'mouth_open5' && ticksSinceEatStart > 10){
      // stop eating
      mode = 'neutral';
    }
    PImage sprite = sprites.get(mode);
    image(sprite, POS_X, pos_y, size_w, size_h);
    
    ticksSinceEatStart += 1;
  }
  
  void startEating(){
    _isEating = true;
    ticksSinceEatStart = 0;
    mode = 'mouth_open5';
  }
  
  boolean isEating(){
    return _isEating;
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
