import 'package:flutter/material.dart';

class TrackWidget extends StatefulWidget {
  const TrackWidget({Key? key, required this.name, required this.duration, required this.url, required this.playcount, required this.listeners, required this.mbid, required this.imageSmall, required this.imageMedium, required this.imageLarge, required this.streamable}) : super(key: key);

  final String name;
  final String duration;
  final String url;
  final int playcount;
  final int listeners;
  final String mbid;
  final String imageSmall;
  final String imageMedium;
  final String imageLarge;
  final String streamable;

  @override
  State<TrackWidget> createState() => _TrackWidgetState();

}

class _TrackWidgetState extends State<TrackWidget> {

  late Track _track;

  @override
  void initState() {
    super.initState();
    _track = Track(widget.name, widget.duration, widget.url, widget.playcount, widget.listeners,
        widget.mbid, widget.imageSmall, widget.imageMedium, widget.imageLarge,
        widget.streamable);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_track.name),
        Image.network(_track.imageSmall),
        IconButton(onPressed: () {
          Navigator.pushNamed(context, '/track', arguments: { "mbid" : _track.mbid});
        }, icon: const Icon(Icons.person, size: 24,))
      ],
    );
  }
}

class Track {
  final String name;
  final String duration;
  final String url;
  final int playcount;
  final int listeners;
  final String mbid;
  final String imageSmall;
  final String imageMedium;
  final String imageLarge;
  final String streamable;

  Track(
      this.name,
      this.duration,
      this.url,
      this.playcount,
      this.listeners,
      this.mbid,
      this.imageSmall,
      this.imageMedium,
      this.imageLarge,
      this.streamable);
}


class TrackService{

  Widget showTrack() {
    return Container();
  }
}