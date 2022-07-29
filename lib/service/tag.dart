import 'package:flutter/material.dart';

class TagWidget extends StatefulWidget {
  const TagWidget({Key? key, required this.name, required this.url, required this.reach, required this.taggings, required this.streamable}) : super(key: key);

  final String name;
  final String url;
  final String reach;
  final String taggings;
  final String streamable;

  @override
  State<TagWidget> createState() => _TagWidgetState();

  Widget showTag() {
    return Column(
      children: [
        Text(name),
        TextButton(onPressed: () {}, child: Text(reach))
      ],
    );
  }
}

class _TagWidgetState extends State<TagWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class Tag {
  String name;
  String url;
  String reach;
  String taggins;
  String streamable;

  Tag(this.name, this.url, this.reach, this.taggins, this.streamable);

  Widget showTag() {
    return Card(
      child: TextButton(
        onPressed: (
            ) {},
        child: Text(name),
      )
    );
  }

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      json['name'].toString(),
      json['url'].toString(),
      json['reach'].toString(),
      json[''].toString(),
      json['streamable'].toString(),
    );
  }
}