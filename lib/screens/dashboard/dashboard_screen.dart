import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../util/auth_service.dart';
import 'dashboard-actions.dart';
import 'dashboard-header.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  //late AuthService authService;
  late StackRouter router;
  bool _isLoading = false;
  bool _budgetActive = false;

  @override
  void initState() {
    super.initState();
    router = AutoRouter.of(context);
    // loadData();
  }

  // void loadData() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   var uri = Uri.parse('http://10.0.2.2:8080/budgets/active');
  //   http.Response response = await http.get(uri, headers: {
  //     'Authorization': 'Bearer ${authService.idToken}',
  //   });
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _isLoading = false;
  //       _budgetActive = true;
  //     });
  //   } else {
  //     setState(() {
  //       _isLoading = false;
  //       _budgetActive = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // authService = context.watch<AuthService>();

    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
          const DashboardHeader(),
          if (_isLoading)
            const SizedBox(
              height: 100,
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_budgetActive)
            const Text('Budget')
          else
            const DashboardActions(),
        ]))));
  }
}
