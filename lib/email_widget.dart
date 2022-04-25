import 'package:flutter/material.dart';

class EmailWidget extends StatefulWidget {
  final int index;
  final nextCallback;

  const EmailWidget({Key? key, required this.index, this.nextCallback})
      : super(key: key);

  @override
  _EmailWidgetState createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  var _email = '';
  final _emailFocusNode = FocusNode();

  var _emailValid = false;
  var _emailError = '';

  void _validateEmail() {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email)) {
      setState(() {
        _emailValid = true;
        _emailError = '';
      });
    } else {
      setState(() {
        _emailValid = false;
        _emailError = 'Please enter a valid email address';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          key: const Key("emailInput"),
          decoration: const InputDecoration(labelText: 'email'),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            setState(() {
              _email = value;
            });
          },
          focusNode: _emailFocusNode,
        ),
        Text(_emailError),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                key: const Key("nextButton"),
                onPressed: () {
                  _validateEmail();
                  if (_emailValid) {
                    widget.nextCallback(1);
                  }
                },
                child: const Text("Next"))
          ],
        )
      ],
    );
  }
}
