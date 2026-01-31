import 'package:flutter/material.dart';

class ChatBotInputButton extends StatelessWidget {
  const ChatBotInputButton({
    super.key,
    required this.color,
    required this.onTap,
    required this.child,
  });

  final Color color;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(radius: 18, backgroundColor: color, child: child),
    );
  }
}
