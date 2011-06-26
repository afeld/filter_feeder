/* @pjs preload="images/Blobman_sprite_neutral.png"; */
/* @pjs preload="images/Blobman_sprite_stroke.png"; */

/* @pjs preload="images/Blobman_sprite_mouthOpen1.png"; */
/* @pjs preload="images/Blobman_sprite_mouthOpen2.png"; */
/* @pjs preload="images/Blobman_sprite_mouthOpen3.png"; */
/* @pjs preload="images/Blobman_sprite_mouthOpen4.png"; */
/* @pjs preload="images/Blobman_sprite_mouthOpen5.png"; */

/* @pjs preload="images/Blobman_sprite_mouthClose1.png"; */
/* @pjs preload="images/Blobman_sprite_mouthClose2.png"; */

class Blobman {
  float EATING_BOX_X = 10;
  float EATING_BOX_Y = 5;
  float POS_X = 50;
  int FRAME_DURATION = 4;
  
  HashMap sprites = new HashMap();
  String mode = 'neutral';
  long ticksSinceEatStart = 0;
  Bubble bubbleBeingEaten = null;
  
  int size_w = 50;
  int size_h = 54;
  float pos_y = (height - size_h) / 2;
  
  Blobman (){
    sprites.put('neutral', loadImage("images/Blobman_sprite_neutral.png"));
    sprites.put('stroke', loadImage("images/Blobman_sprite_stroke.png"));
    
    sprites.put('mouth_open1', loadImage("images/Blobman_sprite_mouthOpen1.png"));
    sprites.put('mouth_open2', loadImage("images/Blobman_sprite_mouthOpen2.png"));
    sprites.put('mouth_open3', loadImage("images/Blobman_sprite_mouthOpen3.png"));
    sprites.put('mouth_open4', loadImage("images/Blobman_sprite_mouthOpen4.png"));
    sprites.put('mouth_open5', loadImage("images/Blobman_sprite_mouthOpen5.png"));
    
    sprites.put('mouth_close1', loadImage("images/Blobman_sprite_mouthClose1.png"));
    sprites.put('mouth_close2', loadImage("images/Blobman_sprite_mouthClose2.png"));
  }
  
  void draw(){
    // EAT: neutral - stroke - open 1-5 - Close 1-2 - stroke - neutral
    if (isEating()){
      bubbleBeingEaten.draw();
      bubbleBeingEaten.pos_x -= 1.1;
      
      if (ticksSinceEatStart < FRAME_DURATION){
        mode = 'stroke';
      } else if (ticksSinceEatStart < FRAME_DURATION * 2){
        mode = 'mouth_open1';
      } else if (ticksSinceEatStart < FRAME_DURATION * 3){
        mode = 'mouth_open2';
      } else if (ticksSinceEatStart < FRAME_DURATION * 4){
        mode = 'mouth_open3';
      } else if (ticksSinceEatStart < FRAME_DURATION * 5){
        mode = 'mouth_open4';
      } else if (ticksSinceEatStart < FRAME_DURATION * 6){
        mode = 'mouth_open5';
      } else if (ticksSinceEatStart < FRAME_DURATION * 7){
        mode = 'mouth_close1';
      } else if (ticksSinceEatStart < FRAME_DURATION * 8){
        mode = 'mouth_close2';
      } else {
        mode = 'neutral';
        bubbleBeingEaten = null;
      }
    }
    PImage sprite = sprites.get(mode);
    image(sprite, POS_X, pos_y, size_w, size_h);
    
    ticksSinceEatStart += 1;
  }
  
  void startEating(Bubble bubble){
    // duplicate the bubble
    float diameter = bubble.diameter;
    
    bubbleBeingEaten = new Bubble(bubble.pos_x);
    bubbleBeingEaten.diameter = diameter;
    bubbleBeingEaten.pos_y = bubble.pos_y;
    
    // align center vertically with the bubble
    pos_y = bubble.pos_y + ((diameter - size_h)  / 2);
    
    ticksSinceEatStart = 0;
  }
  
  boolean isEating(){
    return bubbleBeingEaten != null;
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
