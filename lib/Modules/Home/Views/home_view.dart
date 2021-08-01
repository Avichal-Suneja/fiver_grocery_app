// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:grocery_app/Modules/Home/Controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Utils/icons.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 0, 0, 0),
                child: Icon(MyFlutterApp.location, size: 32,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                child: Text('New Delhi, India', style: TextStyle(
                  fontSize: 20,
                ),),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 0, 0, 0),
                child: Text(
                    'Find Fresh ', style: TextStyle(
                  color: Color(0xff1bc300),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              Text('Groceries', style: TextStyle(
                color: Color(0xfffee500),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),)
            ],
          ),
          SizedBox(height: 24),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Color(0xffe5e5e5),
                width: Get.width * 0.9,
                height: Get.height * 0.07,
                child: TextFormField(
                  decoration: InputDecoration(

                    prefixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                      child: Icon(Icons.search, color: Color(0xff1bc300),),
                    ),
                    border: InputBorder.none,
                    hintText: 'SEARCH GROCERIES...',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.22), letterSpacing: 1),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.green, width: 3.0)),
                  ),

                ),
              ),
            ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0,0,0,0),
            child: Text('Categories', style: TextStyle(fontSize: 20),),
          ),
          ListView.builder(
              itemCount: 1,
              itemBuilder:(context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(MyFlutterApp.broccoli),
                    title: Text('Veggies'),
                  ),
                );
              },
          ),
        ],
      )
      // Center(
      //   child: IconButton(
      //     icon: Icon(Icons.logout),
      //     onPressed:() async {
      //       await controller.logOut();
      //     },
      //   ),
      // ),
    );
  }
}
