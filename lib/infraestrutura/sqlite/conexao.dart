import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static Database? _db;

  static Future<Database> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'certificado_arq_limp');
      _db = await openDatabase(path, version: 1, onCreate: (db, v) {
        db.execute(createTableGrupo);
        db.execute(createTableAtividade);
        db.execute(createTableCertificado);
        // db.execute(insertCertificado);
      });
    }
    return _db!;
  }
}

const createTableGrupo = '''
  CREATE TABLE grupos (
    id INTEGER PRIMARY KEY
    ,nome VARCHAR(50) NOT NULL
    ,descricao VARCHAR(50) NOT NULL
    ,horas_obrigatorias INTEGER NOT NULL
  )
''';

const createTableAtividade = ''''
  CREATE TABLE atividades (
    id INTEGER PRIMARY KEY
    ,nome VARCHAR(50) NOT NULL
    ,maximo_horas INTEGER NOT NULL
    ,equivalencia INTEGER NOT NULL
    ,grupo_id INTEGER NOT NULL
    ,FOREIGN KEY(grupo_id) REFERENCES grupos(id)
  )
''';

const createTableCertificado = '''
  CREATE TABLE certificados (
    id INTEGER PRIMARY KEY
    ,titulo VARCHAR(50) NOT NULL
    ,descricao VARCHAR(200) NOT NULL
    ,dataEmissao VARCHAR(20) NOT NULL
    ,quantidadeHoras VARCHAR(5) NOT NULL
    ,quantidadeHorasValidadas VARCHAR(5) NULL
    ,verificado BOOLEAN NOT NULL CHECK (validado IN(0,1))
    ,atividade_id INTEGER NOT NULL
    ,urlImage VARCHAR(20) NULL
    ,FOREIGN KEY(atividade_id) REFERENCES atividades(id)
  )
''';

const insertGrupos = '''
  insert into grupos (nome, descricao, horas_obrigatorias) values 
  ('Grupo I','Atividades de ensino','50'),
  ('Grupo II','Atividades de pesquisa','50'),
  ('Grupo III','Atividades sociais','50');
''';
