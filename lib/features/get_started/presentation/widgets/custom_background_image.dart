import 'package:flutter/material.dart';

class CustomBackgroundImage extends StatelessWidget {
  final String imagePath;
  final int currentIndex;

  const CustomBackgroundImage({
    super.key,
    required this.imagePath,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient:
                currentIndex == 0
                    ? LinearGradient(
                      begin: const Alignment(0.09, -1.00),
                      end: const Alignment(-0.09, 1),
                      colors: [
                        const Color(0xE5304563),
                        const Color(0xE54A628A),
                        Colors.black.withValues(alpha: 0.02),
                      ],
                    )
                    : LinearGradient(
                      begin: const Alignment(0.18, -0.98),
                      end: const Alignment(-0.18, 0.98),
                      colors: [
                        const Color(0xE5304563),
                        Colors.black.withValues(alpha: 0),
                      ],
                    ),
          ),
        ),
      ],
    );
  }
}
