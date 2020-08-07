import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:corona_virus_app/presentation/theme/theme_color.dart';
import 'package:corona_virus_app/presentation/widgets/image_network_widget/image_network_widget.dart';
import 'package:corona_virus_app/presentation/widgets/slider_widget/slider_constants.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  ValueNotifier<int> _sliderIndexValueNotifier;

  @override
  void initState() {
    super.initState();
    _sliderIndexValueNotifier = ValueNotifier(0);
  }

  @override
  void dispose() {
    _sliderIndexValueNotifier?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _builderSliderWidget(sliderData);
  }

  Widget _builderSliderWidget(List<String> data) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            items: _buildSliderItems(data),
            options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                enlargeCenterPage: false,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  _sliderIndexValueNotifier.value = index;
                }),
          ),
          AnimatedBuilder(
            animation: _sliderIndexValueNotifier,
            builder: (_, __) {
              return _buildIndicatorWidget(data);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIndicatorWidget(List<String> data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: data.map((item) {
        final index = data.indexOf(item);
        return Container(
          width: 6.0,
          height: 6.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _sliderIndexValueNotifier.value == index
                ? AppColor.primaryColor
                : Colors.black12,
          ),
        );
      }).toList(),
    );
  }

  List<Widget> _buildSliderItems(List<String> data) {
    return data
        .map(
          (item) => Container(
            margin: SliderConstants.sliderMargin,
            child: ClipRRect(
              borderRadius: SliderConstants.sliderItemCorner,
              child: ImageNetworkWidget(
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: item,
                hasDefaultErrorBg: true,
              ),
            ),
          ),
        )
        .toList();
  }
}
