import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton('g'), // Placeholder for Google
        const SizedBox(width: 20),
        _buildSocialButton('f'), // Placeholder for Facebook
        const SizedBox(width: 20),
        _buildSocialButton('t'), // Placeholder for Twitter
      ],
    );
  }

  Widget _buildSocialButton(String type) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey.shade200,
      child: Text(
        type,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      // In a real app, you'd use an Image.asset() or an SVG here
      // e.g., child: Image.asset('assets/google_icon.png'),
    );
  }
}