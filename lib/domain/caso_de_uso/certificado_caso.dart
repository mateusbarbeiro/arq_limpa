import 'package:arq_limpa/domain/caso_de_uso/notificar_email_caso.dart';
import 'package:arq_limpa/domain/dto/certificado_dto.dart';
import 'package:arq_limpa/domain/entidades/atividade.dart';
import 'package:arq_limpa/domain/entidades/certificado.dart';
import 'package:get_it/get_it.dart';

import '../interfaces/dao/i_atividade_dao.dart';
import '../interfaces/dao/i_certificado_dao.dart';
import 'atividade_caso.dart';

class CertificadoCaso {
  late ICertificadoDao certificadoDao = GetIt.I.get<ICertificadoDao>();
  late IAtividadeDao atividadeDao = GetIt.I.get<IAtividadeDao>();

  Future<bool> criar(CertificadoCriarDto criarDto) async {
    try {
      Atividade atividade = await AtividadeCaso().buscaAtividadePorId(
        criarDto.atividadeId,
      );
      Certificado.criar(criarDto, atividade).validarQuantidadeHoras();

      await certificadoDao.insert(criarDto);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> atualizar(CertificadoAtualizarDto atualizarDto) async {
    try {
      Atividade atividade = await AtividadeCaso().buscaAtividadePorId(
        atualizarDto.atividadeId,
      );
      Certificado.criar(atualizarDto, atividade)
          .validarSePodeAtualizar()
          .validarQuantidadeHoras();

      await certificadoDao.update(atualizarDto);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> excluir(int id) async {
    try {
      CertificadoDto certificadoDto = await certificadoDao.getById(id);
      Atividade atividade = await AtividadeCaso().buscaAtividadePorId(
        certificadoDto.atividadeId,
      );
      Certificado.criar(
        certificadoDto,
        atividade,
      ).validarSePodeExcluir();

      await certificadoDao.deleteById(id);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<CertificadoDto?> buscarPorId(int id) async {
    try {
      CertificadoDto certificado = await certificadoDao.getById(id);
      return certificado;
    } catch (e) {
      return null;
    }
  }

  Future<List<CertificadoDto>> buscarTodos() async {
    try {
      List<CertificadoDto> certificados = await certificadoDao.getAll();
      return certificados;
    } catch (e) {
      return [];
    }
  }

  Future<bool> certificadoVerificarHoras(int id) async {
    try {
      CertificadoDto certificadoDto = await certificadoDao.getById(id);
      Atividade atividade = await AtividadeCaso().buscaAtividadePorId(
        certificadoDto.atividadeId,
      );
      Certificado certificado = Certificado.criar(
        certificadoDto,
        atividade,
      ).verificaHorasCertificado();

      certificadoDao.updateSomeFields({
        'quantidadeHorasValidadas': certificado.quantidadeHorasValidadas,
        'verificado': certificado.verificado,
      });

      NotificarEmailCaso().notificarCertificadoVerificado(
        'user@gmail.com',
        '''
          Certificado ${certificado.titulo.toUpperCase()} foi validado.
          Foram validadas ${certificado.quantidadeHorasValidadas} horas de ${certificado.quantidadeHoras} horas cadastradas.  
        ''',
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
