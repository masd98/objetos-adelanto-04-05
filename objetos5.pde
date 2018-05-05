Grafo[] niveles;
Grafo[] soluciones;
int total, state;
int pantalla;
Table proceso;


void setup() {
  size(500, 500);
  total = 3;
  niveles = new Grafo[total];
  soluciones = new Grafo[total];
  for (int i = 0; i < niveles.length; i++) {
    String var1= new String("nivel");
    String var2= new String(".1.csv");    
    String var3= new String(".2.csv");    
    String var4= new String(".3.csv");
    String cadena1=  var1 + Integer.toString(i+1)+ var2;
    String cadena2=  var1 + Integer.toString(i+1)+ var3;
    String cadena3=  var1 + Integer.toString(i+1)+ var4;

    niveles[i] = new Grafo(loadTable(cadena1), loadTable(cadena2), #040F0F);
    soluciones[i] = new Grafo(loadTable(cadena1), loadTable(cadena3), #FCFFFC);
  }
}

void draw() {
  if (pantalla==0) {
    home();
  } else if (pantalla==1) {
    nivel1();
  } else if (pantalla==2) {
    nivel2();
  } else if (pantalla==3) {
    nivel3();
  }
  strokeWeight(5);
  if (b.x!=0&&b.y!=0) {
    line(c.x, c.y, mouseX, mouseY);
  }
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      state=1;
    }
  }
}

PVector b=new PVector(0, 0);  
PVector c=new PVector(0, 0);

public void mouseReleased() {

  //println(b,c);
  c.x=b.x;
  c.y=b.y;
  // println(b, c);
}

void mousePressed() {
  if (pantalla!=0) {
    String var1= new String("nivel");
    String var2= new String(".1.csv");    
    String var3= new String(".2.csv");    
    String var4= new String(".3.csv");
    String cadena1=  var1 + Integer.toString(pantalla)+ var2;
    String cadena2=  var1 + Integer.toString(pantalla)+ var3;
    String cadena3=  var1 + Integer.toString(pantalla)+ var4;
    niveles[pantalla-1] = new Grafo(loadTable(cadena1), loadTable(cadena2), #040F0F);
    soluciones[pantalla-1] = new Grafo(loadTable(cadena1), loadTable(cadena3), #FCFFFC);
    referencia_c=loadTable(cadena2);


    if (referencia.getInt((mouseY-25)/50, (mouseX-25)/50)==1) {
      if (b.x==0&&b.y==0) {
        b.set(mouseX, mouseY);
        proceso=loadTable(cadena3);
      }
    }

    if (b.x!=0&&b.y!=0&&c.x!=0&&c.y!=0) {
      if (referencia_c.getInt(ref_cont[((mouseX-25)/50)][((mouseY-25)/50)]-1, 
        ref_cont[((int(c.x)-25)/50)][((int(c.y)-25)/50)]-1)==1) {
        b.set(mouseX, mouseY);

        proceso.setInt(ref_cont[((int(b.x)-25)/50)][((int(b.y)-25)/50)]-1, 
          ref_cont[((int(c.x)-25)/50)][((int(c.y)-25)/50)]-1, 1);

        proceso.setInt(ref_cont[((int(c.x)-25)/50)][((int(c.y)-25)/50)]-1, 
          ref_cont[((int(b.x)-25)/50)][((int(b.y)-25)/50)]-1, 1);
        saveTable(proceso, cadena3);
      }
    }
    soluciones[pantalla-1] = new Grafo(loadTable(cadena1), loadTable(cadena3), #FCFFFC);
  }
  if (state==1) {  
    for (int i = 0; i < 11; i++) {
      for (int j = 0; j < 11; j++) {
        proceso.setInt(i, j, 0);
      }
    }
    state=1;
  }
}