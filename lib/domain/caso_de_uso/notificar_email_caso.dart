import '../dto/email_dto.dart';
import '../interfaces/portas/i_enviar_email.dart';

class NotificarEmailCaso {
  late IEnviarEmail enviarEmail;

  Future<bool> notificarCertificadoCadastrado(String email) async {
    return await enviarEmail.enviar(EmailDto(email, '', ''));
  }

  Future<bool> notificarCertificadoAtualizado(String email) async {
    return await enviarEmail.enviar(EmailDto(email, '', ''));
  }

  Future<bool> notificarCertificadoVerificado(
      String email, String mensagem) async {
    return await enviarEmail.enviar(EmailDto(
      email,
      'Certificado validado.',
      mensagem,
    ));
  }
}
