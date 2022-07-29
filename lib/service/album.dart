import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lastfm/service/imagesized.dart';

class AlbumInfo {
  final String name;
  final String artist;
  final String imageSmall;
  final String imageMedium;
  final String imageLarge;
  final String url;
  final String streamable;
  final String mbid;

  AlbumInfo(this.name, this.artist, this.imageSmall, this.imageMedium,
      this.imageLarge, this.url, this.streamable, this.mbid);
}

class AlbumWidget extends StatefulWidget {
  const AlbumWidget({Key? key}) : super(key: key);

  @override
  State<AlbumWidget> createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

