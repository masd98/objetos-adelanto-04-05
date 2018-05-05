Table referencia;
Table referencia_c;
int ref_cont[][];
class Grafo {

  Node[] nodes;
  Line[] lines;
  int conta_l[][]=new int[25][25];
  Table u_puntos;
  Table conex;
  int contador[][]=new int[9][9];
  int aux, aux_l;
  int cont_lineas;
  int state;
  color c;

  Grafo(Table u_puntos, Table conex,color c) {    
    referencia=u_puntos;

    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) { 
        if (u_puntos.getInt(j, i)==1&&contador[i][j]==0) {
          contador[i][j]=aux+1;
          aux=contador[i][j];
        }
      }
    }

    for (int i = 0; i < aux; i++) {
      for (int j = 0; j < aux; j++) {
        if (conex.getInt(i, j)!=0&&conta_l[i][j]==0) {
          conta_l[i][j]=aux_l+1;
          aux_l=conta_l[i][j];
        }
      }
    }

    ref_cont=contador;

    i=0;
    j=0;
    aux2=0;
    nodes = new Node[aux];
    for (int i = 0; i < nodes.length; i++)
      nodes[i] = i%2==0 ? new Circle() : new Rectangle();
    lines = new Line[aux_l];
    for (int i = 0; i <  nodes.length; i++) {
      for (int j = 0; j <  nodes.length; j++) {
        // println(i, j, cont_lineas, aux_l);
        if (cont_lineas<aux_l) {
          if (conex.getInt(i, j)!=0) {
            lines[cont_lineas] = new Line(nodes[i], nodes[j],c);
            cont_lineas++;
          }
        }
      }
    }
  }
  void display() {
    //println(aux);
    pushStyle();
    strokeWeight(3);
    stroke(255, 255, 0);
    for (int i = 0; i < nodes.length; i++)
      nodes[i].display();
    for (int i = 0; i < lines.length; i++)
      lines[i].display();
    popStyle();
  }
}