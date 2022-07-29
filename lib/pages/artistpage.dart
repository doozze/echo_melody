import 'package:flutter/material.dart';

import '../widgets/footer.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({Key? key}) : super(key: key);


  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)?.settings.arguments.toString());
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text(arguments['mbid'].toString()),
      ),
      persistentFooterButtons: const [
        FooterWidget(),
      ],
    );
  }
}
