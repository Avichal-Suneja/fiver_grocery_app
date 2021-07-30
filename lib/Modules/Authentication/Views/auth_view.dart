import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Modules/Authentication/Controllers/auth_controller.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return controller.signUpBool.value? showSignIn(controller) : showSignUp(controller);
  }
}

Widget showSignIn(AuthController controller){
  return Scaffold(
    // decoration: BoxDecoration(
    //   image: DecorationImage(
    //     image: Image.asset('background.jpg')
    //   )
    // ),

    body:
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'WELCOME',
            style: TextStyle(
                fontSize: 48,
                color: Color(0xff039f00),
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
          child: Text('Email', style: TextStyle(
            color: Color(0xff039f00),
              fontWeight: FontWeight.bold
          ),),
        ),
        SizedBox(height: 8),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Color(0xffe5e5e5),
              width: Get.width*0.9,
              child: TextField(
                controller: controller.emailController,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
          child: Text('Password',style: TextStyle(
            color: Color(0xff039f00),
            fontWeight: FontWeight.bold
          ),),
        ),
        SizedBox(height: 8),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Color(0xffe5e5e5),
              width: Get.width*0.9,
              child: TextField(
                obscureText: true,
                controller: controller.passwordController,
              ),
            ),
          ),
        ),
        SizedBox(height: 48),
        Center(
          child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 46,
            width: 147,
            child: ElevatedButton(
              onPressed: controller.signIn,
              style: ElevatedButton.styleFrom(
                primary: Color(0xffe5e5e5),
                shadowColor: Colors.black12,
                elevation: 5
              ),
              child: Text('Sign In', style: TextStyle(
                fontSize: 28,
                color: Color(0xff039f00)
              ),),
            ),
          ),
          ),
        ),
        SizedBox(height: 2),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('New User', style: TextStyle(
                  color: Colors.black,
                  fontSize: 16
          )),
              TextButton(onPressed: controller.showSignUp,
                child: Text('Sign Up', style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                    fontWeight: FontWeight.bold
                ))
              ),
            ],
          ),
      ],
    ),
  );
}

Widget showSignUp(AuthController controller){
  return Container();
}
