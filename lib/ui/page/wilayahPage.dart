import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WilayahPage extends StatefulWidget {
  const WilayahPage({super.key});

  @override
  State<WilayahPage> createState() => _WilayahPageState();
}

class _WilayahPageState extends State<WilayahPage> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))

    ..loadRequest(Uri.parse('https://disdukcapil.depok.go.id/Home/dashboard'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new)),
                    Text(
                      "Wilayah",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                          fontSize: 18, fontWeight: FontWeight.w600, height: 1),
                    ),
                  ],
                ),
              ),
              Expanded(child: WebViewWidget(controller: controller))
            ],
          ),
        ),
      ),
    );
  }
}
