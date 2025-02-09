import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTab,
    this.isLoading = false,
  });
  final String title;
  final GestureTapCallback onTab;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: 350,
        height: 73,
        decoration: ShapeDecoration(
          color: const Color(0xff34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Styles.style22,
                ),
        ),
      ),
    );
  }
}
