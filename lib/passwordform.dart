import 'package:flutter/material.dart';

class PasswordForm extends StatefulWidget {
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final RegExp passwordRegex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  );
  String _password = '';
  bool _passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !_passwordVisibility,
      decoration: InputDecoration(
          labelText: 'Contraseña',
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passwordVisibility = !_passwordVisibility;
                });
              },
              icon: Icon(_passwordVisibility
                  ? Icons.visibility
                  : Icons.visibility_off))),
      validator: (value) {
        if (value != null) {
          if (value.isEmpty) {
            return 'Por favor, ingrese una contraseña';
          }
          if (!passwordRegex.hasMatch(value)) {
            return 'La contraseña debe tener al menos 8 caracteres, una mayúscula, un número y un carácter especial';
          }
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) {
          _password = value;
        }
      },
    );
  }
}
