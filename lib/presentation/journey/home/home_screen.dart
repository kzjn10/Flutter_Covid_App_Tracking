import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:corona_virus_app/common/utils/my_scroll_behavior.dart';
import 'package:corona_virus_app/presentation/theme/theme_color.dart';
import 'package:corona_virus_app/presentation/widgets/conclusion_widget/conclusion_widget.dart';
import 'package:corona_virus_app/presentation/widgets/country_info_widget/country_info_widget.dart';
import 'package:corona_virus_app/presentation/widgets/prevention_widget/prevention_widget.dart';
import 'package:corona_virus_app/presentation/widgets/promotion_widget/promotion_widget.dart';
import 'package:corona_virus_app/presentation/widgets/slider_widget/slider_widget.dart';
import 'package:corona_virus_app/presentation/widgets/summary_widget/summary_widget.dart';
import 'package:corona_virus_app/presentation/widgets/symptoms_widget/symptoms_widget.dart';
import 'package:corona_virus_app/presentation/widgets/top_country_widget/top_country_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  ValueNotifier<int> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier(DateTime.now().millisecondsSinceEpoch);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _doRefresh,
      child: AnimatedBuilder(
        animation: _valueNotifier,
        builder: (_, __) {
          return _buildContentWidget(context);
        },
      ),
    );
  }

  Widget _buildContentWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: ScrollConfiguration(
        key: UniqueKey(),
        behavior: MyScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30.w),
            child: Column(
              children: <Widget>[
                SafeArea(
                  child: SliderWidget(),
                ),
                SizedBox(height: 10.h),
                CountryInfoWidget(),
                SizedBox(height: 35.h),
                SymptomsWidget(),
                SizedBox(height: 35.h),
                PreventionWidget(),
                SizedBox(height: 35.h),
                PromotionWidget(),
                SizedBox(height: 35.h),
                SummaryWidget(),
                SizedBox(height: 35.w),
                TopCountryWidget(),
                SizedBox(height: 35.w),
                ConclusionWidget(),
                SizedBox(height: 50.w),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _doRefresh() async {
    _valueNotifier.value = DateTime.now().millisecondsSinceEpoch;
  }
}
