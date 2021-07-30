import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Modules/Authentication/Controllers/auth_controller.dart';
class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return true? showSignIn() : showSignUp();
  }
}

Widget showSignIn(){
  return Container(
    width: 360,
    height: 640,
    color: Color(0xfff6f6f6),
    child: Stack(
      children:[
        Positioned.fill(
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 671,
              height: 985,
              child: Stack(
                children:[Positioned(
                  left: 207,
                  top: 335,
                  child: Transform.rotate(
                    angle: -3.14,
                    child: Container(
                      width: 284,
                      height: 259,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff1cf909), Color(0xff3df90a), Color(0xfffaff0d)], ),
                      ),
                    ),
                  ),
                ),
                  Positioned(
                    left: 134,
                    top: 0,
                    child: Container(
                      width: 284,
                      height: 259,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff59fa39), Color(0xff6afa39), Color(0xfff6fa38)], ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 70,
                    top: 405,
                    child: Transform.rotate(
                      angle: -3.14,
                      child: Container(
                        width: 284,
                        height: 259,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff55ff3a), Color(0xff58f939), Color(0xfdfef63a)], ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 76,
                    child: Container(
                      width: 284,
                      height: 259,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff45ff41), Color(0xff58ff41), Color(0xfffbff41)], ),
                      ),
                    ),
                  ),],
              ),
            ),
          ),
        ),
        Positioned(
          left: 80,
          top: 164,
          child: SizedBox(
            width: 199,
            height: 40,
            child: Text(
              "WELCOME",
              style: TextStyle(
                color: Color(0xb7039f00),
                fontSize: 48,
              ),
            ),
          ),
        ),
        Positioned(
          left: 106,
          top: 408,
          child: Container(
            width: 147,
            height: 46,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  width: 147,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Color(0x96e5e5e5),
                  ),
                  padding: const EdgeInsets.only(left: 34, right: 31, ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      SizedBox(
                        width: 82,
                        height: 32,
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Color(0xb7039f00),
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 22,
          top: 275,
          child: Container(
            width: 316,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0x6be5e5e5),
            ),
          ),
        ),
        Positioned(
          left: 22,
          top: 333,
          child: Container(
            width: 316,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0x6be5e5e5),
            ),
          ),
        ),
        Positioned(
          left: 28,
          top: 256,
          child: SizedBox(
            width: 74,
            height: 15,
            child: Text(
              "Email",
              style: TextStyle(
                color: Color(0xb21bc300),
                fontSize: 12,
                fontFamily: "Work Sans",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Positioned(
          left: 28,
          top: 315,
          child: SizedBox(
            width: 74,
            height: 15,
            child: Text(
              "Password",
              style: TextStyle(
                color: Color(0xb21bc300),
                fontSize: 12,
                fontFamily: "Work Sans",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Positioned(
          left: 112,
          top: 469,
          child: SizedBox(
            width: 138,
            height: 20,
            child: Text(
              "New User Sign-Up",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget showSignUp(){
  return Scaffold();
}
