

import 'package:flutter_email_sender/flutter_email_sender.dart';

Future<void> sendEmail(String recipientEmail) async {
  final Email email = Email(
    body: 'patient missed the medicine',
    subject: 'Test Email',
    recipients: [recipientEmail],
    cc: [],
    bcc: [],
    attachmentPaths: [],
    isHTML: false,
  );

  try {
    await FlutterEmailSender.send(email);
  } catch (error) {
    print(error.toString());
  }
}

