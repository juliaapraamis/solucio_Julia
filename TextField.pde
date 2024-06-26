// Component Camp de Text

class TextField {

  // Propietats del camp de text
  int x, y, h, w;

  // Colors
  color bgColor = color(#BDBDBD);
  color fgColor = color(0, 0, 0);
  color selectedColor = color(#BEEE7A);
  color borderColor = color(30, 30, 30);
  int borderWeight = 1;

  // Text del camp
  String text = "";
  int textSize = 24;

  boolean selected = false;

  // Constructor
  TextField(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  // Dibuixa el Camp de Text
  void display() {
    pushStyle();
    if (selected) {
      fill(selectedColor);
    } else {
      fill(bgColor);
    }

    strokeWeight(borderWeight);
    stroke(borderColor);
    rect(x, y, w, h, 5);

    fill(fgColor);
    textFont(fonts[2],textSize);
    text(text, x + 5, y + textSize);
    popStyle();
  }

  // Afegeix, lleva el text que es tecleja
  void keyPressed(char key, int keyCode) {
    if (selected) {
      if (keyCode == (int)BACKSPACE) {
        removeText();
      } else if (keyCode == 32) {
        addText(' '); // SPACE
      } else {

        boolean isKeyCapitalLetter = (key >= 'A' && key <= 'Z');
        boolean isKeySmallLetter = (key >= 'a' && key <= 'z');
        boolean isKeyNumber = (key >= '0' && key <= '9');
        boolean isCaractSpecial = (key == '@' || key == '/' || key == ',' || key == 'ñ' || key == 'ç' || key == 'á' || key == 'à' || key == 'é'|| key =='è'|| key =='í'|| key =='ó'|| key =='ò'|| key =='ú'
        || key == 'Ñ'|| key =='Ç'|| key =='À'|| key =='Á'|| key =='È'|| key =='É'|| key =='Í'|| key =='Ò'|| key =='Ó'|| key =='Ú'|| key =='.' );
        

        if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber || isCaractSpecial) {
          addText(key);
        }
      }
    }
  }

  // Afegeix la lletra c al final del text
  void addText(char c) {
    if (this.text.length() + 1 < w) {
      this.text += c;
    }
  }

  // Lleva la darrera lletra del text
  void removeText() {
    if (text.length() > 0) {
      text = text.substring(0, text.length() - 1);
    }
  }

  // Indica si el ratolí està sobre el camp de text
  boolean mouseOverTextField() {
    return (mouseX >= this.x && mouseX <= this.x + this.w &&
      mouseY >= this.y && mouseY <= this.y + this.h);
  }

  // Selecciona el camp de text si pitjam a sobre
  // Deselecciona el camp de text si pitjam a fora
  void isPressed() {
    if (mouseOverTextField()) {
      selected = true;
    } else {
      selected = false;
    }
  }

  void removeAllText() {
    this.text = "";
  }
}
