import '../../dto/email_dto.dart';

abstract class IEnviarEmail {
  Future<bool> enviar(EmailDto emailDto);
}
