import '../dto/email_dto.dart';
import '../interfaces/portas/i_enviar_email.dart';

class NotificarEmailCaso {
  late IEnviarEmail enviarEmail;

  bool notificarCertificadoCadastrado(String email) {
    return enviarEmail.enviar(EmailDto(email, '', ''));
  }

  bool notificarCertificadoAtualizado(String email) {
    return enviarEmail.enviar(EmailDto(email, '', ''));
  }

  bool notificarCertificadoValidado(String email) {
    return enviarEmail.enviar(EmailDto(email, '', ''));
  }
}
