import 'package:flutter/material.dart';
import 'package:h3m_shimmer_card/h3m_shimmer_card.dart';

Widget shimmerwidget({double? height, double? width, double? radius}) =>
    ShimmerCard(
      height: height ?? 100,
      width: width,
      beginAlignment: Alignment.topLeft,
      endAlignment: Alignment.bottomRight,
      borderRadius: radius ?? 10,
      backgroundColor: Color.fromARGB(95, 218, 232, 244),
      shimmerColor: Color.fromARGB(95, 156, 176, 194),
    );
