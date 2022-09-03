import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:null_app/utils/routes.dart';
import 'package:null_app/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  final String name_app = "Music Gram";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00075fb0),
      appBar: AppBar(
        backgroundColor: const Color(0x00075fb0),
        title: Text(
          name_app,
          textAlign: TextAlign.start,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite),
                  color: Colors.pink,
                  iconSize: 35,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  color: Colors.white,
                  iconSize: 35,
                  onPressed: () {},
                )
              ],
            ),
          ),
          Column(
            children: [
              const Text(
                "RECENTS",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Material(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    child: Container(
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        "Playlist1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    child: Container(
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        "Playlist2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 12,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Material(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    child: Container(
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        "Artist abc",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    child: Container(
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        "Artist bcd",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 12,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Material(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    child: Container(
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        "Playlist3",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    child: Container(
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        "Playlist4",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          )
        ],
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.black,
          color: Colors.teal.shade600,
          animationDuration: const Duration(milliseconds: 400),
          items: [
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.homeRoute);
              },
            ),
            IconButton(
              icon: const Icon(Icons.library_music_outlined),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.libraryRoute);
              },
            ),
            IconButton(
              icon: const Icon(Icons.chat),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.chatRoute);
              },
            ),
          ]),
    );
  }
}
