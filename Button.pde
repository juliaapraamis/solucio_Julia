// Classe Botó

class Button {
  
 // Propietats d'un botó:
 float x, y, w, h;  // Posició i dimensions
 
 // Colors de contorn, farciment, actiu i desactiu
 color fillColor, strokeColor;
 color fillColorOver, fillColorDisabled;
 
 String textBoto;  // Text
 boolean enabled;  // Abilitat / desabilitat
 
 // Mètode Constructor
 Button(String text, float x, float y, float w, float h){
   this.textBoto = text;
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.enabled = true;
   fillColor = color(#4B97AE); //Puc canviar
   fillColorOver = color(#54B9D0);
   fillColorDisabled = color(#4B97AE);
   strokeColor = color(0);
 }
 
 // Setters
 
 void setEnabled(boolean b){
   this.enabled = b;
 }
 
 // Dibuixa el botó
 void display(int x){
   pushStyle();
   if(!enabled){
     fill(fillColorDisabled);  // Color desabilitat
   }
   else if(mouseOverButton()){
     fill(fillColorOver);      // Color quan ratolí a sobre
   }
   else{
     fill(fillColor);          // Color actiu però ratolí fora
   }
   stroke(strokeColor); strokeWeight(2);        //Color i gruixa del contorn
   rect(this.x, this.y, this.w, this.h, 10);    // Rectangle del botó
   
   // Text (color, alineació i mida)
  
   textFont (getFirstFont());
   fill(0); textAlign(CENTER); textSize(x);
   text(textBoto, this.x + this.w/2, this.y + this.h/2 + 10);
   popStyle();
 }
 
 // Indica si el cursor està sobre el botó
 boolean mouseOverButton(){
   return (mouseX >= this.x) && 
          (mouseX<=this.x + this.w) && 
          (mouseY>= this.y) && 
          (mouseY<= this.y + this.h); 
 }
  
}
