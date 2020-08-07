import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:corona_virus_app/common/internationalization.dart';
import 'package:corona_virus_app/presentation/theme/theme_color.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;
  final double maxFontSize;
  final double titleFontSize;

  InfoWidget({
    this.title,
    this.value,
    this.valueColor,
    this.maxFontSize = 30.0,
    this.titleFontSize = 18,
  });

  InfoWidget.extend({
    this.title,
    this.value,
    this.valueColor,
    this.maxFontSize = 24.0,
    this.titleFontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    final i18n = S.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AutoSizeText(
            value,
            style: Theme.of(context).textTheme.headline1.copyWith(
                  color: valueColor ?? AppColor.black80,
                  fontWeight: FontWeight.bold,
                ),
            maxLines: 1,
            minFontSize: 10,
            maxFontSize: maxFontSize,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            i18n.translate(title),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(fontSize: titleFontSize, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
