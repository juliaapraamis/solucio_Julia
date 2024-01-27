void mousePressed() {

  if (pantalla == PANTALLA.LOGIN) {
    if (gui.bLogin.mouseOverButton()) {
      pantalla = PANTALLA.INICIAL;
    } else if (gui.bSignup.mouseOverButton()) {
      pantalla = PANTALLA.SIGNUP;
    }
    gui.userText.isPressed();
    gui.passText.isPressed();



    gui.c.checkButtons();
  }
  if (pantalla == PANTALLA.SIGNUP) {
    gui.userRepeatPasswText.isPressed();
    gui.userPasswText.isPressed();
    gui.correuText.isPressed();
    gui.userNameText.isPressed();
  }

  if (pantalla == PANTALLA.PAGAMENT) {
    gui.nomText.isPressed();
    gui.llinatgesText.isPressed();
    gui.domiciliText.isPressed();
    gui.poblacioText.isPressed();
    gui.codiPostalText.isPressed();
    gui.targetaText.isPressed();
    gui.cadText.isPressed();
    gui.cvvText.isPressed();
  }
  
  if (pantalla == PANTALLA.PRODUCTES){
    gui.cs = gui.ps.checkButtons();
  
  }
}
