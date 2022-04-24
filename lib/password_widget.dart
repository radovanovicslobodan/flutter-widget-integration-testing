import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {
  final int index;
  final backCallback;

  const PasswordWidget({Key? key, required this.index, this.backCallback})
      : super(key: key);

  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  final _passwordFocusNode = FocusNode();
  var _password = '';

  var _passwordValid = false;
  var _passwordError = '';

  void _validatePassword() {
    if (_password.length >= 5) {
      setState(() {
        _passwordValid = true;
        _passwordError = '';
      });
    } else {
      setState(() {
        _passwordValid = false;
        _passwordError = 'Your password should contain at least 5 characters';
      });
    }
  }

  void _saveForm() {
    showDialog(
      builder: (context) => SimpleDialog(
        contentPadding: const EdgeInsets.all(8),
        children: <Widget>[
          const Text('You succesfully saved your form.'),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Dissmiss'),
          ),
        ],
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_constructors
      children: <Widget>[
        TextField(
          decoration: const InputDecoration(labelText: 'password'),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          textInputAction: TextInputAction.done,
          onChanged: (value) {
            setState(() {
              _password = value;
            });
          },
          focusNode: _passwordFocusNode,
        ),
        Text(_passwordError),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  widget.backCallback(0);
                },
                child: const Text("Back")),
            ElevatedButton(
                onPressed: () {
                  _validatePassword();
                  if (_passwordValid) {
                    _saveForm();
                  }
                },
                child: const Text("Submit")),
          ],
        )
      ],
    );
  }
}
