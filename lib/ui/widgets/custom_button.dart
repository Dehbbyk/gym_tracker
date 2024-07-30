import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final IconData? icon;
  final void Function()? onPressed;
  final double? height;

  const CustomButton(
      {super.key,
      required this.buttonText,
      this.icon,
      this.onPressed,
      this.height});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: kcPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon),
          Text(
            buttonText,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xffFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}
