void keyPressed() {

  if (pantalla == PANTALLA.LOGIN) {
    gui.userText.keyPressed(key, (int)keyCode);
    gui.passText.keyPressed(key, (int)keyCode);
  }
  if (pantalla == PANTALLA.SIGNUP) {
    gui.userRepeatPasswText.keyPressed(key, (int)keyCode);
    gui.userPasswText.keyPressed(key, (int)keyCode);
    gui.correuText.keyPressed(key, (int)keyCode);
    gui.userNameText.keyPressed(key, (int)keyCode);
  }

  if (pantalla == PANTALLA.PAGAMENT) {
    gui.cadText.keyPressed(key, (int)keyCode);
    gui.codiPostalText.keyPressed(key, (int)keyCode);
    gui.nomText.keyPressed(key, (int)keyCode);
    gui.llinatgesText.keyPressed(key, (int)keyCode);
    gui.domiciliText.keyPressed(key, (int)keyCode);
    gui.poblacioText.keyPressed(key, (int)keyCode);
    gui.targetaText.keyPressed(key, (int)keyCode);
    gui.cvvText.keyPressed(key, (int)keyCode);
  }
}
