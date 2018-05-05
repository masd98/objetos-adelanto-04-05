
class Rectangle extends Node {
  @Override
    void display() {
    pushStyle();
    rectMode(CENTER);
    strokeWeight(5);

    if (pantalla==1) { 
      stroke(93, 87, 107);
      fill(213, 186, 177);
      if (pick(mouseX, mouseY)) {
        stroke(213, 186, 177);
        fill(93, 87, 107);
      }
    } 
    if (pantalla==2) {
      stroke(200, 76, 9);
      fill(210, 255, 40);
      if (pick(mouseX, mouseY)) {
        stroke(210, 255, 40);
        fill(93, 87, 107);
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


    rect(position.x, position.y, size, size);
    popStyle();
  }

  @Override
    boolean pick(int x, int y) {
    return abs(x-position().x) <= size()/2 && abs(y-position().y) <= size()/2;
  }
}