import 'package:flutter/material.dart';
import 'pagelist.dart';
import 'providers.dart';

class SlideProgression extends StatefulWidget {
  const SlideProgression({super.key});

  @override
  State<SlideProgression> createState() => _SlideProgressionState();
}

class _SlideProgressionState extends State<SlideProgression> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...pageList.values.map(
          (e) => Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              transformAlignment: Alignment.bottomCenter,
              duration: Duration(milliseconds: 1200),
              height: (indexProvider.value > e.index &&
                      lastIndexProvider.value == 0)
                  ? MediaQuery.of(context).size.height
                  : 0,
              curve: Curves.fastOutSlowIn,
              color: e.slide!.color,
            ),
          ),
        )
      ],
    );
  }
}
