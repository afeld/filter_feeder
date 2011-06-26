class Bubble {
  float MAX_BUBBLE_SIZE = 40;
  float DAMPING = 0.9;
  float accel_x;
  float accel_y;
  float velocity_x;
  float velocity_y;
  float pos_x;
  float pos_y = height;
  float diameter = random(MAX_BUBBLE_SIZE * 0.2, MAX_BUBBLE_SIZE);

  Bubble(float start_x){
    pos_x = start_x;
    accel_x = accel_y = 0;
    velocity_x = velocity_y = 0;
  }

  void draw(PImage img) {
    image(img, pos_x, pos_y, diameter, diameter);
  }

  void step(float step_x, float step_y) {
    applyNoise();

    // float the bubble
    velocity_x += accel_x;
    velocity_y += accel_y;

    pos_x += velocity_x;
    pos_y += velocity_y;

    velocity_x *= DAMPING;
    velocity_y *= DAMPING;


    applyFloat(step_x, step_y);

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

  void applyFloat(float step_x, float step_y) {
    pos_x -= step_x;
    pos_y -= step_y;
  }
}
