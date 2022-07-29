import 'package:flutter/material.dart';
import 'package:lastfm/service/service.dart';
import 'package:lastfm/widgets/footer.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late final Future<Map<String, dynamic>> _albumresults;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> defaultParams = {
      "method" : "album.search",
      "album" : " ",
      "limit" : "16",
      "page" : "1"
    };
      _albumresults = ServiceApi.search(defaultParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0x00000000),
      body: Container(),
      persistentFooterButtons: const [
        FooterWidget(),
      ],
    );
  }
}
