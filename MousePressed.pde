void mousePressed() {

  if (gui.cLogout.bAceptar.mouseOverButton() && gui.cLogout.bAceptar.enabled) {
    pantalla = PANTALLA.LOGIN;
    gui.cLogout.setVisible(false);
    gui.pPasswMal.setVisible(false);
    gui.userText.removeAllText();
    gui.passText.removeAllText();
    println("ACEPTAR");
  } else if (gui.cLogout.bCancelar.mouseOverButton() && gui.cLogout.bCancelar.enabled) {
    gui.cLogout.setVisible(false);
    println("CANCELAR");
  } else if (gui.mb.mouseOverButton()) {
    gui.menuOpened = !gui.menuOpened;
  } else if (gui.menuOpened && gui.bOpcio1.mouseOverButton()) {
    println("Opció 1 clickada");
    pantalla= PANTALLA.INICIAL;
    gui.menuOpened = false;
  } else if (gui.menuOpened && gui.bOpcio2.mouseOverButton()) {
    println("Opció 2 clickada");
    pantalla = PANTALLA.PRODUCTES;
    gui.menuOpened = false;
  } else if (gui.menuOpened && gui.bOpcio3.mouseOverButton()) {
    println("Opció 3 clickada");
    pantalla = PANTALLA.CISTELLA;
    gui.menuOpened = false;
  } else if (gui.menuOpened && gui.bOpcio4.mouseOverButton()) {
    println ("Opció 4 clickada");
    gui.cLogout.setVisible(true);
  }



  if (pantalla == PANTALLA.LOGIN) {
    if (gui.bLogin.mouseOverButton()) {

      if (isValidUser(gui.userText.text, gui.passText.text)) {
        pantalla = PANTALLA.INICIAL;
      } else {
        gui.pPasswMal.setVisible(true);
      }
    } else if (gui.bSignup.mouseOverButton()) {
      pantalla = PANTALLA.SIGNUP;
    } else if (gui.pPasswMal.bAceptar.mouseOverButton()) {
      gui.pPasswMal.setVisible(false);
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
    if (/*!gui.userNameText.text.equals("") && !gui.correuText.text.equals("") && gui.passText.text.equals(gui.userRepeatPasswText.text) &&*/ gui.passText.text!="") {
      if (gui.bEndRegister.mouseOverButton()) {
        insertInfoTaulaUsuario(gui.userNameText.text, gui.correuText.text, gui.passText.text);
        gui.pUsuarioCreado.setVisible(true);
      }
      if (gui.pUsuarioCreado.visible) {
        if (gui.pUsuarioCreado.bAceptar.mouseOverButton()) {
          pantalla = PANTALLA.INICIAL;
          gui.pUsuarioCreado.setVisible(false);
        }
      }
    } else {
      if (gui.bEndRegister.mouseOverButton()) {
        gui.pUsuarioNoCreado.setVisible(true);
      }
      if (gui.pUsuarioNoCreado.visible) {
        if (gui.pUsuarioNoCreado.bAceptar.mouseOverButton()) {
          pantalla = PANTALLA.SIGNUP;
          gui.pUsuarioNoCreado.setVisible(false);
        }
      }
    }
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

if (pantalla == PANTALLA.PRODUCTES) {
  gui.cs = gui.ps.checkButtons();
}

if (pantalla == PANTALLA.CISTELLA) {
  if (gui.bPagar.mouseOverButton()) {
    pantalla = PANTALLA.PAGAMENT;
  }
}
}
