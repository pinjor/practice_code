import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/styles.dart';

class backGround_image extends StatelessWidget {
  const backGround_image({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background_picture(context),
      ],
    );
  }
}
