import 'package:flutter/material.dart';

class Arguments{
  final String routeName;
  final String mbid;

  Arguments(this.routeName, this.mbid);
}

class ExtractArgument extends StatelessWidget {
  const ExtractArgument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Arguments;

    return Container();
  }
}
