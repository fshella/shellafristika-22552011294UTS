import 'package:flutter/material.dart';
import 'package:flutter_shellafristika/pages/profile.dart';
import 'package:flutter_shellafristika/pages/homepage.dart';

class EditProfil extends StatefulWidget {
  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 250, bottom: 90, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'username',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: TextField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ))),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      String username = nameController.text;
                      String password = passwordController.text;

                      if (nameController.text.isEmpty) {
                        showAlertDialogMaterial(
                            context, "Please input your name");
                      } else if (passwordController.text.isEmpty) {
                        showAlertDialogMaterial(
                            context, "Please input your password");
                      } else if (username != 'shellafristika') {
                        showAlertDialogMaterial(
                            context, 'Username Tidak Tersedia');
                      } else if (password != '12345') {
                        showAlertDialogMaterial(context, 'Password Salah');
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ))
            ],
          )),
    );
  }

  void showAlertDialogMaterial(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Info"),
          content: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                print('Clicked Yes!');
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
