enum PANTALLA {
  LOGIN, INICIAL, PRODUCTES, SIGNUP, PAGAMENT;
};
PANTALLA pantalla = PANTALLA.PAGAMENT;
GUI gui;

void setup() {
  fullScreen();
  setColors();
  setFonts();

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
  }
  fill(0);
  text (mouseX+", "+ mouseY, width-300, 100);

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
}