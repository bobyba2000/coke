import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/constants/others.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/career/model.dart';
import 'package:coke_platform/model/firebase/contestant/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverviewWidget extends StatefulWidget {
  final List<ContestantModel> contestants;
  const OverviewWidget({
    super.key,
    required this.contestants,
  });

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  @override
  Widget build(BuildContext context) {
    final contestants = widget.contestants;
    final procurement = contestants
        .where((element) =>
            element.careerInfo.desiredPathway.role ==
            InternshipRole.procurement)
        .length;
    final tradeMKT = contestants
        .where((element) =>
            element.careerInfo.desiredPathway.role ==
            InternshipRole.tradeMarketing)
        .length;
    final it = contestants
        .where((element) =>
            element.careerInfo.desiredPathway.role ==
            InternshipRole.itDataAnalyst)
        .length;
    final rtm = contestants
        .where((element) =>
            element.careerInfo.desiredPathway.role == InternshipRole.rtm)
        .length;
    final keyAccountOnPremise = contestants
        .where((element) =>
            element.careerInfo.desiredPathway.role ==
            InternshipRole.keyAccountOnPremise)
        .length;
    final keyAccountOffPremise = contestants
        .where((element) =>
            element.careerInfo.desiredPathway.role ==
            InternshipRole.keyAccountOffPremise)
        .length;
    final salesHN = contestants
        .where((element) =>
            element.careerInfo.desiredPathway.role == InternshipRole.sales &&
            element.careerInfo.desiredPathway.location.first ==
                LocationModel.hanoi)
        .length;
    final salesNW = contestants
        .where((element) =>
            element.careerInfo.desiredPathway.role == InternshipRole.sales &&
            element.careerInfo.desiredPathway.location.first ==
                LocationModel.northWest)
        .length;
    final salesNE = contestants
        .where((element) =>
            element.careerInfo.desiredPathway.role == InternshipRole.sales &&
            element.careerInfo.desiredPathway.location.first ==
                LocationModel.northEast)
        .length;
    final salesCentral = contestants
        .where((element) =>
            element.careerInfo.desiredPathway.role == InternshipRole.sales &&
            element.careerInfo.desiredPathway.location.first ==
                LocationModel.centralProvinces)
        .length;
    final salesSouthProvince = contestants
        .where((element) =>
            element.careerInfo.desiredPathway.role == InternshipRole.sales &&
            element.careerInfo.desiredPathway.location.first ==
                LocationModel.southProvinces)
        .length;
    final salesMekong = contestants
        .where((element) =>
            element.careerInfo.desiredPathway.role == InternshipRole.sales &&
            element.careerInfo.desiredPathway.location.first ==
                LocationModel.mekongDelta)
        .length;
    final salesHCM = contestants
        .where((element) =>
            element.careerInfo.desiredPathway.role == InternshipRole.sales &&
            element.careerInfo.desiredPathway.location.first ==
                LocationModel.hochiminh)
        .length;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomProgressWidget(
          value: widget.contestants.length,
          totalValue: OthersConstant.maxCVCount,
          title: S.current.totalCVs,
          subTitle: S.current.totalCVsSubmitted,
        ),
        8.hSpace,
        Wrap(
          runSpacing: 16,
          spacing: 16,
          children: [
            CustomProgressWidget(
              value: procurement,
              totalValue: OthersConstant.maxProcurementCVs,
              title: S.current.procurement,
              subTitle: S.current.totalCVsSubmitted,
            ),
            CustomProgressWidget(
              value: tradeMKT,
              totalValue: OthersConstant.maxTradeMKTCVS,
              title: S.current.tradeMarketing,
              subTitle: S.current.totalCVsSubmitted,
            ),
            CustomProgressWidget(
              value: it,
              totalValue: OthersConstant.maxITCVs,
              title: S.current.itDataAnalyst,
              subTitle: S.current.totalCVsSubmitted,
            ),
            CustomProgressWidget(
              value: rtm,
              totalValue: OthersConstant.maxRTMCVs,
              title: S.current.routeToMarket,
              subTitle: S.current.totalCVsSubmitted,
            ),
            CustomProgressWidget(
              value: keyAccountOnPremise,
              totalValue: OthersConstant.maxKeyAccountOnPremiseCVs,
              title: S.current.keyAccountOnPremise,
              subTitle: S.current.totalCVsSubmitted,
            ),
            CustomProgressWidget(
              value: keyAccountOffPremise,
              totalValue: OthersConstant.maxKeyAccountOffPremiseCVs,
              title: S.current.keyAccountOffPremise,
              subTitle: S.current.totalCVsSubmitted,
            ),
            CustomProgressWidget(
              value: salesHN,
              totalValue: OthersConstant.maxSalesHN,
              title: '${S.current.sales} - ${S.current.hanoi}',
              subTitle: S.current.totalCVsSubmitted,
            ),
            CustomProgressWidget(
              value: salesNW,
              totalValue: OthersConstant.maxSalesNorthWest,
              title: '${S.current.sales} - ${S.current.northWest}',
              subTitle: S.current.totalCVsSubmitted,
            ),
            CustomProgressWidget(
              value: salesNE,
              totalValue: OthersConstant.maxSalesNorthEast,
              title: '${S.current.sales} - ${S.current.northEast}',
              subTitle: S.current.totalCVsSubmitted,
            ),
            CustomProgressWidget(
              value: salesCentral,
              totalValue: OthersConstant.maxSalesCentral,
              title: '${S.current.sales} - ${S.current.centralProvinces}',
              subTitle: S.current.totalCVsSubmitted,
            ),
            CustomProgressWidget(
              value: salesSouthProvince,
              totalValue: OthersConstant.maxSalesSouthProvince,
              title: '${S.current.sales} - ${S.current.southProvinces}',
              subTitle: S.current.totalCVsSubmitted,
            ),
            CustomProgressWidget(
              value: salesMekong,
              totalValue: OthersConstant.maxSalesMekong,
              title: '${S.current.sales} - ${S.current.mekongDelta}',
              subTitle: S.current.totalCVsSubmitted,
            ),
            CustomProgressWidget(
              value: salesHCM,
              totalValue: OthersConstant.maxSalesHCM,
              title: '${S.current.sales} - ${S.current.hoChiMinh}',
              subTitle: S.current.totalCVsSubmitted,
            ),
          ],
        )
      ],
    );
  }
}

