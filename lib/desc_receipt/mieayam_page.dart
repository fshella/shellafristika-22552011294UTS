import 'dart:convert';
import 'package:flutter_shellafristika/model/model_ayam.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class MieAyam extends StatefulWidget {
  const MieAyam({super.key});

  @override
  State<MieAyam> createState() => _MieAyamState();
}

class _MieAyamState extends State<MieAyam> {
  Future<List<ModelAyam>> ReadJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/data/resepmieayam.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => ModelAyam.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 80),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff0e1446)),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        margin: EdgeInsets.only(top: 120, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Resep Mie Ayam",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Text(
                            //   "Cara Membuat",
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 12,
                            //       fontWeight: FontWeight.bold),
                            // ),
                          ],
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      "assets/images/mie_ayam.png",
                      width: 100,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                child: FutureBuilder(
                  future: ReadJsonData(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Center(child: Text("${data.error}"));
                    } else if (data.hasData) {
                      var items = data.data as List<ModelAyam>;
                      return ListView.builder(
                          itemCount: items == Null ? 0 : items.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              margin: EdgeInsets.all(15),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  title: Text(
                                    items[index].name.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Container(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8, right: 8),
                                                  child: Text(
                                                    items[index]
                                                        .bahan
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8, right: 8),
                                                  child: Text(
                                                    items[index]
                                                        .caramembuat
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                ),
                                                // Padding(
                                                //   padding: EdgeInsets.only(
                                                //       left: 8,
                                                //       right: 8,
                                                //       top: 5),
                                                //   child: Text(
                                                //       items[index]
                                                //           .terjemahan
                                                //           .toString(),
                                                //       style: TextStyle(
                                                //         fontSize: 12,
                                                //       )),
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
