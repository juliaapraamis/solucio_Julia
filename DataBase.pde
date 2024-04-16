import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;
// Objecte de connexió a la BBDD
MySQL msql;

// Paràmetres de la connexió
String user     = "admin";
String pass     = "12345";
String database = "tienda";


// Connexió
void connexioBBDD() {

  msql = new MySQL( this, "localhost:8889", database, user, pass );

  // Si la connexió s'ha establert
  if (msql.connect()) {
    // La connexió s'ha establert correctament
    println("Connexió establerta :)");
  } else {
    // La connexió ha fallat!!!
    println("Error de Connexió :(");
  }
}

// Obté el número de files de la taula
int getNumRowsTaula(String nomTaula) {
  println(nomTaula);
  msql.query( "SELECT COUNT(*) AS n FROM %s", nomTaula );
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

// Obté informació de la taula Producte
String[][] getInfoTaulaProducte() {

  int numRows = getNumRowsTaula("productos");

  String[][] data = new String[numRows][7];

  int nr=0;
  String q = "SELECT p.idproductos AS ID, p.información AS TITULO, p.categoría AS CATEGORIA, p.información AS INFO, p.precioUnitario AS PRECIO, p.favorito AS FAVORITO, p.imagen_nombre AS FOTO FROM productos p ORDER BY  ID ASC";
  println(q);
  msql.query( q);
  while (msql.next()) {
    data[nr][0] = msql.getString("ID");
    data[nr][1] = msql.getString("TITULO");
    data[nr][2] = msql.getString("CATEGORIA");
    data[nr][3] = msql.getString("INFO");
    data[nr][4] = String.valueOf(msql.getFloat("PRECIO"));
    data[nr][5] = msql.getString("FAVORITO").equals("S") ? "true" : "false";
    data[nr][6] = msql.getString("FOTO");
    nr++;
  }
  return data;
}


boolean isValidUser(String userName, String password){
  String q = "SELECT COUNT(*) AS n FROM usuario WHERE usuario = '"+userName+"' AND password='"+password+"'";
  println(q);
  msql.query(q);
  msql.next();
  println(msql.getInt("n"));
  return msql.getInt("n")==1;
}



String[] getNomsTaulaUsuario(){
  
  int numRows = getNumRowsTaula("usuario");
  
  String[] data = new String[numRows];
  
  int nr=0;
  msql.query( "SELECT nombre FROM usuario" );
  while (msql.next()){
      data[nr] = msql.getString("nombre");
      nr++;
  }
  return data;
}

void insertInfoTaulaUsuario(String usuario, String correo, String password){
  String q = "INSERT INTO usuario (usuario, correo, password) VALUES ('"+usuario+"','"+correo+"','"+password+"')";
  println(q);
  msql.query(q);
}

/*void insertCompraTaulaUsuario(int compra){
  String q = "INSERT INTO usuario (compra) VALUES (compra)";
  println(q);
  msql.query(q);

}*/

/*void insertTarjetaTaulaUsuario(int tarjeta){
  String q = "INSERT INTO usuario (tarjeta) VALUES (tarjeta)";
  println(q);
  msql.query(q);

}*/

void printArray2D(String[][] array){
  for(int i=0; i<array.length; i++){
    for(int j=0; j<array[i].length; j++){
      print(array[i][j]+"\t");
    }
    println();
  }
}
