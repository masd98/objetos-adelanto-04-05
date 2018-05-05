/**
 Nodo de forma circular.
 */

class Circle extends Node {
  @Override
    void display() {
    pushStyle();
    strokeWeight(5);  
    if (pantalla==0) { 
      stroke(86, 163, 166);
      fill(213, 186, 177);

      if (pick(mouseX, mouseY)) {
        stroke(213, 186, 177);
        fill(86, 163, 166);
      }
    } 
    if (pantalla==0) {
      stroke(86, 0, 28);
      fill(255, 255, 0);
      if (pick(mouseX, mouseY)) {
        stroke(255, 255, 0);
        fill(93, 87, 107);
      }
    }
    if (pantalla==1) {
      stroke(255, 0, 7);
      fill(255, 255, 255);
      if (pick(mouseX, mouseY)) {
        stroke(255, 255, 255);
        fill(76, 53, 73);
      }
    }
    if (pantalla==3) {
      stroke(129, 244, 225);
      fill(255, 255, 255);
      if (pick(mouseX, mouseY)) {
        stroke(255, 255,255);
        fill(76, 53, 73);
      }
    }

    ellipse(position.x, position.y, size, size);
    popStyle();
  }

  @Override
    boolean pick(int x, int y) {
    return sqrt(sq(x-position().x) + sq(y-position().y)) <= size()/2;
  }
}