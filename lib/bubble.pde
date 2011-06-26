class Bubble {
  float BUBBLE_SIZE = 8.0;
  float BUBBLE_STEP_X = 0.8;
  float BUBBLE_STEP_Y = 1.0;
  float DAMPING = 0.9;
  float accel_x;
  float accel_y;
  float velocity_x;
  float velocity_y;
  float pos_x;
  float pos_y = height;

  Bubble(float start_x){
    pos_x = start_x;
    accel_x = accel_y = 0;
    velocity_x = velocity_y = 0;
  }

  void draw() {
    fill(255, 0, 0);
    ellipse(pos_x, pos_y, BUBBLE_SIZE, BUBBLE_SIZE);
  }

  void step() {
    applyNoise();

    // float the bubble
    velocity_x += accel_x;
    velocity_y += accel_y;

    pos_x += velocity_x;
    pos_y += velocity_y;

    velocity_x *= DAMPING;
    velocity_y *= DAMPING;


    applyFloat();

    accel_x = accel_y = 0;
  }

  void applyNoise() {
    float theta = 0.01;
    float nOffset = 0.0;
    float gameTick = millis()*0.1;

    float noisePosition = noise(nOffset+pos_x*theta, nOffset+pos_y*theta, gameTick*0.003);
    float angle = noisePosition*12;
    float speed = 0.1;
    accel_x += cos( angle ) * speed - 0.1;
    accel_y += sin( angle ) * speed * 0.1;
  }

  void applyFloat() {
    pos_x -= BUBBLE_STEP_X;
    pos_y -= BUBBLE_STEP_Y;
  }
}
