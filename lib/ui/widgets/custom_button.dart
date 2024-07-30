import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final IconData? icon;
  final void Function()? onPressed;

  const CustomButton(
      {super.key, required this.buttonText, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color(0xffF97316),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 95.0, right: 100.0),
        child: Row(
          children: [
            Icon(icon),
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
      ),
    );
  }
}
