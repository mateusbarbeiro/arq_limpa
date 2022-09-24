import '../../dto/email_dto.dart';

abstract class IEnviarEmail {
  bool enviar(EmailDto emailDto);
}
