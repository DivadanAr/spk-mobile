import 'package:flutter/material.dart';

class PageTes extends StatefulWidget {
  const PageTes({super.key});

  @override
  State<PageTes> createState() => _PageTesState();
}

class _PageTesState extends State<PageTes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Kelas'),
      ),
    );
  }
}