import 'package:flutter/material.dart';

import '../../widgets/chat-bubble.dart';

class ActionDetail extends StatelessWidget {
  final String image;
  final Color backgroundColor;
  final String title;
  final String description;

  const ActionDetail(
      {Key? key,
      required this.backgroundColor,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(
        radius: 35,
        backgroundColor: backgroundColor,
        child: Image(image: AssetImage(image)),
      ),
      const SizedBox(
        width: 16,
      ),
      Flexible(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
            ),
            maxLines: 2,
          ),
        ],
      ))
    ]);
  }
}

class DashboardActions extends StatelessWidget {
  const DashboardActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        ChatBubble(
            color: Color.fromRGBO(6, 72, 122, 1),
            child: ActionDetail(
              image: 'assets/budget.png',
              backgroundColor: Color.fromRGBO(26, 31, 87, 1),
              title: 'Let\'s Budget',
              description:
                  'Start saving money by creating budgets & we will help you stick to it.',
            )),
        ChatBubble(
            color: Color.fromRGBO(87, 37, 187, 1),
            child: ActionDetail(
              image: 'assets/calendar-blank.png',
              backgroundColor: Color.fromRGBO(8, 170, 103, 0.85),
              title: 'Plan all your events ahead',
              description: 'We found some bills. Check if we got them right.',
            )),
        ChatBubble(
            color: Color.fromRGBO(232, 156, 69, 1),
            child: ActionDetail(
              image: 'assets/resolution.png',
              backgroundColor: Color.fromRGBO(40, 25, 96, 1),
              title: 'Create a smart Resolution',
              description:
                  'Start your smart resolution today & we will make it a habit for you.',
            )),
        ChatBubble(
            color: Color.fromRGBO(163, 49, 96, 1),
            child: ActionDetail(
              image: 'assets/text-underline.png',
              backgroundColor: Color.fromRGBO(0, 189, 214, 0.85),
              title: 'Reveal My Finance Score',
              description:
                  'Start saving money by creating budgets & we will help you stick to it.',
            )),
        ChatBubble(
            color: Color.fromRGBO(154, 154, 240, 1),
            child: ActionDetail(
              image: 'assets/game-controller.png',
              backgroundColor: Color.fromRGBO(12, 12, 82, 0.85),
              title: 'Game to take responses',
              description:
                  'Little effort, big reward! Earn more energy when you play game 3 days in a row.',
            )),
      ],
    );
  }
}
