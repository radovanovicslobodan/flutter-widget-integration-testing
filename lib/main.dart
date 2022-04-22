import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Multi Page Form Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _formIndex = 0;

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  var _email = '';
  var _password = '';

  var _emailValid = false;
  var _emailError = '';
  var _passwordValid = false;
  var _passwordError = '';

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _switchInputField(int newIndex) {
    setState(() {
      _formIndex = newIndex;
    });
    newIndex == 0
        ? FocusScope.of(context).requestFocus(_emailFocusNode)
        : FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

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
            child: const Text('Cool, thanks.'),
          ),
        ],
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Card(
            elevation: 4,
            child: Container(
              height: 160,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IndexedStack(
                    index: _formIndex,
                    children: <Widget>[
                      TextField(
                        decoration: const InputDecoration(labelText: 'email'),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        onSubmitted: (value) {
                          _validateEmail();

                          if (_emailValid) {
                            _switchInputField(_formIndex + 1);
                          }
                        },
                        focusNode: _emailFocusNode,
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(labelText: 'password'),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        onSubmitted: (value) {
                          _validatePassword();
                          if (_passwordValid) {
                            _saveForm();
                          } else {
                            FocusScope.of(context)
                                .requestFocus(_passwordFocusNode);
                          }
                        },
                        focusNode: _passwordFocusNode,
                      ),
                    ],
                  ),
                  Container(
                    child: _formIndex == 0
                        ? Text(_emailError)
                        : Text(_passwordError),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _formIndex == 0
                          ? Container()
                          : TextButton(
                              onPressed: () {
                                _switchInputField(_formIndex - 1);
                              },
                              child: const Text('Back'),
                            ),
                      _formIndex == 1
                          ? TextButton(
                              onPressed: () {
                                _validatePassword();
                                if (_passwordValid) {
                                  _saveForm();
                                }
                              },
                              child: const Text('Submit'),
                            )
                          : TextButton(
                              onPressed: () {
                                _validateEmail();
                                if (_emailValid) {
                                  _switchInputField(_formIndex + 1);
                                }
                              },
                              child: const Text('Next'),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
