import 'package:expenses_tracker/components/custom_text_field.dart';
import 'package:expenses_tracker/components/dialog_utils.dart';
import 'package:expenses_tracker/registration/authentication_services.dart';
import 'package:expenses_tracker/registration/login_page.dart';
import 'package:expenses_tracker/utility/helper.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isHidden = true;
  bool? _isTermsAccepted = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthenticationServices services = AuthenticationServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text('Sign Up', style: TextStyle(color: Colors.black)),
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
                        controller: _nameController,
                        label: 'Name',
                        keyboardType: TextInputType.name,
                        isSuffix: false,
                        obsureText: false,
                        validator: _userNameValidator),
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
                    SizedBox(
                      height: deviceHeight(context) * 0.02,
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text(
                          'You must agree to Terms and conditions to use this app.',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black)),
                      checkColor: Colors.white,
                      activeColor: kVioletColor,
                      value: _isTermsAccepted,
                      onChanged: (bool? value) {
                        setState(() {
                          _isTermsAccepted = value;
                        });
                      },
                    ),
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
                    onPressed: () async {
                      onSubmitData();
                    },
                    color: kVioletColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: const Text(
                      "Sign Up",
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
                        "Already have an account? ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey),
                      ),
                      InkWell(
                        child: const Text(
                          "Login",
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
                                builder: (context) => const LoginPage()),
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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _userNameValidator(String? name) {
    if (!isAlpha(name!) && name.length <= 3) {
      return 'Enter a valid name';
    }
    return null;
  }

  String? _passwordValidator(String? pwd) {
    /**
     * 
     *  r'^
     *     (?=.*[A-Z])       // should contain at least one upper case
     *     (?=.*[a-z])       // should contain at least one lower case
     *     (?=.*?[0-9])      // should contain at least one digit
     *     (?=.*?[!@#\$&*~]) // should contain at least one Special character
     *     .{8,}             // Must be at least 8 characters in length  
     *   $
     */
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (pwd!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(pwd)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
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

  void onSubmitData() async {
    String username = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (!isAlpha(username) && username.length <= 3) {
      DialogUtils.displayDialogOKCallBack(
          context,
          'Invalid name',
          'Enter a valid name',
          () => Navigator.of(context, rootNavigator: true).pop());
      return;
    }

    if (!isEmail(email)) {
      DialogUtils.displayDialogOKCallBack(
          context,
          'Invalid email',
          'Enter a valid email',
          () => Navigator.of(context, rootNavigator: true).pop());
      return;
    }

    if (!isAlphanumeric(password) && password.length <= 5) {
      DialogUtils.displayDialogOKCallBack(
          context,
          'Invalid password',
          'Enter a valid password',
          () => Navigator.of(context, rootNavigator: true).pop());
      return;
    }

    if (!_isTermsAccepted!) {
      DialogUtils.displayDialogOKCallBack(
          context,
          'Terms',
          'You must agree to the terms and conditions to use this application',
          () => Navigator.of(context, rootNavigator: true).pop());
      return;
    }

    var registrationData = await services.signUp(username, email, password);
    // var returnObject = registrationData["returnObject"];
    print(registrationData);

    // updateUI(weatherData);
  }
}
