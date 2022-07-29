import 'package:flutter/material.dart';

class Artist {
  final String name;
  final String playcount;
  final String listeners;
  final String mbid;
  final String url;
  final String streamable;
  final String image; // imageSmall, image large

  Artist(this.name, this.playcount, this.listeners, this.mbid, this.url,
      this.streamable, this.image);
}

class ArtistWidget extends StatefulWidget {
  const ArtistWidget({Key? key, required this.name, required this.playcount,
    required this.listeners, required this.mbid, required this.url,
    required this.streamable, required this.image}) : super(key: key);

  final String name;
  final String playcount;
  final String listeners;
  final String mbid;
  final String url;
  final String streamable;
  final String image;

  @override
  State<ArtistWidget> createState() => _ArtistWidgetState();
}

class _ArtistWidgetState extends State<ArtistWidget> {

  late Artist _artist;


  @override
  void initState() {
    super.initState();
    _artist = Artist(widget.name, widget.playcount, widget.listeners, widget.mbid, widget.url, widget.streamable, widget.image);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_artist.name),
        Image.network(_artist.image),
        IconButton(onPressed: () {
          Navigator.pushNamed(context, '/artist', arguments: { "mbid" : _artist.mbid});
        }, icon: const Icon(Icons.person, size: 24,))
      ],
    );
  }
}
