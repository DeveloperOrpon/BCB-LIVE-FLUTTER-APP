import 'package:flutter/material.dart';

import '../constants.dart';

class LoginSignupPage extends StatefulWidget {
  static const routeName = "/auth_screen";

  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  String errorMessage = '';
  bool _isLogin = true;
  bool _isObscure = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
  }

  Widget _errorMessage() {
    return Text(
      errorMessage.isEmpty ? "" : "$errorMessage",
      style: TextStyle(color: Colors.red),
    );
  }

  Widget _submitButton() {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: _isLogin ? null : null,
        style: ElevatedButton.styleFrom(
            primary: Globals.colorGreen,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        child: Text(
          _isLogin ? "Login" : "Register",
          style: const TextStyle(
              fontSize: 18,
              color: Globals.colorGreen,
              fontFamily: 'Montserrat-SemiBold'),
        ),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          _isLogin = !_isLogin;
        });
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Text(
        _isLogin
            ? "Don't have account? Register Instead"
            : "Have account? Login Instead.",
        style: const TextStyle(
            color: Globals.colorRed, fontFamily: 'Montserrat-SemiBold'),
      ),
    );
  }

  Widget _nameTextField() {
    return TextField(
      controller: _nameController,
      decoration: InputDecoration(
          hintText: 'Name',
          enabled: true,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: new BorderRadius.circular(10),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: new BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: new BorderRadius.circular(11),
          )),
      keyboardType: TextInputType.name,
    );
  }

  Widget _phoneTextField() {
    return TextField(
      controller: _phoneController,
      decoration: InputDecoration(
          hintText: 'Phone Number',
          enabled: true,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: new BorderRadius.circular(10),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: new BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: new BorderRadius.circular(11),
          )),
      keyboardType: TextInputType.number,
    );
  }

  Widget _emailTextField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Email',
          enabled: true,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: new BorderRadius.circular(10),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: new BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: new BorderRadius.circular(11),
          )),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _passwordTextField() {
    return TextField(
      controller: _passwordController,
      obscureText: _isObscure,
      decoration: InputDecoration(
          suffixIconColor: Theme.of(context).primaryColor,
          suffixIcon: IconButton(
              onPressed: () => setState(() {
                    _isObscure = !_isObscure;
                  }),
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off)),
          hintText: 'Password',
          enabled: true,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: new BorderRadius.circular(10),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: new BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: new BorderRadius.circular(11),
          )),
      keyboardType: TextInputType.text,
    );
  }

  Widget _loginTextFields() {
    return Column(
      children: [
        _emailTextField(),
        SizedBox(height: 3), //email
        _passwordTextField(), //password
      ],
    );
  }

  Widget _signupTextFields() {
    return Column(
      children: [
        _nameTextField(),
        const SizedBox(height: 3),
        _phoneTextField(),
        const SizedBox(height: 3),
        _emailTextField(),
        const SizedBox(height: 3),
        _passwordTextField()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Globals.colorGreen),
        title: const Text("Authentication",
            style: TextStyle(
                color: Color.fromRGBO(65, 100, 74, 1),
                fontFamily: "Montserrat-ExtraBold")),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Hello There, \n Welcome to BCB Live ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Montserrat-ExtraBold",
                  color: Globals.colorGreen,
                  fontSize: 32),
            ),
            const Text(
              "Login / Register",
              style: TextStyle(
                  fontFamily: "Montserrat-ExtraBold",
                  color: Globals.colorGreen,
                  fontSize: 18),
            ),
            SizedBox(height: 15),
            _isLogin ? _loginTextFields() : _signupTextFields(),
            _errorMessage(),
            SizedBox(height: 10),
            _submitButton(),
            SizedBox(height: 5),
            _loginOrRegisterButton(),
          ],
        ),
      ),
    );
  }
}
