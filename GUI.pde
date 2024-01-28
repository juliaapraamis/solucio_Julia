class GUI {
  //Declaració Components GUI

  Button bLogin, bSignup, bEndRegister, bFinalitzarPagament;
  TextField userText, passText, userRepeatPasswText, userPasswText, correuText, userNameText, nomText, llinatgesText, domiciliText, poblacioText, codiPostalText, targetaText, cadText, cvvText;
  PImage imgLogin;
  Timer t;

  Carrousel c;

  // Noms de les imatges
  String[] noms = {"caixa.jpg", "capsa.jpg", "divertit.jpg",
    "ensalada.jpg", "pa.jpg", "saludable.jpg",
    "treballadora.jpg"};

  LinesDiagram s;

  // Dades del Diagrama (etiquetes)
  String[] textos  = {"Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };

  // Dades del Diagrama (valors)
  float[] values  = {400, 600, 100, 300, 55, 100, 90, 220, 186, 400, 600, 10 };

  // Color de la línia
  color colorLine = color(150, 50, 200);
  PagedProducts ps;

  // Producte Seleccionat
  ProductCard cs = null;

  // Número de productes per pàgina
  int numCardsPage = 6;
  int numCardsRow = 3;

  // Dades de la taula
  String[][] info = {
    {"1", "Producte 1", "A", "Descripció 1", "15.25", "true", "imatge1.png"},
    {"2", "Producte 2", "A", "Descripció 2", "9.75", "false", "imatge2.png"},
    {"3", "Producte 3", "B", "Descripció 3", "120.50", "true", "imatge3.png"},
    {"4", "Producte 4", "C", "Descripció 4", "74.49", "true", "imatge4.png"},
    {"5", "Producte 5", "C", "Descripció 5", "49.95", "false", "imatge5.png"},
    {"6", "Producte 6", "A", "Descripció 6", "3.25", "true", "imatge6.png"},
    {"7", "Producte 7", "D", "Descripció 7", "10.15", "true", "imatge7.png"},
    {"8", "Producte 8", "B", "Descripció 8", "25.95", "true", "imatge8.png"},
    {"9", "Producte 9", "B", "Descripció 9", "4.75", "false", "imatge9.png"},
    {"10", "Producte 10", "A", "Descripció 10", "3.05", "true", "imatge10.png"},
  };

  // Icones dels botons
  PImage imgMes, imgMenys;

  MenuButton mb;
  Button bOpcio1, bOpcio2, bOpcio3, bOpcio4;
  boolean menuOpened = false;


  GUI() {

    bLogin = new Button("Log in", 904, 549, buttonW, 50);
    bEndRegister = new Button ("Finalitzar registre", (width/2)-buttonW/2, 744, buttonW, 50);
    bSignup = new Button ("Sign up", 904, 726, buttonW, 50);
    bFinalitzarPagament = new Button ("Finalitzar pagament", 34, 600, 711, 50);
    userText = new TextField(853, 325, textFieldW, textFieldH);
    passText = new TextField(853, 437, textFieldW, textFieldH);
    userRepeatPasswText = new TextField ((width/2)-150, 644, 300, textFieldH);
    userPasswText = new TextField ((width/2)-150, 544, 300, textFieldH);
    correuText = new TextField ((width/2)-150, 444, 300, textFieldH);
    userNameText = new TextField ((width/2)-150, 344, 300, textFieldH);
    nomText = new TextField (34, 218, 300, textFieldH);
    llinatgesText = new TextField(345, 218, 400, textFieldH);
    domiciliText = new TextField(34, 280, 711, textFieldH);
    poblacioText = new TextField(34, 342, 300, textFieldH);
    targetaText = new TextField(34, 404, 711, textFieldH);
    cadText = new TextField(34, 466, 300, textFieldH);
    cvvText = new TextField(345, 466, 200, textFieldH);
    //codiPostalText = new TextField();

    imgLogin = loadImage ("data/usuari.png");
    imgMes = loadImage("mes.png");
    imgMenys = loadImage("menys.png");

    c = new Carrousel(189, 150, 600, 630, 1);
    // Assigna les imatge al carrousel
    c.setImages(noms);
    // Assigna les imatges dels botons al carrousel
    c.setButtons("bPrev.png", "bNext.png");

    t = new Timer(5);

    s = new LinesDiagram(50, 50, width-100, height - 200);

    ps = new PagedProducts(numCardsPage, 50, 50, cardsW, cardsH);
    ps.setData(info);
    ps.setCards(imgMes, imgMenys);


    // Configuració de Dades (textos, valors, colors)
    s.setTexts(textos);
    s.setValues(values);
    s.setColors(colorLine);

    mb = new MenuButton(100, 100, menuButtonW, menuButtonH);
    bOpcio1 = new Button("Inici", mb.x, mb.y + mb.h + 5, menuButtonW, menuButtonH);
    bOpcio2 = new Button("Catàleg", mb.x, mb.y + mb.h + 10 + menuButtonH, menuButtonW, menuButtonH);
    bOpcio3 = new Button("Cistella", mb.x, mb.y + mb.h + 15 + 2*menuButtonH, menuButtonW, menuButtonH);
    bOpcio4 = new Button ("Log Out", mb.x, mb.y + 15 + 2*menuButtonH, menuButtonW, menuButtonH);

    //Constructor dels componetns
  }

  void dibuixaPantallaLogin() {
    bLogin.display(30);
    bSignup.display(30);
    userText.display();
    passText.display();

    imageMode (CENTER);
    image(imgLogin, 1053, 218, 250, 150);

    c.display();
    updateFoto();

    fill(0);
    textSize(24);
    text ("or", 1039, 656, 200, 35);
  }


  void dibuixaPantallaInicial() {
    fill(0);
    textSize(100);
    textFont(getFirstFont());
    textAlign(CENTER);
    text("FARM2HOME", (width/2), 155, 35);

    strokeWeight(3);
    line(34, 118, 364, 118);

    strokeWeight(3);
    line(1083, 118, 1405, 118);
    s.display();

    mb.display();
    if (menuOpened) {
      bOpcio1.display();
      bOpcio2.display();
      bOpcio3.display();
      bOpcio4.display();
    }
  }

  void dibuixaPantallaProductes() {
    //fill(0);
    //textSize(100);
    //textFont(getFirstFont());
    //textAlign(CENTER);
    //text("FARM2HOME", (width/2), 155, 35);

    //strokeWeight(3);
    //line(34, 118, 364, 118);

    strokeWeight(3);
    line(1083, 118, 1405, 118);
    ps.display();

    if (cs!=null) {
      fill(0);
      textSize(24);
      textAlign(LEFT);
      text(cs.title, width - 280, height/2);
      text(cs.price+"€", width - 280, height/2 + 30);
      text(cs.cQuantity.value, width - 280, height/2 + 60);
    }
    mb.display();
    if (menuOpened) {
      bOpcio1.display();
      bOpcio2.display();
      bOpcio3.display();
      bOpcio4.display();
    }
  }

  void dibuixaPantallaSignup() {
    bEndRegister.display(30);
    userRepeatPasswText.display();
    userPasswText.display();
    correuText.display();
    userNameText.display();

    imageMode (CENTER);
    image(imgLogin, width/2, 214, 250, 150);
  }

  void dibuixaPantallaPagament() {

    fill(0);
    textFont(getFirstFont());
    textSize(100);
    textAlign(CENTER);
    text("FARM2HOME", (width/2), 155, 35);

    strokeWeight(3);
    line(34, 118, 364, 118);

    strokeWeight(3);
    line(1083, 118, 1405, 118);

    nomText.display();
    llinatgesText.display();
    domiciliText.display();
    poblacioText.display();
    targetaText.display();
    bFinalitzarPagament.display(40);
    cadText.display();
    cvvText.display();
    mb.display();
    if (menuOpened) {
      bOpcio1.display();
      bOpcio2.display();
      bOpcio3.display();
      bOpcio4.display();
    }
  }
  void dibuixaPantallaCistella(){}

  void updateFoto() {

    if (t.timeOver()) {
      c.next();
    }
    t.update();
  }
}
