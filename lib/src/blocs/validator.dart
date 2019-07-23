import 'dart:async';

class Validator {
  final emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (!email.contains('@')) {
      sink.addError('Invalid Email');
    } else {
      sink.add(email);
    }
  });

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length < 4) {
        sink.addError('Password should be at least 4 chars');
      } else {
        sink.add(password);
      }
    },
  );
}
