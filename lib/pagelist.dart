import 'package:flutter/material.dart';

enum pageList {
  pageList1(slide: Slide(color: Colors.red, index: 1)),
  pageList2(slide: Slide(color: Colors.blue, index: 2)),
  pageList3(slide: Slide(color: Colors.yellow, index: 3)),
  pageList4(slide: Slide(color: Colors.pink, index: 4)),
  pageList5(slide: Slide(color: Colors.green, index: 5));

  final Slide? slide;

  const pageList({required this.slide});
}

class Slide extends StatelessWidget {
  final index;
  final Color color;
  const Slide({required this.index, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      color: color,
    );
  }
}
