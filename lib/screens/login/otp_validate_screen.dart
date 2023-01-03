import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class OtpValidateScreen extends StatefulWidget {
  const OtpValidateScreen(
      {Key? key, @PathParam('phoneNumber') required this.phoneNumber})
      : super(key: key);
  final String phoneNumber;

  @override
  OtpValidateScreenState createState() => OtpValidateScreenState();
}

class OtpValidateScreenState extends State<OtpValidateScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _verificationId;
  final controller = TextEditingController();
  final focusNode = FocusNode();
//  late AuthService authService;
  bool _isLoading = false;
  @override
  void initState() {
    //  authService = context.read<AuthService>();
    super.initState();
    // _verifyPhoneNumber();
  }

  // Future _verifyPhoneNumber() async {
  //   _auth.verifyPhoneNumber(
  //       phoneNumber: widget.phoneNumber,
  //       timeout: const Duration(seconds: 60),
  //       verificationCompleted: (phoneCredentials) async {},
  //       verificationFailed: (verificationFailed) async {
  //         print('Verification failed');
  //       },
  //       codeSent: (verificationId, resendingToken) async {
  //         setState(() {
  //           _verificationId = verificationId;
  //         });
  //         print('Code sent');
  //       },
  //       codeAutoRetrievalTimeout: (verificationId) async {
  //         print('AutoRetrievalTimeout $verificationId');
  //       });
  // }

  // Future _sendCodeToFirebase(
  //     {String? code, required BuildContext context}) async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   var router = AutoRouter.of(context);
  //   var credentials = PhoneAuthProvider.credential(
  //       verificationId: _verificationId, smsCode: code!);
  //   await _auth
  //       .signInWithCredential(credentials)
  //       .then((credential) async {
  //         authService.idToken = (await _auth.currentUser?.getIdToken(true))!;
  //         var uri = Uri.parse('http://10.0.2.2:8080/user');
  //         http.Response response = await http.get(uri, headers: {
  //           'Authorization': 'Bearer ${authService.idToken}',
  //         });
  //         authService.authenticated = true;
  //         setState(() {
  //           _isLoading = false;
  //         });
  //         if(response.statusCode == 404) {
  //           router.replace(UserProfileRoute(title: 'Set up your profile', saveText: 'Save & Continue'));
  //         } else {
  //           authService.currentUser = model.User.fromJson(jsonDecode(response.body));
  //           router.replace(const DashboardRoute());
  //         }
  //       })
  //       .whenComplete(() => {})
  //       .onError((error, stackTrace) {
  //         setState(() {
  //           _isLoading = false;
  //         });
  //         print(error);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    const length = 6;
    Color borderColor = Theme.of(context).primaryColor;
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color(0xff11272a);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Enter the code sent to the number',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.phoneNumber,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 64)
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 68,
                    child: Pinput(
                      length: length,
                      controller: controller,
                      focusNode: focusNode,
                      defaultPinTheme: defaultPinTheme,
                      onCompleted: (pin) {},
                      focusedPinTheme: defaultPinTheme.copyWith(
                        height: 68,
                        width: 64,
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: borderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyWith(
                        decoration: BoxDecoration(
                          color: errorColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   _sendCodeToFirebase(
                      //       code: controller.text, context: context);
                      // }
                    },
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          )
                        : const Text('Continue'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 44),
            const Text(
              'Didn’t receive code?',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Resend',
              style: TextStyle(
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ));
  }
}
