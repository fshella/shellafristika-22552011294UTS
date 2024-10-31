import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String name;

  Profile({required this.name});
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent),
              height: double.infinity,
              width: double.infinity,
            ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage('https://tse4.mm.bing.net/th?id=OIP.8sONUk_E5Au7IEmVnrORdgHaEr&pid=Api&P=0&h=180'
              ),
            ),
            SizedBox(height: 20),
            Center(
                child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
            )),
          ],
        ),
        ]
      ),
    );
  }
}
