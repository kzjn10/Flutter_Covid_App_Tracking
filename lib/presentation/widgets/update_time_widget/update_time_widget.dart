import 'package:flutter/material.dart';

import 'package:corona_virus_app/presentation/theme/theme_color.dart';

class UpdateTimeWidget extends StatelessWidget {
  final String updatedTime;

  UpdateTimeWidget({this.updatedTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        updatedTime,
        style: Theme.of(context).textTheme.headline1.copyWith(
              fontSize: 14,
              color: AppColor.atlantis,
            ),
      ),
    );
  }
}
