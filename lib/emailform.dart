import 'dart:math';

import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class EmailForm extends StatefulWidget {
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Correo electrónico',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value != null) {
          if (value.isEmpty) {
            return 'Por favor, ingrese un correo electrónico';
          }

          if (!value.contains('@') ||
              !value.substring(value.indexOf('@')).contains('.')) {
            return 'Por favor, ingrese un correo electrónico válido';
          }
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) {
          _email = value;
        }
      },
    );
  }
}