class CustomProgressWidget extends StatelessWidget {
  final int value;
  final int totalValue;
  final String title;
  final String subTitle;
  const CustomProgressWidget({
    super.key,
    required this.value,
    required this.totalValue,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    double linearValue = value * 1.0 / totalValue;
    return Container(
      width: 330.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: const Color.fromRGBO(26, 54, 126, 0.125),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(4, 9, 20, 0.03),
            offset: Offset(0, 16 * 0.46875),
            blurRadius: 16 * 2.1875,
          ),
          BoxShadow(
            color: Color.fromRGBO(4, 9, 20, 0.03),
            offset: Offset(0, 16 * 0.9375),
            blurRadius: 16 * 1.40625,
          ),
          BoxShadow(
            color: Color.fromRGBO(4, 9, 20, 0.05),
            offset: Offset(0, 16 * 0.25),
            blurRadius: 16 * 0.53125,
          ),
          BoxShadow(
            color: Color.fromRGBO(4, 9, 20, 0.03),
            offset: Offset(0, 16 * 0.125),
            blurRadius: 16 * 0.1875,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    2.hSpace,
                    Text(
                      subTitle,
                      style: textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF6c757d),
                      ),
                    ),
                  ],
                ),
              ),
              8.wSpace,
              SelectableText.rich(
                TextSpan(
                  text: value.toStringWithSeperator(),
                  style: textTheme.displayLarge?.copyWith(
                    color: colorScheme.primary,
                  ),
                  children: [
                    TextSpan(
                      text: '/ $totalValue',
                      style: textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF6c757d),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          8.hSpace,
          LinearProgressIndicator(
            value: linearValue > 1 ? 1 : linearValue,
            color: colorScheme.primary,
            minHeight: 10,
            backgroundColor: const Color(0xFFe9ecef),
            borderRadius: BorderRadius.circular(5),
          )
        ],
      ),
    );
  }
}
