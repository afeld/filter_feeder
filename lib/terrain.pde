class Terrain {
  int SEGMENT_MAX_HEIGHT = 250;
  int SEGMENT_COUNT = 50;
  int SEGMENT_WIDTH = width / (SEGMENT_COUNT - 2);
  
  PGraphics pg = createGraphics(width, height, P2D);
  ArrayList heights = new ArrayList();
  float offset_x = 0;
  
  Terrain (){
    for (int i = 0; i < SEGMENT_COUNT; i++) {
      addVertex();
    }
  }
  
  void draw(){
    pg.beginDraw();
    pg.background(0, 0);
    pg.fill(0);
    pg.beginShape();
    
    pg.vertex(width, height);
    pg.vertex(0, height);
    for (int i = 0; i < SEGMENT_COUNT; i++) {
      pg.vertex(SEGMENT_WIDTH * i - offset_x, heights.get(i));
    }
    
    pg.endShape();
    pg.endDraw();
    image(pg, 0, 0);
  }
  
  void step(float step_x){
    offset_x += step_x;
    if (offset_x >= SEGMENT_WIDTH){
      heights.remove(0);
      addVertex();
      offset_x = 0;
    }
  }
  
  void addVertex(){
    heights.add(random(height - SEGMENT_MAX_HEIGHT, height));
  }
}
