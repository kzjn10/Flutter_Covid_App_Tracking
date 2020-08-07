import 'package:flutter/material.dart';

import 'package:store_redirect/store_redirect.dart';

import 'package:corona_virus_app/common/constants/graphic_constants.dart';
import 'package:corona_virus_app/presentation/widgets/image_network_widget/image_network_widget.dart';

class PromotionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: () async {
            await openStore();
          },
          child: ImageNetworkWidget(
            imageUrl: GraphicConstants.blueZoneBanner,
            width: double.infinity,
            height: 100,
          ),
        ),
      ),
    );
  }

  Future<void> openStore() async {
    await StoreRedirect.redirect(
        androidAppId: 'com.mic.bluezone', iOSAppId: '1508062685');
  }
}
