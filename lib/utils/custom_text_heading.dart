import 'package:flutter/material.dart';
import 'package:lms/utils/app_consts.dart';

class TypographyWhite16 extends StatelessWidget {
  final String text;

  const TypographyWhite16({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white));
  }
}

class TypographyTitle16 extends StatelessWidget {
  final String text;

  const TypographyTitle16({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.title));
  }
}

class TypographyHeading extends StatelessWidget {
  final String text;

  const TypographyHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 45, fontWeight: FontWeight.w700, color: AppColors.title));
  }
}
