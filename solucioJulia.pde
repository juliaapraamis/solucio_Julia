enum PANTALLA {
  LOGIN, INICIAL, PRODUCTES, SIGNUP, PAGAMENT, CISTELLA;
};
PANTALLA pantalla = PANTALLA.LOGIN;
GUI gui;

String[] fotosOferta;
String fotoOfertaSeleccionada;

void setup() {
  fullScreen();
  setColors();
  setFonts();
  
  connexioBBDD();
  
  fotosOferta = getNombresTablaImagen();
  int n = (int)random(fotosOferta.length);
  fotoOfertaSeleccionada = fotosOferta[n];

  gui = new GUI();

  
}

void draw() {
  background(getFirstColor());
  switch(pantalla) {
  case LOGIN:
    gui.dibuixaPantallaLogin();
    break;
  case INICIAL:
    gui.dibuixaPantallaInicial();
    break;
  case PRODUCTES:
    gui.dibuixaPantallaProductes();
    break;
  case SIGNUP:
    gui.dibuixaPantallaSignup();
    break;
  case PAGAMENT:
    gui.dibuixaPantallaPagament();
    break;
  case CISTELLA:
    gui.dibuixaPantallaCistella();
    break;
  }
  

  updateCursor();
}
void updateCursor() {
  if (pantalla == PANTALLA.LOGIN) {
    if (gui.bLogin.mouseOverButton() || gui.userText.mouseOverTextField() || gui.passText.mouseOverTextField() || gui.c.bNext.mouseOverButton() || gui.c.bPrev.mouseOverButton()) {
      cursor(HAND);
    } else {
      cursor (ARROW);
    }
  }
  if (gui.mb.mouseOverButton() || gui.bOpcio1.mouseOverButton() || gui.bOpcio2.mouseOverButton() || gui.bOpcio3.mouseOverButton()) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }

  if ((gui.cLogout.bAceptar.mouseOverButton() && gui.cLogout.bAceptar.enabled) ||
    (gui.cLogout.bCancelar.mouseOverButton() && gui.cLogout.bCancelar.enabled)) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}
