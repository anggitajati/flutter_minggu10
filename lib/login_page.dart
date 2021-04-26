import 'package:flutter/material.dart';
import 'package:flutter_minggu10/sign_in.dart';
import 'package:flutter_minggu10/sign_up.dart';

import 'first_screen.dart';
import 'login_email.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Login Email"),
                    TextFormField(
                      controller: email,
                    ),
                    TextFormField(
                      controller: password,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              _signInEmail(),
              _signInButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account? "),
                  MaterialButton(
                    child: Text("Register"),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUp();
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInEmail() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithEmailAndPassword(email.text, password.text).then((result) {
          if (result != null) {
            String email = result.email;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return LoginEmail(emailUser: email);
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Email',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FirstScreen();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
