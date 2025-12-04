import 'package:flutter/material.dart';

class BottomComponent extends StatelessWidget {
  final void Function()? onTap;
  final Color color;
  final Widget widget;
  const BottomComponent({
    super.key,
    required this.color,
    required this.onTap,
   required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget
      ),
    );
  }
}
