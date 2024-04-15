class LiniaCesta {
  
  String idProducto;
  String nombre;
  float pu, ptotal;
  int cantidad;
  
  LiniaCesta(String id, String n, float pu, int c){
    this.idProducto = id;
    this.nombre = n;
    this.pu = pu;
    this.cantidad = c;
    this.ptotal = pu * c;
  }
    
}
