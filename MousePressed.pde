void mousePressed() {
  
   if(gui.mb.mouseOverButton()){
    gui.menuOpened = !gui.menuOpened;
  }
  else if (gui.menuOpened && gui.bOpcio1.mouseOverButton()){
    println("Opció 1 clickada");
    pantalla= PANTALLA.INICIAL;
    gui.menuOpened = false;
  }
  else if (gui.menuOpened && gui.bOpcio2.mouseOverButton()){
    println("Opció 2 clickada");
    pantalla = PANTALLA.PRODUCTES;
    gui.menuOpened = false;
  }
  else if (gui.menuOpened && gui.bOpcio3.mouseOverButton()){
    println("Opció 3 clickada");
    pantalla = PANTALLA.CISTELLA;
    gui.menuOpened = false;
  }

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
