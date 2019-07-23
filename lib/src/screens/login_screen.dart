import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          SizedBox(height: 20.0),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'email',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            hintText: 'password',
            labelText: 'password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValidation,
      builder: (context, snapshot) {
        return RaisedButton(
          color: Colors.blue,
          child: Text('Login'),
          onPressed:
              snapshot.hasData ? (snapshot.data ? bloc.submit : null) : null,
        );
      },
    );
  }
}
