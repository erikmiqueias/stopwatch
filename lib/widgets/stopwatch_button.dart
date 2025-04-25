import 'package:flutter/material.dart';

class StopwatchButton extends StatelessWidget {
  const StopwatchButton({
    super.key,
    required this.icon,
    this.isStop,
    required this.onPressed,
  });

  final bool? isStop;
  final Icon icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: RawMaterialButton(
        onPressed: onPressed,
        shape: const StadiumBorder(),
        fillColor: Colors.white,
        elevation: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [icon],
        ),
      ),
    );
  }
}
