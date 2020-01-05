import 'package:ataa/components/common.dart';
import 'package:ataa/components/constants.dart';
import 'package:flutter/material.dart';

class LoginAndSignupPage extends StatefulWidget {
  @override
  _LoginAndSignupPageState createState() => _LoginAndSignupPageState();
}

enum FormType { login, signup }

class _LoginAndSignupPageState extends State<LoginAndSignupPage> {
  FormType type = FormType.login;
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage = "";

  void showSignupForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      type = FormType.signup;
    });
  }

  void showLoginForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      type = FormType.login;
    });
  }

  Widget errorWidget() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildPageContent(context);
  }

  Stack _buildPageContent(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "resources/images/background.png",
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(38, 171, 38, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child: Center(
                widthFactor: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(type == FormType.login ? "Welcome back!" : "Hello!",
                        style: TextStyle(
                            color: AppColors.dustyBlue,
                            fontSize: Dimens.header2,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 10),
                    Text(
                        type == FormType.login
                            ? "sign in to your account"
                            : "create an account and start making a difference",
                        style: TextStyle(
                            color: AppColors.mineshaft,
                            fontSize: Dimens.semiMid)),
                    SizedBox(height: 25),
                    type == FormType.login
                        ? _buildLoginForm()
                        : _buildSignupForm(),
                    SizedBox(height: 10),
                    errorWidget(),
                    SizedBox(height: 30),
                    BuildGradientButton(
                        text: type == FormType.login ? "SIGN IN" : "SIGN UP",
                        onPressed: () {}),
                    SizedBox(height: 200),
                    GestureDetector(
                      onTap: () {
                        if (type == FormType.login)
                          showSignupForm();
                        else
                          showLoginForm();
                      },
                      child: Text(
                          type == FormType.login
                              ? "dont have an account? sign up here"
                              : "already have an account? sign in here",
                          style: TextStyle(color: AppColors.mute)),
                    ),
                  ],
                ),
              ),
            ),
          )),
    ]);
  }

  Widget _buildInputFieldOutline(
      {String hint, IconData icon, TextInputType type, bool obscured = false}) {
    return Material(
      shadowColor: AppColors.shadow,
      elevation: 5,
      color: AppColors.white,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.mineshaft),
        keyboardType: type,
        obscureText: obscured,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.dust),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: AppColors.dustyBlue),
          ),
          suffixIcon: icon != null ? Icon(icon, color: AppColors.dust) : null,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: AppColors.dust),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: AppColors.dust),
          ),
        ),
      ),
    );
  }

  Form _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildInputFieldOutline(
              hint: "email@domain.com", type: TextInputType.emailAddress),
          SizedBox(height: 20),
          _buildInputFieldOutline(
              hint: "password",
              obscured: true,
              type: TextInputType.visiblePassword),
          SizedBox(height: 15),
          Text("forgot password?",
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: AppColors.dust, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }

  Form _buildSignupForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildInputFieldOutline(
              hint: "email@domain.com", type: TextInputType.emailAddress),
          SizedBox(height: 20),
          _buildInputFieldOutline(
              hint: "password",
              obscured: true,
              type: TextInputType.visiblePassword),
          SizedBox(height: 20),
          _buildInputFieldOutline(
              hint: "repeat password",
              obscured: true,
              type: TextInputType.visiblePassword),
        ],
      ),
    );
  }
}
