int arreglo[][]=new int[9][9];
int i=0;
int j=0;
int aux2;
abstract class Node {
  int contador[][]=new int[9][9];

  int aux;
  PVector position;
  float size;
  Table u_puntos;
  int state; 


  Node() {
    u_puntos=referencia;
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) { 

        if (u_puntos.getInt(j, i)==1&&contador[i][j]==0) {
          contador[i][j]=aux+1;
          aux=contador[i][j];
        }
      }
    }

    while (state==0) {
      if (u_puntos.getInt(j, i)==1) {
        aux2=aux2+1;
        //println(i, j, aux2, aux);
        setPosition(new PVector(i*(width/10)+(width/10), j*(height/10)+(height/10)));
        state=1;
      }
      if (aux2<aux) {

        if (i>=9&&j>=9) {
          i=9;
          j=9;
          state=1;
        } else if (j<8) {
          j++;
        } else {
          i++;
          j=0;
        }
      }
    }
    setSize(20);
  }


  abstract void display();

  abstract boolean pick(int x, int y);


  void setPosition(PVector pos) {
    position = pos;
  }

  void setPosition(float x, float y) {
    setPosition(new PVector(x, y));
  }

  void setSize(float s) {
    size = s;
  }

  PVector position() {
    return position;
  }

  float size() {
    return size;
  }
}