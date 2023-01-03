import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.onLoginCallback})
      : super(key: key);
  final Function(bool loggedIn) onLoginCallback;

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    //  var router = AutoRouter.of(context);
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.info_outline,
                      size: 24.0,
                    ),
                    label: const Text(
                      'Help',
                      style: TextStyle(fontSize: 20.0),
                    )),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Hello!',
                  style: TextStyle(fontSize: 34),
                ),
                const Text(
                  'Enter your 10 digit mobile number to proceed',
                  style: TextStyle(fontSize: 16),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 15.0),
                        child: const Divider(
                          color: Colors.white,
                          height: 50,
                          thickness: 1.5,
                        )),
                  ),
                  const Text("Log in or Sign up"),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 15.0),
                        child: const Divider(
                          color: Colors.white,
                          height: 50,
                          thickness: 1.5,
                        )),
                  ),
                ]),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        IntlPhoneField(
                          decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.white,
                                    width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.white,
                                    width: 1.5),
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              iconColor: Colors.white),
                          initialCountryCode: 'IN',
                          showCountryFlag: false,
                          onChanged: (phone) {
                            phoneNumber = phone.completeNumber;
                          },
                          onCountryChanged: (country) {
                            print('Country changed to: ${country.name}');
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   router.push(
                            //       OtpValidateRoute(phoneNumber: phoneNumber));
                            // }
                          },
                          child: const Text('Continue'),
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                const Text(
                  'By continuing, you agree to our',
                  textAlign: TextAlign.center,
                ),
                TextButton(
                    onPressed: () {
                      //  router.push(const TermsRoute());
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.zero, // and this
                    ),
                    child: const Text(
                      'Terms of Service, Privacy Policy, Content Policy',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ))
              ],
            ),
          ]),
    )));
  }
}
