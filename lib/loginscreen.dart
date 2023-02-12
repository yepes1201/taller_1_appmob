import 'package:flutter/material.dart';
import 'package:taller_1_appmob/emailform.dart';
import 'package:taller_1_appmob/passwordform.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _termsAccepted = false;

  void login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Iniciando sesión...")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              EmailForm(),
              const SizedBox(height: 16.0),
              PasswordForm(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _termsAccepted ? login : null,
                child: const Text('Iniciar sesión'),
              ),
              Row(
                children: [
                  Checkbox(
                      value: _termsAccepted,
                      onChanged: (bool? value) {
                        setState(() {
                          _termsAccepted = value ?? false;
                        });
                      }),
                  const Text("Terminos y Condiciones"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
