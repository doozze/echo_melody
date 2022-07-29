import 'package:flutter/material.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton(onPressed: () {
          Navigator.pushNamed(context, '/');
        }, child: const Text("Home")),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, '/search');
        }, child: const Text("Search")),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, '/');
        }, child: const Text("Tops")),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, '/');
        }, child: const Text("Profile")),
      ],
    );
  }
}

