import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

Widget customLoading() => Center(
      child: Lottie.asset(
        'assets/loading.json',
      ),
    );
