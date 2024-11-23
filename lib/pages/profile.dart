import 'package:flutter/material.dart';
import 'package:flutter_shellafristika/pages/homepage.dart';
import 'package:flutter_shellafristika/pages/favorites_page.dart';

class Profile extends StatefulWidget {
  final String username;

  Profile({Key? Key, required this.username}) : super(key: Key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(color: const Color.fromARGB(255, 47, 159, 250)),
          height: double.infinity,
          width: double.infinity,
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
              CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage(
                    'https://tse4.mm.bing.net/th?id=OIP.8sONUk_E5Au7IEmVnrORdgHaEr&pid=Api&P=0&h=180'),
              ),
              SizedBox(height: 20),
              Center(
                  child: Text(
                widget.username,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              )),
              SizedBox(height: 20),
              Container(
                height: 2, // Tinggi garis
                color: Colors.white, // Warna garis
                margin: EdgeInsets.symmetric(horizontal: 20), // Margin horizontal
              ),
            ],
          ),
        )
      ]),
    );
  }
}
