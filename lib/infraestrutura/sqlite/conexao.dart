import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static Database? _db;

  static Future<Database> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'certificado_arq1');
      _db = await openDatabase(path, version: 1, onCreate: (db, v) async {
        db.execute(createTableGrupo);
        db.execute(createTableAtividade);
        db.execute(createTableCertificado);
        db.execute(insertGrupos);
        db.execute(insertAtividade);

        // for (var element in await db.query('grupo')) {
        //   print(element['nome']);
        // }

        // for (var element in await db.query('atividade')) {
        //   print(element['nome']);
        // }
      });
    }
    return _db!;
  }
}

const createTableGrupo = '''
  CREATE TABLE grupo (
    id INTEGER PRIMARY KEY
    ,nome VARCHAR(50) NOT NULL
    ,descricao VARCHAR(50) NOT NULL
    ,horasObrigatorias INTEGER NOT NULL
  )
''';

const createTableAtividade = '''
  CREATE TABLE atividade (
    id INTEGER PRIMARY KEY
    ,nome VARCHAR(50) NOT NULL
    ,maximoHoras INTEGER NOT NULL
    ,equivalencia INTEGER NOT NULL
    ,grupoId INTEGER NOT NULL
    ,FOREIGN KEY (grupoId) REFERENCES grupo (id)
  )
''';

const createTableCertificado = '''
  CREATE TABLE certificado (
    id INTEGER PRIMARY KEY
    ,titulo VARCHAR(50) NOT NULL
    ,descricao VARCHAR(200) NOT NULL
    ,dataEmissao VARCHAR(20) NOT NULL
    ,quantidadeHoras VARCHAR(5) NOT NULL
    ,quantidadeHorasValidadas VARCHAR(5) NULL
    ,verificado BOOLEAN NOT NULL CHECK (verificado IN(0,1))
    ,urlImage VARCHAR(20) NULL
    ,atividadeId INTEGER NOT NULL
    ,FOREIGN KEY (atividadeId) REFERENCES atividade (id)
  )
''';

const insertGrupos = '''
  insert into grupo (nome, descricao, horasObrigatorias) values 
  ('Grupo I','Atividades de ensino','50'),
  ('Grupo II','Atividades de pesquisa','50'),
  ('Grupo III','Atividades sociais','50');
''';

const insertAtividade = '''
  insert into atividade (nome, maximoHoras, equivalencia, grupoId) values
  ('Estágio Supervisionado', 50, 10, 1),
  ('Encontros em áreas correlatas ao curso', 50, 100, 1),
  ('Outras atividades de ensino', 50, 50, 1),
  ('Participação como expositor em exposições técnico-científicas', 40, 100, 2),
  ('Outras atividades de Pesquisa, Extensão e Inovação', 20, 50, 2),
  ('Publicações em revistas técnicas', 40, 100, 2),
  ('Participação em atividades esportiva', 20, 100, 3),
  ('Participação em atividades beneficentes', 40, 100,3),
  ('Outras atividades de formação social, humana e cultural', 20, 50, 3);
''';
