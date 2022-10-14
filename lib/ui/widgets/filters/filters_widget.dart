import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FilterState();
  }
}

class FilterState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {}, icon: const Icon(Icons.filter_alt_outlined));
  }
}
