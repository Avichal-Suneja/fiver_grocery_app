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
  return Container(
    width: Get.width,
    height: Get.height,

    /*decoration: BoxDecoration(
      image: DecorationImage(
        image: Image.asset('')
      )
    ),*/

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'WELCOME',
          style: TextStyle(
              fontSize: 24,
              color: Colors.green
          ),
        ),
        SizedBox(height: 32),
        Text('email'),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.grey[200],
            width: Get.width*0.8,
            child: TextField(
              controller: controller.emailController,
            ),
          ),
        ),

        Text('password'),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.grey[200],
            width: Get.width*0.8,
            child: TextField(
              obscureText: true,
              controller: controller.passwordController,
            ),
          ),
        ),
        SizedBox(height: 32),
        SizedBox(
          height: 100,
          width: 400,
          child: ElevatedButton(
            onPressed: controller.signIn,
            child: Text('Sign In'),
          ),
        ),
        SizedBox(height: 24),
        TextButton(
          child: Row(
            children: [
              Text('New User '),
              Text('Sign Up', style: TextStyle(
                color: Colors.green
              ))
            ],
          ),
          onPressed: controller.showSignUp,
        )
      ],
    ),
  );
}

Widget showSignUp(AuthController controller){
  return Container();
}
