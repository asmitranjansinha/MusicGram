import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final _audioQuery = OnAudioQuery();
  final AudioPlayer _audioPlayer = AudioPlayer();

  playSong(String? uri) {
    try {
      _audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(uri!))
      );
      _audioPlayer.play();
    } on Exception {
      log("Error playing song");
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    requestPermision();
  }

  void requestPermision(){
    Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff343434),
            Color(0xff000000),
        ])
      ),
      child: Scaffold(
        backgroundColor: const Color(0x00075fb0),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Your Songs', style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: FutureBuilder<List<SongModel>>(
          future: _audioQuery.querySongs(
            sortType: null,
            orderType: OrderType.ASC_OR_SMALLER,
            uriType: UriType.EXTERNAL,
            ignoreCase: true
          ),
          builder:(context, item) {
            if(item.data == null){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(item.data!.isEmpty){
              return const Center (child: Text("No Songs Found", style: TextStyle(color: Colors.white)));
            }
            return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.music_note, color: Colors.white,),
              title: Text(item.data![index].displayNameWOExt, style: const TextStyle(color: Colors.white)),
              subtitle: Text("${item.data![index].artist}", style: const TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.more_horiz, color: Colors.white,),
              onTap: () {
                playSong(item.data![index].uri);
              },
            ),
            itemCount: item.data!.length
            );
          },
        ) 
      ),
    );
  }
}
