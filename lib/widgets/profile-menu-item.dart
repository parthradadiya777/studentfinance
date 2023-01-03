import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final VoidCallback? onPressed;
  final bool showEndIcon;
  final Icon endIcon;
  final Widget? endWidget;

  const ProfileMenuItem(
      {Key? key,
      required this.title,
      this.subTitle,
      this.showEndIcon = true,
        this.endIcon = const Icon(Icons.arrow_right_sharp, color: Colors.white,),
        this.endWidget,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  if (subTitle != null)
                    Text(
                      subTitle!,
                      style: const TextStyle(fontSize: 12),
                    )
                ],
              ),
              if (showEndIcon)
                endIcon,
              if (endWidget != null)
                endWidget!
            ],
          )),
    );
  }
}
