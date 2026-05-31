import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: colorScheme.secondary,
                  child: Icon(Icons.person),
                ),
                Positioned(
                  bottom: 6,
                  right: 24,
                  child: CircleAvatar(
                    backgroundColor: colorScheme.outlineVariant,
                    child: Icon(Icons.camera_alt),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
