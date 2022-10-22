// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, deprecated_member_use

import 'package:arq_limpa/domain/dto/email_dto.dart';
import 'package:arq_limpa/domain/interfaces/portas/i_enviar_email.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailSender extends IEnviarEmail {
  String username = 'username@gmail.com';
  String password = 'password';

  @override
  Future<bool> enviar(EmailDto emailDto) async {
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Certificado')
      ..recipients.add(emailDto.emailDestinatario)
      ..subject = emailDto.assunto
      ..text = emailDto.corpo;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      return true;
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
      return false;
    }
  }
}
