import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
    ]);
  }
}
