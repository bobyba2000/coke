import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/exhibition/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

enum InternshipRole {
  procurement,
  tradeMarketing,
  rtm,
  keyAccountOnPremise,
  keyAccountOffPremise,
  itDataAnalyst,
  itPrivacy,
  sales;

  String get title {
    switch (this) {
      case InternshipRole.procurement:
        return S.current.procurementTitle;
      case InternshipRole.tradeMarketing:
      case InternshipRole.rtm:
      case InternshipRole.keyAccountOnPremise:
      case InternshipRole.keyAccountOffPremise:
        return S.current.commercial;
      case InternshipRole.itDataAnalyst:
      case InternshipRole.itPrivacy:
        return S.current.it;
      case InternshipRole.sales:
        return S.current.salesTitle;
    }
  }

  Widget get background {
    final width = 1400.w;
    final height = 900.h;
    switch (this) {
      case InternshipRole.procurement:
        return Assets.images.career.procurement.image(
          height: height,
          width: width,
          fit: BoxFit.fill,
        );
      case InternshipRole.tradeMarketing:
        return Assets.images.career.tradeMkt.image(
          height: height,
          width: width,
          fit: BoxFit.fill,
        );
      case InternshipRole.rtm:
        return Assets.images.career.rtm.image(
          height: height,
          width: width,
          fit: BoxFit.fill,
        );
      case InternshipRole.keyAccountOnPremise:
        return Assets.images.career.onPremise.image(
          height: height,
          width: width,
          fit: BoxFit.fill,
        );
      case InternshipRole.keyAccountOffPremise:
        return Assets.images.career.offPremise.image(
          height: height,
          width: width,
          fit: BoxFit.fill,
        );
      case InternshipRole.itDataAnalyst:
        return Assets.images.career.itData.image(
          height: height,
          width: width,
          fit: BoxFit.fill,
        );
      case InternshipRole.itPrivacy:
        return Assets.images.career.itPrivacy.image(
          height: height,
          width: width,
          fit: BoxFit.fill,
        );
      case InternshipRole.sales:
        return Assets.images.career.sales.image(
          height: height,
          width: width,
          fit: BoxFit.fill,
        );
    }
  }

