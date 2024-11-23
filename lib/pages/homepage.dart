import 'package:flutter/material.dart';
import 'package:flutter_shellafristika/desc_receipt/miegoreng_page.dart';
import 'package:flutter_shellafristika/desc_receipt/miegacoan_page.dart';
import 'package:flutter_shellafristika/desc_receipt/mieayam_page.dart';
import 'package:flutter_shellafristika/pages/edit_profil.dart';
import 'favorites_page.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextStyle itemTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    FavoritesPage(),
    Profile(
      username: 'Shella Fristika', //email: 'frezyy@gmail.com', phoneNumber: '0858******9', password: '12345',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 159, 250),
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final TextStyle itemTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("ResepQu"),
      centerTitle: true, 
    ),
    body: Container(
      color: const Color.fromARGB(255, 78, 175, 255),
      child: Column(
        children: <Widget>[
          
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                buildFoodItem(
                  image: AssetImage("assets/images/mieayam.png"),
                  title: "Mie Ayam",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MieAyam()));
                  },
                ),
                buildFoodItem(
                  image: AssetImage("assets/images/gacoan.png"),
                  title: "Mie Gacoan",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MieGacoan()));
                  },
                ),
                buildFoodItem(
                  image: AssetImage("assets/images/miegoreng.png"),
                  title: "Mie Goreng",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MieGoreng()));
                  },
                ),
                buildFoodItem(
                  image: NetworkImage(
                      'https://image.freepik.com/free-vector/nasi-goreng-fried-rice_307665-24.jpg'),
                  title: "Nasi Goreng",
                  onTap: () {},
                ),
                buildFoodItem(
                  image: NetworkImage(
                      'https://tse4.mm.bing.net/th?id=OIP.0MnxqtEN3fqZymaPkbtv9QHaHO&pid=Api&P=0&h=180'),
                  title: "Rendang",
                  onTap: () {},
                ),
                buildFoodItem(
                  image: NetworkImage(
                      'https://thegorbalsla.com/wp-content/uploads/2019/03/Resep-Ayam-Rica-Rica-Cabe-Rawit-700x528.jpg'),
                  title: "Ayam Rica-Rica",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildFoodItem(
    {required ImageProvider image,
    required String title,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Image(
            image: image,
            height: 100,
            width: 100,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(title, style: itemTextStyle,)
          ),
        ],
      ),
    ),
  );
}}
