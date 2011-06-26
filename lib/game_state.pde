/* @pjs preload="images/Oil_bubble.png"; */

import Bubble;
import Blobman;

class GameState {
  boolean keyIsDown = false;
  long ticksSincePress = 0;
  long ticksSinceRelease = 0;
  
  PImage bubbleImage = loadImage('images/Oil_bubble.png');
  
  Blobman blobman = new Blobman();
  ArrayList bubbles = new ArrayList();
  Terrain lowerTerrain = new Terrain();
}
