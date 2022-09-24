import '../../dto/email_dto.dart';

abstract class EnviarEmail {
  bool enviar(EmailDto emailDto);
}
