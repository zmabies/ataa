import 'package:ataa/components/constants.dart';
import 'package:ataa/util/navigation_util.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                        Text("Hello!",
                            style: TextStyle(
                                color: AppColors.dustyBlue,
                                fontSize: Dimens.header2,
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 10),
                        Text("create an account and start making a difference",
                            style: TextStyle(color: AppColors.mineshaft, fontSize: Dimens.semiMid)),
                        SizedBox(height: 25),
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
                        SizedBox(height: 30),
                        _buildGradientButton(text: "SIGN UP", onPressed: (){}),
                        SizedBox(height: 200),
                        GestureDetector(
                          onTap: (){
                            NavigationUtil().goToSigninScreen(context);
                          },
                          child: Text("already have an account? sign in here",
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

  GestureDetector _buildGradientButton({String text, VoidCallback onPressed}) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onPressed,
        child: Container(
            constraints: BoxConstraints.expand(height: 50),
            height: 50,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.lilac, AppColors.dustyBlue],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.05, 0.9]),
                borderRadius: BorderRadius.circular(25)),
            child: Center(
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: Dimens.semiLarge,
                        fontWeight: FontWeight.w500)))));
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

