import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/repeating_classes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final _auth = FirebaseAuth.instance;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingOverlay(
        isLoading: _loading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'flashy',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextInputField(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                obscureText: false,
                onChanged: (value) {
                  _email = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextInputField(
                hintText: 'Enter your password',
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              ButtonsToGo(
                backgroundColor: Colors.lightBlue,
                heroTag: 'login',
                text: 'Log In',
                onTap: () async {
                  setState(() {
                    _loading = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    } else {
                      print('user not found');
                    }
                    setState(() {
                      _loading = false;
                    });
                  } catch (e) {
                    print('check internet connection');
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
