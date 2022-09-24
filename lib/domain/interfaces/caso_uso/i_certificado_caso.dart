import '../../dto/certificado_dto.dart';

abstract class ICerificadoCaso {
  Future criarCerticado(CertificadoCriarDto criarDto);
}
