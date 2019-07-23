import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validator {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  //stream
  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);
  Stream<bool> get submitValidation =>
      Observable.combineLatest2(email, password, (e, p) {
        print(e);
        print(p);
        if (e == _email.value && p == _password.value) {
          return true;
        }
        return false;
      });

  submit() {
    final email = _email.value;
    final password = _password.value;

    print('$email  ...  $password');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
