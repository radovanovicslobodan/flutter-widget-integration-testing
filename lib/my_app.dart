import 'package:flutter/material.dart';
import 'package:multipage/email_widget.dart';
import 'package:multipage/password_widget.dart';

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

  void switchInputField(int newIndex) {
    setState(() {
      _formIndex = newIndex;
    });
    newIndex == 0
        ? FocusScope.of(context).requestFocus(_emailFocusNode)
        : FocusScope.of(context).requestFocus(_passwordFocusNode);
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
              height: 240,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IndexedStack(
                    index: _formIndex,
                    children: <Widget>[
                      EmailWidget(
                          index: _formIndex, nextCallback: switchInputField),
                      PasswordWidget(
                          index: _formIndex, backCallback: switchInputField),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
