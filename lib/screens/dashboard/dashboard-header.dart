import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student/util/auth_service.dart';

class DashboardHeader extends StatefulWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  State<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  @override
  Widget build(BuildContext context) {
    AuthService authService = context.watch<AuthService>();
    return Container(
      height: 120,
      color: Colors.white,
      padding: const EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0), //or 15.0
            child: Container(
              height: 110.0,
              width: 110.0,
              color: const Color(0xffFF0E58),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hello! ${authService.currentUser?.firstName}',
                style: const TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Tap to see balance'))
            ],
          )
        ],
      ),
    );
  }
}
