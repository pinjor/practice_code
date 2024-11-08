import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class logo extends StatelessWidget {
  const logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
        ),
      ],
    );
  }
}
