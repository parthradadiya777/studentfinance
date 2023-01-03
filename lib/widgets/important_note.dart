import 'package:flutter/material.dart';
import '../theme/app-theme.dart';

class ImportantNote extends StatelessWidget {
  final String note;
  const ImportantNote({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Column(
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            children: const [
              Icon(
                Icons.info,
                color: AppTheme.primary,
                size: 16,
              ),
              Text('Important Note',
                  style: TextStyle(
                      color: AppTheme.primary,
                      fontSize: 14,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            note,
            style: const TextStyle(
                color: Color.fromRGBO(144, 149, 161, 1),
                fontSize: 11,
                height: 1.4),
          )
        ],
      ),
    );
  }
}