  Widget responsibilities() {
    String responsibilitiesStr = '';
    switch (this) {
      case InternshipRole.sales:
        responsibilitiesStr = S.current.salesResponsibilities;
      case InternshipRole.procurement:
        responsibilitiesStr = S.current.procurementResponsibilities;
      case InternshipRole.tradeMarketing:
        responsibilitiesStr = S.current.tradeMarketingResponsibilities;
      case InternshipRole.rtm:
        responsibilitiesStr = S.current.rtmResponsibilities;
      case InternshipRole.keyAccountOnPremise:
        responsibilitiesStr = S.current.onPremiseResponsibilities;
      case InternshipRole.keyAccountOffPremise:
        responsibilitiesStr = S.current.offPremiseResponsibilities;
      case InternshipRole.itDataAnalyst:
        responsibilitiesStr = S.current.itDataResponsibilities;
      case InternshipRole.itPrivacy:
        responsibilitiesStr = S.current.itPrivacyResponsibilities;
    }
    final data = responsibilitiesStr.split(';');
    final foreground = this == InternshipRole.tradeMarketing ? const Color(0xFFAA7047) : Colors.white;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.keyRoleResponsibilities,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.spMin,
            color: foreground,
          ),
        ),
        12.hSpace,
        ...List.generate(
          data.length,
          (index) {
            final item = data[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: index != 0 || (this != InternshipRole.rtm && this != InternshipRole.tradeMarketing),
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.spMax, right: 16),
                      child: Icon(
                        Icons.circle,
                        color: foreground,
                        size: 10.spMin,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: TextStyle(
                        color: foreground,
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  String get note {
    if (this == InternshipRole.sales || this == InternshipRole.tradeMarketing) {
      return S.current.careerNote1;
    }
    return S.current.careerNote2;
  }

  Widget overview() {
    String overviewStr = '';
    switch (this) {
      case InternshipRole.sales:
        overviewStr = S.current.salesOverview;
      case InternshipRole.procurement:
        overviewStr = S.current.procurementOverview;
      case InternshipRole.tradeMarketing:
        overviewStr = S.current.tradeMarketingOverview;
      case InternshipRole.rtm:
        overviewStr = S.current.rtmOverview;
      case InternshipRole.keyAccountOnPremise:
        overviewStr = S.current.onPremiseOverview;
      case InternshipRole.keyAccountOffPremise:
        overviewStr = S.current.offPremiseOverview;
      case InternshipRole.itDataAnalyst:
        overviewStr = S.current.itDataOverview;
      case InternshipRole.itPrivacy:
        overviewStr = S.current.itPrivacyOverview;
    }
    final items = overviewStr.split(';');
    final foreground = this == InternshipRole.tradeMarketing ? const Color(0xFFAA7047) : Colors.white;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.jobOverview,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.spMin,
            color: foreground,
          ),
        ),
        12.hSpace,
        ...List.generate(
          items.length,
          (index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: !item.startsWith('(*)'),
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.spMax, right: 16),
                      child: Icon(
                        Icons.circle,
                        color: foreground,
                        size: 10.spMin,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: TextStyle(
                        color: foreground,
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Visibility(
          visible: this == sales,
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Wrap(
              runSpacing: 12,
              spacing: 12,
              children: LocationModel.values
                  .map(
                    (e) => Tooltip(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      padding: const EdgeInsets.all(0),
                      richMessage: WidgetSpan(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.white,
                          ),
                          constraints: BoxConstraints(
                            maxWidth: 260.w,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.toString(),
                                      style: TextStyle(
                                        fontSize: 12.spMin,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF5B2707),
                                      ),
                                    ),
                                    10.hSpace,
                                    Wrap(
                                      spacing: 16,
                                      runSpacing: 16,
                                      children: (LocaleUtility.locale.value.languageCode == 'vi' ? e.citiesVi : e.citiesEn)
                                          .split(', ')
                                          .map(
                                            (e) => SizedBox(
                                              width: 90,
                                              child: Text(
                                                e,
                                                style: TextStyle(
                                                  fontSize: 12.spMin,
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color(0xFF5B2707),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                              10.hSpace,
                              Assets.images.career.dropdown.image(
                                width: 260.w,
                                fit: BoxFit.fitWidth,
                              ),
                            ],
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: Text(
                          e.toString(),
                          style: TextStyle(
                            fontSize: 16.spMin,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget titleWidget() {
    switch (this) {
      case InternshipRole.procurement:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 52.spMin,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFDF056),
              ),
            ),
            12.w.hSpace,
            Text(
              subtitle.toUpperCase(),
              style: TextStyle(
                fontSize: 19.spMin,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFDF056),
              ),
            ),
            20.w.hSpace,
          ],
        );
      case InternshipRole.tradeMarketing:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 52.spMin,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFDF056),
              ),
            ),
            12.w.hSpace,
            Text(
              subtitle.toUpperCase(),
              style: TextStyle(
                fontSize: 19.spMin,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFDF056),
              ),
            ),
            56.w.hSpace,
          ],
        );
      case InternshipRole.rtm:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 52.spMin,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFDF056),
              ),
            ),
            12.hSpace,
            Text(
              subtitle.toUpperCase(),
              style: TextStyle(
                fontSize: 19.spMin,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFDF056),
              ),
            ),
            60.h.hSpace,
          ],
        );
      case InternshipRole.keyAccountOnPremise:
      case InternshipRole.keyAccountOffPremise:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 52.spMin,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFDF056),
              ),
            ),
            12.hSpace,
            Text(
              '$subtitle $content'.toUpperCase(),
              style: TextStyle(
                fontSize: 19.spMin,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFDF056),
              ),
            ),
            100.h.hSpace,
          ],
        );
      case InternshipRole.itDataAnalyst:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 52.spMin,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFE6A00),
              ),
            ),
            12.hSpace,
            Text(
              subtitle.toUpperCase(),
              style: TextStyle(
                fontSize: 19.spMin,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFE6A00),
              ),
            ),
            100.h.hSpace,
          ],
        );
      case InternshipRole.itPrivacy:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 52.spMin,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFDF056),
              ),
            ),
            12.hSpace,
            Text(
              subtitle.toUpperCase(),
              style: TextStyle(
                fontSize: 19.spMin,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFDF056),
              ),
            ),
            40.h.hSpace,
          ],
        );
      case InternshipRole.sales:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 52.spMin,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFDF056),
              ),
            ),
            120.h.hSpace,
          ],
        );
    }
  }

  Widget leftWidget() {
    Widget widget = const Expanded(child: SizedBox.shrink());
    if (this == sales ||
        this == InternshipRole.procurement ||
        this == InternshipRole.tradeMarketing ||
        this == InternshipRole.itDataAnalyst ||
        this == InternshipRole.keyAccountOffPremise) {
      final foreground = this == InternshipRole.tradeMarketing ? const Color(0xFFAA7047) : Colors.white;
      widget = Padding(
        padding: EdgeInsets.only(left: 80.w, top: 80.w),
        child: SizedBox(
          width: 650.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleWidget(),
              overview(),
              20.w.hSpace,
              responsibilities(),
              14.w.hSpace,
              RichText(
                text: TextSpan(
                  text: '${S.current.note}: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 14.spMin,
                    color: foreground,
                  ),
                  children: [
                    TextSpan(
                      text: note,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 14.spMin,
                        color: foreground,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return widget;
  }

  Widget rightWidget() {
    Widget widget = const Expanded(child: SizedBox.shrink());
    if (this == InternshipRole.rtm || this == InternshipRole.itPrivacy || this == InternshipRole.keyAccountOnPremise) {
      final foreground = this == InternshipRole.tradeMarketing ? const Color(0xFFAA7047) : Colors.white;
      widget = Padding(
        padding: EdgeInsets.only(right: 80.w, top: 80.h),
        child: SizedBox(
          width: 650.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleWidget(),
              overview(),
              20.w.hSpace,
              responsibilities(),
              14.w.hSpace,
              RichText(
                text: TextSpan(
                  text: '${S.current.note}: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 14.spMin,
                    color: foreground,
                  ),
                  children: [
                    TextSpan(
                      text: note,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.spMin,
                        color: foreground,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return widget;
  }

  Future<void> showDialog() async {
    SmartDialog.show(
      builder: (context) {
        Widget left = leftWidget();
        Widget right = rightWidget();

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          width: 1400.w,
          height: 900.h,
          child: Stack(
            fit: StackFit.expand,
            children: [
              background,
              Row(
                children: [
                  left,
                  right,
                ],
              ),
              Positioned(
                top: 40,
                right: 40,
                child: IconButton(
                  onPressed: () {
                    SmartDialog.dismiss();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String get subtitle {
    switch (this) {
      case InternshipRole.procurement:
        return S.current.directIndirect;
      case InternshipRole.tradeMarketing:
        return S.current.tradeMarketingSubtitle;
      case InternshipRole.rtm:
        return S.current.routeToMarketSubtitle;
      case InternshipRole.keyAccountOnPremise:
      case InternshipRole.keyAccountOffPremise:
        return S.current.keyAccount;
      case InternshipRole.itDataAnalyst:
        return S.current.dataAnalyst;
      case InternshipRole.itPrivacy:
        return S.current.privacyCompliance;
      case InternshipRole.sales:
        return S.current.salesSubtitle;
    }
  }

  String? get content {
    switch (this) {
      case InternshipRole.tradeMarketing:
        return S.current.tradeMarketingContent;
      case InternshipRole.keyAccountOffPremise:
        return S.current.offPremise;
      case InternshipRole.keyAccountOnPremise:
        return S.current.onPremise;
      default:
        return null;
    }
  }

  Color get color {
    switch (this) {
      case InternshipRole.procurement:
        return const Color(0xFFfe6a00);
      case InternshipRole.tradeMarketing:
        return const Color(0xFFfed700);
      case InternshipRole.rtm:
        return const Color(0xFF9933ff);
      case InternshipRole.keyAccountOnPremise:
        return const Color(0xFF3f6db8);
      case InternshipRole.keyAccountOffPremise:
        return const Color(0xFF3f6db8);
      case InternshipRole.itDataAnalyst:
        return const Color(0xFF28a549);
      case InternshipRole.itPrivacy:
        return const Color(0xFF28a549);
      case InternshipRole.sales:
        return const Color(0xFFfe0036);
    }
  }

  @override
  String toString() {
    switch (this) {
      case procurement:
        return S.current.procurement;
      case tradeMarketing:
        return S.current.tradeMarketing;
      case keyAccountOnPremise:
        return S.current.keyAccountOnPremise;
      case keyAccountOffPremise:
        return S.current.keyAccountOffPremise;
      case InternshipRole.itDataAnalyst:
        return S.current.itDataAnalyst;
      case InternshipRole.itPrivacy:
        return S.current.itPrivacy;
      case sales:
        return S.current.sales;
      case rtm:
        return S.current.routeToMarket;
    }
  }

  List<Skill> get desiredSkills {
    switch (this) {
      case InternshipRole.sales:
        return [
          Skill.influencing,
          Skill.numericalSkill,
        ];
      case InternshipRole.itDataAnalyst:
        return [
          Skill.businessAcumen,
          Skill.attentionToDetails,
        ];
      case InternshipRole.itPrivacy:
        return [
          Skill.businessAcumen,
          Skill.stakeholderManagement,
        ];
      case InternshipRole.procurement:
        return [
          Skill.businessProcessImprovement,
          Skill.attentionToDetails,
          Skill.communication,
          Skill.inventoryManagement,
          Skill.dataManagement,
        ];
      case InternshipRole.tradeMarketing:
        return [
          Skill.projectManagement,
          Skill.creativeThinking,
        ];
      case InternshipRole.rtm:
        return [
          Skill.agility,
          Skill.businessProcessImprovement,
          Skill.dataAnalysis,
          Skill.dataVisualization,
        ];
      case InternshipRole.keyAccountOnPremise:
        return []; // No skills listed for this role
      case InternshipRole.keyAccountOffPremise:
        return [
          Skill.stakeholderManagement,
          Skill.problemSolving,
          Skill.communication,
        ];
      default:
        return [];
    }
  }

  List<Skill> get essentialSkills {
    switch (this) {
      case InternshipRole.sales:
        return [
          Skill.selling,
          Skill.criticalThinking,
          Skill.problemSolving,
          Skill.stakeholderManagement,
          Skill.negotiation,
        ];
      case InternshipRole.itDataAnalyst:
        return [
          Skill.dataAnalysis,
          Skill.dataModeling,
          Skill.powerBI,
          Skill.python,
          Skill.communication,
        ];
      case InternshipRole.itPrivacy:
        return [
          Skill.dataManagement,
          Skill.forecasting, // Using Risk Analysis as Forecasting, replace with the right skill if needed
          Skill.criticalThinking,
          Skill.problemSolving,
          Skill.communication,
        ];
      case InternshipRole.procurement:
        return [
          Skill.criticalThinking,
          Skill.dataAnalysis,
          Skill.financialAcumen,
          Skill.problemSolving,
          Skill.digitalLiteracy,
        ];
      case InternshipRole.tradeMarketing:
        return [
          Skill.numericalSkill,
          Skill.communication,
          Skill.presentation,
          Skill.problemSolving,
          Skill.stakeholderManagement,
        ];
      case InternshipRole.rtm:
        return [
          Skill.projectManagement,
          Skill.stakeholderManagement,
          Skill.criticalThinking,
          Skill.communication,
          Skill.presentation,
        ];
      case InternshipRole.keyAccountOnPremise:
        return [
          Skill.communication,
          Skill.presentation,
          Skill.problemSolving,
          Skill.stakeholderManagement,
          Skill.numericalSkill,
        ];
      case InternshipRole.keyAccountOffPremise:
        return [
          Skill.eventPlanningExecution,
          Skill.numericalSkill,
          Skill.creativeThinking,
          Skill.presentation,
        ];
      default:
        return [];
    }
  }

  List<CompanyIndustry> get industries {
    switch (this) {
      case InternshipRole.itDataAnalyst:
        return [
          CompanyIndustry.fmcg,
          CompanyIndustry.engineering,
          CompanyIndustry.hardwareTechnology,
          CompanyIndustry.itSoftware,
        ];
      case InternshipRole.itPrivacy:
        return [
          CompanyIndustry.fmcg,
          CompanyIndustry.engineering,
          CompanyIndustry.hardwareTechnology,
          CompanyIndustry.itSoftware,
        ];
      case InternshipRole.procurement:
        return [
          CompanyIndustry.fmcg,
          CompanyIndustry.engineering,
          CompanyIndustry.construction,
        ];
      case InternshipRole.tradeMarketing:
        return [
          CompanyIndustry.fmcg,
          CompanyIndustry.prCommunications,
        ];
      case InternshipRole.rtm:
        return [
          CompanyIndustry.fmcg,
        ];
      case InternshipRole.keyAccountOnPremise:
        return [
          CompanyIndustry.fmcg,
          CompanyIndustry.retail,
        ];
      case InternshipRole.keyAccountOffPremise:
        return [
          CompanyIndustry.fmcg,
          CompanyIndustry.retail,
        ];
      default:
        return [];
    }
  }
}

enum LocationModel {
  northEast,
  northWest,
  hanoi,
  centralProvinces,
  southProvinces,
  hochiminh,
  mekongDelta;

  @override
  String toString() {
    switch (this) {
      case LocationModel.northEast:
        return S.current.northEast;
      case LocationModel.northWest:
        return S.current.northWest;
      case LocationModel.hanoi:
        return S.current.hanoi;
      case LocationModel.centralProvinces:
        return S.current.centralProvinces;
      case LocationModel.hochiminh:
        return S.current.hoChiMinh;
      case LocationModel.mekongDelta:
        return S.current.mekongDelta;
      case LocationModel.southProvinces:
        return S.current.southProvinces;
    }
  }

  String get citiesEn {
    switch (this) {
      case LocationModel.northWest:
        return 'Bac Ninh, Bac Giang, Lang Son, Vinh Phuc, Tuyen Quang, Ha Giang, Phu Tho, Thai Nguyen, Cao Bang, Bac Kan, Hoa Binh, Son La, Dien Bien, Yen Bai, Lao Cai, Lai Chau';
      case LocationModel.northEast:
        return 'Hai Phong, Hai Duong, Quang Ninh, Hung Yen, Thai Binh, Ha Nam, Nam Dinh, Ninh Binh, Thanh Hoa, Nghe An, Ha Tinh';
      case LocationModel.hanoi:
        return 'Ha Noi';
      case LocationModel.centralProvinces:
        return 'Da Nang, Hue, Quang Binh, Quang Tri, Quang Nam, Quang Ngai, Binh Dinh, Phu Yen, Gia Lai, KonTum';
      case LocationModel.hochiminh:
        return 'Ho Chi Minh City';
      case LocationModel.mekongDelta:
        return 'Can Tho City, An Giang Province, Dong Thap Province, Long An Province, Tien Giang Province, Vinh Long Province, Ben Tre Province, Tra Vinh Province, Soc Trang Province, Hau Giang Province, Bac Lieu Province, Ca Mau Province, Kien Giang Province';
      case LocationModel.southProvinces:
        return 'Binh Duong, Binh Phuoc, Tay Ninh, Dong Nai, Ba Ria- Vung Tau, Ninh Thuan, Binh Thuan, Lam Dong, Dak Lak, Dak Nong, Khanh Hoa';
    }
  }

  String get citiesVi {
    switch (this) {
      case LocationModel.northWest:
        return 'Bắc Ninh, Bắc Giang, Lạng Sơn, Vĩnh Phúc, Tuyên Quang, Hà Giang, Phú Thọ, Thái Nguyên, Cao Bằng, Bắc Kạn, Hoà Bình, Sơn La, Điện Biên, Yên Bái, Lào Cai, Lai Châu​';
      case LocationModel.northEast:
        return 'Hải Phòng, Hải Dương, Quảng Ninh, Hưng Yên, Thái Bình, Hà Nam, Nam Định, Ninh Bình, Thanh Hoá, Nghệ An, Hà Tĩnh​​';
      case LocationModel.hanoi:
        return 'Hà Nội';
      case LocationModel.centralProvinces:
        return 'Đà Nẵng, Huế, Quảng Bình, Quảng Trị, Quảng Nam, Quảng Ngãi, Bình Định, Phú Yên, Gia Lai, KonTum';
      case LocationModel.hochiminh:
        return 'Thành phố Hồ Chí Minh';
      case LocationModel.mekongDelta:
        return 'TP. Cần Thơ, tỉnh An Giang, tỉnh Đồng Tháp, tỉnh Long An, tỉnh Tiền Giang, tỉnh Vĩnh Long, tỉnh Bến Tre, tỉnh Trà Vinh, tỉnh Sóc Trăng, tỉnh Hậu Giang, tỉnh Bạc Liêu, tỉnh Cà Mau, tỉnh Kiên Giang​';
      case LocationModel.southProvinces:
        return 'Bình Dương, Bình Phước, Tây Ninh, Đồng Nai, Bà Rịa- Vũng Tàu, Ninh Thuận, Bình Thuận, Lâm Đồng, Dak Lak, Dak Nong, Khánh Hòa​​';
    }
  }

  List<String> get priorityLocation {
    switch (this) {
      case LocationModel.northEast:
        return [
          'Nam Định',
          'Nam Dinh',
          'Thanh Hóa',
          'Thanh Hoa',
        ];
      case LocationModel.northWest:
        return [
          'Bắc Ninh',
          'Bac Ninh',
          'Bac Giang',
          'Bắc Giang',
        ];
      case LocationModel.hanoi:
        return [
          'Hà Nội',
          'Hanoi',
        ];
      case LocationModel.centralProvinces:
        return [
          'Quang Nam',
          'Quảng Nam',
          'Quang Ngai',
          'Quảng Ngãi',
          'Gia Lai',
        ];
      case LocationModel.hochiminh:
        return [
          'Hồ Chí Minh',
          'Ho Chi Minh City',
        ];
      case LocationModel.mekongDelta:
        return ['Can Tho', 'Cần Thơ', 'Tiền Giang', 'Tien Giang'];
      case LocationModel.southProvinces:
        return [
          'Bà Rịa - Vũng Tàu',
          'Ba Ria - Vung Tau',
          'Binh Thuan',
          'Bình Thuận',
        ];
    }
  }
}

@JsonSerializable()
class WorkingLocationModel {
  final LocationModel first;
  final LocationModel? second;
  final bool? willingToChange;

  WorkingLocationModel({
    required this.first,
    required this.second,
    required this.willingToChange,
  });

  factory WorkingLocationModel.fromJson(Map<String, dynamic> json) => _$WorkingLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkingLocationModelToJson(this);
}

@JsonSerializable()
class DesiredPathwayModel {
  final InternshipRole role;
  final WorkingLocationModel location;

  DesiredPathwayModel({
    required this.role,
    required this.location,
  });

  factory DesiredPathwayModel.fromJson(Map<String, dynamic> json) => _$DesiredPathwayModelFromJson(json);

  Map<String, dynamic> toJson() => _$DesiredPathwayModelToJson(this);
}

enum AvailabilityType {
  fulltime6Months,
  shiftOff1To2PerWeek,
  shiftOff3PerWeek,
  shiftOffMoreThan3;

  @override
  String toString() {
    switch (this) {
      case fulltime6Months:
        return S.current.fulltime6Months;
      case shiftOff1To2PerWeek:
        return S.current.shiftOff1To2;
      case shiftOff3PerWeek:
        return S.current.shiftOff3;
      case shiftOffMoreThan3:
        return S.current.shiftOffOver3;
    }
  }
}

@JsonSerializable()
class AvailabilityModel {
  final AvailabilityType type;
  final String? note;

  AvailabilityModel({
    required this.type,
    required this.note,
  });

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) => _$AvailabilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvailabilityModelToJson(this);
}

@JsonSerializable()
class CareerInfoModel {
  final DesiredPathwayModel desiredPathway;
  final AvailabilityModel availability;

  num get desiredPathwayPoint {
    final role = desiredPathway.role;
    num point = 0;
    if (role == InternshipRole.sales) {
      if (desiredPathway.location.willingToChange == true) {
        point += 5;
      }
    }
    return point;
  }

  num locationPriority1Point(String hometown, String currentLiving) {
    final firstLocation = desiredPathway.location.first;
    final role = desiredPathway.role;
    if (role == InternshipRole.sales) {
      if (firstLocation.priorityLocation.contains(hometown)) {
        return 5;
      }
      if (firstLocation.priorityLocation.contains(currentLiving)) {
        return 3;
      }
    }
    return 0;
  }

  num locationPriority2Point(String hometown, String currentLiving) {
    final secondLocation = desiredPathway.location.second;
    if (secondLocation == null) {
      return 0;
    }
    final role = desiredPathway.role;
    if (role == InternshipRole.sales) {
      if (secondLocation.priorityLocation.contains(hometown)) {
        return 2;
      }
      if (secondLocation.priorityLocation.contains(currentLiving)) {
        return 1;
      }
    }
    return 0;
  }

  num? get availabilityPoint {
    final role = desiredPathway.role;
    if (availability.type == AvailabilityType.fulltime6Months) {
      return 5;
    } else if (availability.type == AvailabilityType.shiftOff1To2PerWeek) {
      if (role == InternshipRole.sales || role == InternshipRole.tradeMarketing) {
        return null;
      } else {
        return 3;
      }
    } else if (availability.type == AvailabilityType.shiftOff3PerWeek) {
      if (role == InternshipRole.itDataAnalyst || role == InternshipRole.itPrivacy || role == InternshipRole.procurement) {
        return 0;
      }
      return null;
    } else {
      return null;
    }
  }

  num? calculatePoint(
    String hometown,
    String currentLiving,
  ) {
    if (availabilityPoint == null) {
      return null;
    }
    num point = 0;
    point += desiredPathwayPoint;
    point += availabilityPoint!;
    point += locationPriority1Point(hometown, currentLiving);
    point += locationPriority2Point(hometown, currentLiving);
    return point;
  }

  CareerInfoModel({
    required this.desiredPathway,
    required this.availability,
  });

  factory CareerInfoModel.fromJson(Map<String, dynamic> json) => _$CareerInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CareerInfoModelToJson(this);
}
