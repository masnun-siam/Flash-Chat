import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/repeating_classes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_overlay/loading_overlay.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = '/registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _loading = false;
  final _auth = FirebaseAuth.instance;
  String _email;
  String _password;
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
                hintText: 'Enter new password',
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
                backgroundColor: Colors.blueAccent,
                heroTag: 'registration',
                text: 'Registration',
                onTap: () async {
                  setState(() {
                    _loading = true;
                  });
                  try {
                    final newuser = await _auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    if (newuser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }

                    setState(() {
                      _loading = false;
                    });
                  } catch (e) {
                    print('something wrong, check your internet connection');
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
