import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Food ',
          style: TextStyle(
            // Checking the theme and changing the color accordingly
            color:  Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          'Recipe',
          style: TextStyle(
            color: Colors.orange[900],
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
