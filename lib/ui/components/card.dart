import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final asset;
  final label;
  final VoidCallback onTap;
  const CustomCard({super.key, this.asset, this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.1),
            offset: Offset(0, 2),
            blurRadius: 15,
            spreadRadius: 0,
          ),
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              asset,
              width: 60,
              height: 60,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                    fontSize: 14, fontWeight: FontWeight.w700, height: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
