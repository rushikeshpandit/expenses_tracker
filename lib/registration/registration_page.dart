import 'package:expenses_tracker/components/custom_text_field.dart';
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
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.0,
              color: Colors.white,
            ),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: deviceHeight(context),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth(context) * 0.05,
                            vertical: deviceHeight(context) * 0.05),
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
                          ],
                        ),
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth(context) * 0.05,
                            vertical: deviceHeight(context) * 0.1),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: kVioletColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
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
    if (!isAlpha(name!)) {
      return 'Enter a valid name';
    }
    return null;
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
    print('callback ${_isHidden}');
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void onSubmitData() {
    String userName = _nameController.text;
    // if (!isAlpha(userName)) {
    //   setState(() {
    //     _nameErrorMessage = 'Enter a valid name';
    //   });
    // }
    print(userName);
  }
}