import 'package:flutter/material.dart';

import 'colors.dart';


class ChipButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  const ChipButton({
    Key? key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        backgroundColor: SmartyColors.primary,
        onPressed: onPressed ?? () {},
        child: child,
      ),
    );
  }
}
