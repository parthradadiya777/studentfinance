import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/User.dart';
import '../../../theme/app-theme.dart';
import '../../../util/auth_service.dart';
import '../../../widgets/profile-menu-item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _darkTheme = true;
  late AuthService authService;
  late StackRouter router;

  @override
  void initState() {
    super.initState();
    router = AutoRouter.of(context);
  }

  @override
  Widget build(BuildContext context) {
    authService = context.watch<AuthService>();
    User? currentUser = authService.currentUser;
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 55,
              )
            ],
          ),
          Text(
            '${currentUser?.firstName} ${currentUser?.lastName}',
            style: const TextStyle(fontSize: 20, height: 2),
            textAlign: TextAlign.center,
          ),
          Text(
            '${currentUser?.phoneNumber?.substring(0, 3)} ${currentUser?.phoneNumber?.substring(3)}',
            style: const TextStyle(fontSize: 14, height: 1.3),
            textAlign: TextAlign.center,
          ),
          const Divider(
            color: AppTheme.primary,
            thickness: 3,
            endIndent: 160,
            indent: 160,
          ),
          ProfileMenuItem(
              title: 'My Profile',
              subTitle: 'Manage account information',
              onPressed: () {
                // router.push(UserProfileRoute(
                //     saveText: 'Save', currentUser: currentUser));
              }),
          ProfileMenuItem(
              title: 'My Budgets',
              subTitle: 'Manage account information',
              onPressed: () {}),
          ProfileMenuItem(
              title: 'My App Account',
              subTitle: 'Manage account information',
              onPressed: () {}),
          ProfileMenuItem(
              title: 'Account Preferences',
              subTitle: 'Manage account information',
              onPressed: () {}),
          ProfileMenuItem(
              title: 'App Permissions',
              subTitle: 'Manage what access the app has',
              onPressed: () {}),
          ProfileMenuItem(
            title: 'Dark Theme',
            onPressed: () {},
            showEndIcon: false,
            endWidget: Switch(
              value: _darkTheme,
              activeColor: AppTheme.primary,
              inactiveThumbColor: AppTheme.primary[700],
              onChanged: (value) {
                setState(() {
                  _darkTheme = value;
                });
              },
            ),
          ),
          ProfileMenuItem(
              title: 'Feedback',
              subTitle: 'We would love to hear from you',
              onPressed: () {}),
          ProfileMenuItem(
              title: 'About',
              subTitle: 'About Us, Terms of Use, FAQs etc.',
              onPressed: () {}),
          ProfileMenuItem(title: 'Log Out', onPressed: () {}),
          const Divider(
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 20,
              ),
              Text('App Version 0.0.1'),
            ],
          )
        ],
      ),
    )));
  }
}
