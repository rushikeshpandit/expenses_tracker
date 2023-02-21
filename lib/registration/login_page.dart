import 'package:flutter/material.dart';
import 'package:expenses_tracker/utility/helper.dart';
import 'package:expenses_tracker/components/custom_text_field.dart';
import 'package:expenses_tracker/registration/registration_page.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text('Login', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: deviceHeight(context) * 1.2,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: deviceWidth(context) * 0.05),
                child: Column(
                  children: [
                    SizedBox(
                      height: deviceHeight(context) * 0.04,
                    ),
                    CustomTextFormField(
                        controller: _emailController,
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        isSuffix: false,
                        obsureText: false,
                        validator: _emailValidator),
                    SizedBox(
                      height: deviceHeight(context) * 0.04,
                    ),
                    CustomTextFormField(
                        controller: _passwordController,
                        label: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        isSuffix: true,
                        callback: callback,
                        icon: Icon(_isHidden
                            ? Icons.visibility
                            : Icons.visibility_off),
                        obsureText: _isHidden,
                        validator: _passwordValidator),
                  ],
                ),
              ),
              SizedBox(
                height: deviceHeight(context) * 0.15,
              ),
              Column(
                children: [
                  MaterialButton(
                    minWidth: deviceWidth(context) * 0.9,
                    height: 60,
                    onPressed: () {
                      onSubmitData();
                    },
                    color: kVioletColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account yet? ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey),
                      ),
                      InkWell(
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              color: kVioletColor),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegistrationPage()),
                          );
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _passwordValidator(String? pwd) {
    if (!isAlphanumeric(pwd!)) {
      return 'Enter a valid password';
    }
    return null;
  }

  String? _emailValidator(String? email) {
    if (!isEmail(email!)) {
      return 'Enter a valid email';
    }
    return null;
  }

  void callback() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void onSubmitData() {
    String email = _emailController.text;
  }
}
