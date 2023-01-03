import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

import '../../../model/User.dart' as model;
import '../../../theme/app-theme.dart';
import '../../../util/auth_service.dart';
import '../../../widgets/choice-chips.dart';
import '../../../widgets/important_note.dart';

class UserProfileScreen extends StatefulWidget {
  final String? title;
  final String saveText;
  final model.User? currentUser;

  const UserProfileScreen(
      {Key? key, this.title, required this.saveText, this.currentUser})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserProfileScreenState();
  }
}

class UserProfileScreenState extends State<UserProfileScreen> {
  late AuthService authService;
  String _maritalStatus = '';
  String _gender = '';
  String _profession = '';
  String _monthlyIncome = '';
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late StackRouter router;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService = context.read<AuthService>();
    router = AutoRouter.of(context);
    if (widget.currentUser != null) {
      model.User currentUser = widget.currentUser!;
      setState(() {
        firstNameController.text = currentUser.firstName!;
        lastNameController.text = currentUser.lastName!;
        emailController.text = currentUser.email!;
        _maritalStatus = currentUser.maritalStatus!;
        _gender = currentUser.gender!;
        _profession = currentUser.profession!;
        _monthlyIncome = currentUser.monthlyIncome!;
      });
    }
  }

  void createUserProfile() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      var uri = Uri.parse('http://10.0.2.2:8080/user');
      var user = model.User(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        maritalStatus: _maritalStatus,
        gender: _gender,
        profession: _profession,
        monthlyIncome: _monthlyIncome,
      );
      ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
      http
          .post(uri,
              headers: {
                'Authorization': 'Bearer ${authService.idToken}',
                'Content-Type': 'application/json'
              },
              body: jsonEncode(user.toJson()))
          .then((response) {
        if (response.statusCode == 200) {
          authService.currentUser =
              model.User.fromJson(jsonDecode(response.body));
          messenger.showSnackBar(const SnackBar(
            content: Text('User profile updated successfully'),
          ));
          setState(() {
            _isLoading = false;
          });
          //  router.replace(const DashboardRoute());
        }
      }).catchError((error) {
        setState(() {
          _isLoading = false;
        });
        messenger.showSnackBar(const SnackBar(
          content: Text('Error updating user!!'),
        ));
      });
    }
  }

  void updateUserProfile() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      var uri = Uri.parse('http://10.0.2.2:8080/user');
      var user = model.User(
        uid: widget.currentUser?.uid!,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        maritalStatus: _maritalStatus,
        gender: _gender,
        profession: _profession,
        monthlyIncome: _monthlyIncome,
      );
      ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
      http
          .put(uri,
              headers: {
                'Authorization': 'Bearer ${authService.idToken}',
                'Content-Type': 'application/json'
              },
              body: jsonEncode(user.toJson()))
          .then((response) {
        authService.currentUser =
            model.User.fromJson(jsonDecode(response.body));
        messenger.showSnackBar(const SnackBar(
          content: Text('User profile updated successfully'),
        ));
        setState(() {
          _isLoading = false;
        });
      }).catchError((error) {
        messenger.showSnackBar(const SnackBar(
          content: Text('Error updating user!!'),
        ));
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  String? requiredValidator(value) {
    const requiredErrorText = 'This field is required';
    if (value == null || value.isEmpty) {
      return requiredErrorText;
    }
    return null;
  }

  String? emailValidator(value) {
    return !EmailValidator.validate(value) ? 'Email address is invalid' : null;
  }

  @override
  Widget build(BuildContext context) {
    const note =
        'We need this information to personalise your investments and to customise your experience on the app.\nWe follow bank grade level data safety protocols. Your data is completely safe with us.\nWe do not share or sell your data for promotional purposes.';
    const inputBorder = UnderlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.white));
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const ImportantNote(note: note),
                      if (widget.title != null)
                        Text(
                          widget.title!,
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                        ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 55,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: FloatingActionButton(
                                      backgroundColor: AppTheme.primary,
                                      onPressed: () {},
                                      mini: true,
                                      child: const Icon(Icons.edit)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                controller: firstNameController,
                                decoration: const InputDecoration(
                                    border: inputBorder,
                                    enabledBorder: inputBorder,
                                    hintText: 'First Name*',
                                    hintStyle: TextStyle(color: Colors.grey)),
                                validator: requiredValidator,
                              ),
                              TextFormField(
                                controller: lastNameController,
                                decoration: const InputDecoration(
                                    border: inputBorder,
                                    enabledBorder: inputBorder,
                                    hintText: 'Last Name*',
                                    hintStyle: TextStyle(color: Colors.grey)),
                                validator: requiredValidator,
                              ),
                              TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                    border: inputBorder,
                                    enabledBorder: inputBorder,
                                    hintText: 'Email Address',
                                    hintStyle: TextStyle(color: Colors.grey)),
                                validator: emailValidator,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ChoiceChips(
                                header: 'Marital Status',
                                options: const ['Single', 'Married'],
                                selected: _maritalStatus,
                                onSelected: (String selected) {
                                  setState(() {
                                    _maritalStatus = selected;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ChoiceChips(
                                header: 'Gender',
                                options: const ['Female', 'Male', 'Non-binary'],
                                selected: _gender,
                                onSelected: (String selected) {
                                  setState(() {
                                    _gender = selected;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ChoiceChips(
                                header: 'Profession',
                                options: const [
                                  'Business',
                                  'Private',
                                  'Govt.',
                                  'Retired',
                                  'Self-Employed'
                                ],
                                selected: _profession,
                                onSelected: (String selected) {
                                  setState(() {
                                    _profession = selected;
                                  });
                                },
                              ),
                              ChoiceChips(
                                header: 'Monthly Income',
                                options: const [
                                  '1K - 20K',
                                  '20K - 50K',
                                  '50K - 1L',
                                  '1L - 2L',
                                  '> 2L'
                                ],
                                selected: _monthlyIncome,
                                onSelected: (String selected) {
                                  setState(() {
                                    _monthlyIncome = selected;
                                  });
                                },
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 18),
                                    minimumSize: const Size.fromHeight(40),
                                  ),
                                  onPressed: widget.currentUser != null
                                      ? updateUserProfile
                                      : createUserProfile,
                                  child: _isLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text(widget.saveText))
                            ],
                          ))
                    ]))));
  }
}
