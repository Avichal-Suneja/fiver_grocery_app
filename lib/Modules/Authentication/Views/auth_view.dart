import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Modules/Authentication/Controllers/auth_controller.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Obx(() => controller.signUpBool.value
        ? showSignIn(controller)
        : showSignUp(controller));
  }
}

Widget showSignIn(AuthController controller) {
  final _formKey = GlobalKey<FormState>();
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 48,
                  color: Color(0xff039f00),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PTSans',
                  letterSpacing: 1.5,
                ),
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
              child: Text(
                'Email',
                style: TextStyle(
                  color: Color(0xff039f00),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'PTSans',
                ),
              ),
            ),
            SizedBox(height: 4),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Color(0xffe5e5e5),
                  width: Get.width * 0.9,
                  height: Get.height * 0.07,
                  child: TextFormField(
                    validator: (text) => text!.isEmpty? 'Email cannot be empty' : null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 3.0)),
                    ),
                    controller: controller.emailController,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
              child: Text(
                'Password',
                style: TextStyle(
                  color: Color(0xff039f00),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'PTSans',
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Color(0xffe5e5e5),
                  width: Get.width * 0.9,
                  height: Get.height * 0.07,
                  child: TextFormField(
                    validator: (text) => text!.length<6? 'Password Should be at least 6 characters' : null,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 3.0)),
                    ),
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
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        await controller.signIn();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffe5e5e5),
                        shadowColor: Colors.black12,
                        elevation: 5),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(0xff039f00),
                        fontFamily: 'PTSans',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New User',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'PTSans',
                    )),
                TextButton(
                  child: Text('Sign Up',
                      style: TextStyle(
                        color: Color(0xff039f00),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PTSans',
                      )),
                  onPressed: controller.showSignUp,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget showSignUp(AuthController controller) {
  final _formKey = GlobalKey<FormState>();
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
      child: Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 48,
                    color: Color(0xff039f00),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PTSans',
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
                child: Text(
                  'Name',
                  style: TextStyle(
                    color: Color(0xff039f00),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'PTSans',
                  ),
                ),
              ),
              SizedBox(height: 4),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Color(0xffe5e5e5),
                    width: Get.width * 0.9,
                    child: TextFormField(
                      validator: (text) => text!.length<3? 'Name should be at least 3 characters' : null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 3.0)),
                      ),
                      controller: controller.nameController,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                    color: Color(0xff039f00),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'PTSans',
                  ),
                ),
              ),
              SizedBox(height: 4),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Color(0xffe5e5e5),
                    width: Get.width * 0.9,
                    child: TextFormField(
                      validator: (text) => text!.length!=10? 'Phone Number should be 10 characters' : null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 3.0)),
                      ),
                      controller: controller.phoneController,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Color(0xff039f00),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'PTSans',
                  ),
                ),
              ),
              SizedBox(height: 4),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Color(0xffe5e5e5),
                    width: Get.width * 0.9,
                    child: TextFormField(
                      validator: (text) => text!.isEmpty? 'Email cannot be empty' : null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 3.0)),
                      ),
                      controller: controller.emailController,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Color(0xff039f00),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'PTSans',
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Color(0xffe5e5e5),
                    width: Get.width * 0.9,
                    child: TextFormField(
                      validator: (text) => text!.length<6? 'Password Should be at least 6 characters' : null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 3.0)),
                      ),
                      obscureText: true,
                      controller: controller.passwordController,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 46,
                    width: 147,
                    child: ElevatedButton(
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          await controller.signUp();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffe5e5e5),
                          shadowColor: Colors.black12,
                          elevation: 5),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 28,
                          color: Color(0xff039f00),
                          fontFamily: 'PTSans',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have an account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'PTSans',
                      )),
                  TextButton(
                    child: Text('Sign In',
                        style: TextStyle(
                          color: Color(0xff039f00),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PTSans',
                        )),
                    onPressed: controller.showSignUp,
                  ),
                ],
              ),
            ]),
      ),
    ),
  );
}
