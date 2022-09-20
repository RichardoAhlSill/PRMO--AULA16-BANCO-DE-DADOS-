import 'package:semtitulo1/data/db_helper.dart';
import 'package:semtitulo1/domain/pacote_turistico.dart';
import 'package:sqflite/sqflite.dart';

class PacoteDao {

  Future<List<PacoteTuristico>> listarPacotes() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = "SELECT * FROM PACOTE:";
    final result = await db.rawQuery(sql);

    List<PacoteTuristico> lista = <PacoteTuristico>[];
    for(var json in result){

      PacoteTuristico pacote = PacoteTuristico.fromJson(json);
      lista.add(pacote);

    }

    return lista;
  }

}