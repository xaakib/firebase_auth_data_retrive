import 'package:firebase_auth_data_retrive/api/food_api.dart';
import 'package:firebase_auth_data_retrive/model/user.dart';
import 'package:firebase_auth_data_retrive/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthMode { Singup, Login }

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = new TextEditingController();

  AuthMode _authMode = AuthMode.Login;
  User _user = User();

  @override
  void initState() {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    initializeCurrentUser(authNotifier);
    super.initState();
  }

  void _submiteForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    if (_authMode == AuthMode.Login) {
      login(_user, authNotifier);
    } else {
      singup(_user, authNotifier);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Auth"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 96, 32, 10),
            child: Column(
              children: [
                Text(
                  "Please Sing In",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 36),
                ),
                SizedBox(
                  height: 32,
                ),
                _authMode == AuthMode.Singup
                    ? _buildDisplayNameField()
                    : Container(),
                _buildEmailField(),
                _buildPasswordField(),
                _authMode == AuthMode.Singup
                    ? _buildConfirmPasswordField()
                    : Container(),
                SizedBox(
                  height: 32,
                ),
                RaisedButton(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Switch To ${_authMode == AuthMode.Login ? 'Singup' : 'Login'}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _authMode = _authMode == AuthMode.Login
                          ? AuthMode.Singup
                          : AuthMode.Login;
                    });
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () => _submiteForm(),
                  child: Text(
                    _authMode == AuthMode.Login ? 'Login' : 'Singup',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDisplayNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Display Name",
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontSize: 26,
      ),
      onSaved: (String value) {
        _user.displayName = value;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontSize: 26,
      ),
      onSaved: (String value) {
        _user.email = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
      ),
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 26,
      ),
      obscureText: true,
      controller: _passwordController,
      onSaved: (String value) {
        _user.password = value;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
      ),
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 26,
      ),
      obscureText: true,
      onSaved: (String value) {
        _user.password = value;
      },
    );
  }
}
