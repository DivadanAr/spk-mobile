import 'package:data_kependudukan_mobile/data/controllers/logincontroller.dart';
import 'package:data_kependudukan_mobile/ui/components/customInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: GoogleFonts.nunito(
                        fontSize: 40, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Please Sign In to Continue",
                    style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black38),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormFieldWidget(
                    controller: emailController,
                    icons: CupertinoIcons.mail,
                    placeholder: 'Enter Your Email',
                  ),
                  SizedBox(height: 7),
                  FormFieldWidget(
                    controller: passwordController,
                    icons: CupertinoIcons.lock,
                    password: true,
                    placeholder: 'Enter Your Password',
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // Mengatur posisi ke kanan
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            loginUser(
                                context, emailController.text.toString(), passwordController.text.toString());
                                
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Ink(
                            width: 100, // Atur lebar tombol
                            height: 40, // Atur tinggi tombol
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff007F61),
                                  Color.fromARGB(255, 12, 138, 109)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              constraints:
                                  BoxConstraints(minWidth: 88, minHeight: 36),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Login',
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 14,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
