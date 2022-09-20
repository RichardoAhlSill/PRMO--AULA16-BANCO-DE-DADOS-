import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {

  //path - caminho da pasta que vai salvar os dados
  //async - não espera a execução da proxima linha
  //await - espera algo
  //version - notifica a versão do banco
  //onCreate - cria o banco pela primeira vez
  //onUpgrade - descreve o que será atualizado
  //onDowngrade - voltar a uma versão antiga

  initDB() async {
    String databasePath = await getDatabasesPath(); //pode criar quantos banco quiser
    String path = join(databasePath, "pacote.db"); // join - junta a string(databasePath) com o pacote.db
    Database database = await openDatabase(path, version: 1, onCreate: onCreate); //só sera trocado o n° da versao quando for atualizado
    print(path);
    return database;
  }
  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql = "create table PACOTE (id INTEGER PRIMARY KEY, head varchar(100), url_image varchar(100), city varchar(100), title varchar(100), transport varchar(100), validity varchar(100), old_price double, current_price double, nights integer, discount double, persons integer, free_cancellation boolean);";
    await db.execute(sql);

    sql =
    "INSERT INTO PACOTE (id, head, url_image, city, title, transport, validity, old_price, current_price, nights, discount, persons, free_cancellation) VALUES (1, 'Pacote Amsterdam', 'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/02/passagens-aereas-amsterda-capa2019-03.jpg', 'Amsterdam, NLD', 'Pacote Amsterdam - 2022 e 2023', 'Aéreo + Hospedagem', '01 Jan 2022 a 31 Dez 2023', '5.486', '4.389', 8, 20, 2, 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO PACOTE (id, head, url_image, city, title, transport, validity, old_price, current_price, nights, discount, persons, free_cancellation) VALUES (1, 'Pacote Amsterdam', 'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/02/passagens-aereas-amsterda-capa2019-03.jpg', 'Amsterdam, NLD', 'Pacote Amsterdam - 2022 e 2023', 'Aéreo + Hospedagem', '01 Jan 2022 a 31 Dez 2023', '5.486', '4.389', 8, 20, 2, 1);";
    await db.execute(sql);
  }
}