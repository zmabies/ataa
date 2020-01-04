import 'package:ataa/components/common.dart';
import 'package:ataa/components/constants.dart';
import 'package:ataa/util/navigation_util.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return _buildPageContent(context);
  }

  Stack _buildPageContent(BuildContext context) {
    return Stack(
    children:<Widget>[
      Image.asset("resources/images/background.png", fit: BoxFit.cover, height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(38, 171, 38, 0),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Center(
              widthFactor: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Welcome back!",
                      style: TextStyle(
                          color: AppColors.dustyBlue,
                          fontSize: Dimens.header2,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 10),
                  Text("sign in to your account",
                      style: TextStyle(color: AppColors.mineshaft, fontSize: Dimens.semiMid)),
                  SizedBox(height: 25),
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
                  SizedBox(height: 30),
                  BuildGradientButton(text: "SIGN IN", onPressed: (){}),
                  SizedBox(height: 200),
                  GestureDetector(
                    onTap: () {
                      NavigationUtil().goToSignupScreen(context);
                    },
                    child: Text("dont have an account? sign up here",
                        style: TextStyle(
                            color: AppColors.mute)),
                  ),
                ],
              ),
            ),
          ),
        )),]
  );
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
}
