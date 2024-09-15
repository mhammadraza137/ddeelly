import 'package:ddeelly/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const AppOutlinedButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppColors.gradientGreenColor, AppColors.gradientBlueColor]),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
