import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lastfm/service/artist.dart';
import 'package:lastfm/service/service.dart';
import 'package:lastfm/service/track.dart';

import '../service/tag.dart';
import '../widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Future<List> _topTags;
  late final Future<List<dynamic>> _topArtists;
  late final Future<List<dynamic>> _topTracks;

  static const String topTags = "chart.gettoptags";
  static const String topArtists = "chart.gettopartists";
  static const String topTracks = "chart.gettoptracks";
  static const int limit = 10;
  static const int page = 1;

  final _pageController = PageController(viewportFraction: 0.4);

  @override
  void initState() {
    super.initState();
    _topTags = ServiceApi.getTop(topTags, "tags", "tag");
    _topArtists = ServiceApi.getTop(topArtists, "artists", "artist");
    _topTracks = ServiceApi.getTop(topTracks, "tracks", "track");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<dynamic>>(
                future: _topArtists,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const Text("top artists"),
                      SizedBox(
                        height: 150,
                        child: PageView.builder(
                            controller: _pageController,
                            padEnds : false,
                            itemCount: getList(snapshot.data!).length,
                            itemBuilder: (context, i) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(flex : 1, child: ArtistWidget(name: snapshot.data![i]['name'].toString(), playcount: snapshot.data![i]['playcount'].toString(),
                                      listeners: snapshot.data![i]['listeners'].toString(), mbid: snapshot.data![i]['mbid'].toString(),
                                      url: snapshot.data![i]['url'].toString(), streamable: snapshot.data![i]['streamable'].toString(),
                                      image: snapshot.data![i]['image'][1]['#text'].toString())
                                  ),],
                              );
                            }),
                      ),
                    ]);
                  } else {
                    return Column();
                  }
                }),
            FutureBuilder<List<dynamic>>(
                future: _topTracks,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const Text("top tracks"),
                        SizedBox(height: 100, child:
                        PageView.builder(
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            itemCount: getList(snapshot.data!).length,
                            itemBuilder: (context, i) {
                              return Row(
                                children: [
                                ],
                              );
                            }),
                        ),],
                    );
                  } else {
                    return Column();
                  }
                }),
            FutureBuilder<List<dynamic>>(
                future: _topTags,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("top tags"),
                          CarouselSlider.builder(
                              itemCount: getList(snapshot.data!).length,
                              itemBuilder: (context, i, viewIndex) => TagWidget(
                                      name: snapshot.data![i]['name'],
                                      url: snapshot.data![i]['url'],
                                      reach: snapshot.data![i]['reach'],
                                      taggings: snapshot.data![i]['taggings'],
                                      streamable: snapshot.data![i]
                                          ['streamable'])
                                  .showTag(),
                              options: CarouselOptions(
                                initialPage: 2,
                                aspectRatio: 2.0,
                                enableInfiniteScroll: false,
                                viewportFraction: 0.30,
                                disableCenter: true,
                                enlargeCenterPage: false,
                              )),
                        ]);
                  } else {
                    return Column();
                  }
                }),
          ],
        ),
      ),
      persistentFooterButtons: const [
        FooterWidget(),
      ],
    );
  }
}

List getList(List<dynamic> list) {
  List liste = list;
  return liste;
}
