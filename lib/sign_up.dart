import 'package:flutter/material.dart';
import 'package:flutter_minggu10/sign_in.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Scaffold(
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
                      Text("Register Email"),
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
                _signUpEmail(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUpEmail() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signUpEmail(email.text, password.text).then((result) {
          if (result != null) {
            Navigator.pop(context);
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
}
