import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/validator.dart';
import 'package:coke_platform/common/widget/button/outlined.dart';
import 'package:coke_platform/common/widget/field/auto_complete_widget.dart';
import 'package:coke_platform/common/widget/field/datepicker_widget.dart';
import 'package:coke_platform/common/widget/field/dropdown_widget.dart';
import 'package:coke_platform/common/widget/field/textfield_widget.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/exhibition/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillViewModel {
  String skill = '';
  String description = '';
}

class CompetionViewModel {
  String name = '';
  String accomplishment = '';
}

class WorkingExperienceViewModel {
  WorkingType? type;
  String? industry;
  DateTime? fromDate;
  DateTime? toDate;
  String? companyName;
  String? title;
}

class ProfileExhibitionWidget extends StatefulWidget {
  final Function(ExhibitionInfoModel exhibition) onFinish;
  final VoidCallback onBack;
  const ProfileExhibitionWidget({
    super.key,
    required this.onFinish,
    required this.onBack,
  });

  @override
  State<ProfileExhibitionWidget> createState() => _ProfileExhibitionWidgetState();
}

class _ProfileExhibitionWidgetState extends State<ProfileExhibitionWidget> with Validator {
  final allSkills = [
    'Inventory Management',
    'SQL',
    'Attention to details',
    'Problem-solving',
    'Communication',
    'Data Visualization',
    'Event planning and execution',
    'Business acumen',
    'Numerical skill',
    'Agility',
    'Critical thinking',
    'Data Management',
    'Digital Literacy',
    'Selling',
    'Data Modelling',
    'Negotiation',
    'Python',
    'Project management',
    'Stakeholder Management',
    'Presentation',
    'Critical Thinking',
    'Creative thinking',
    'System design',
    'Stakeholder management',
    'Communications',
    'Business process improvement',
    'Financial acumen',
    'Influencing',
    'Cloud based tools',
    'Data Analysis',
    'Data analysis',
    'Machine Learning',
    'Numerical Skill',
  ];

  final List<String> competitions = [
    'Battle of Mind (BAT)',
    'Unilever\'s Future Leaders\' League (UFLL)',
    'L\'Oreal Brandstorm',
    'HSBC Business Challenge',
    'Nielsen Case Competition',
    'P&G CEO Challenge',
    'Vietnam Young Lions',
    'Marketing On Air',
    'Doanh Nhân Tập Sự',
    'Ứng viên tài năng'
  ];

  final List<String> prizes = [
    'Top 1',
    'Top 2',
    'Top 3',
    'Top 4',
    'Top 5',
    'Top 10',
  ];

  final List<String> companies = [
    'Abbott',
    'Ab-inbev',
    'Acecook',
    'AEON',
    'AstraZeneca',
    'Bosch',
    'British American Tobacco',
    'CP',
    'CJ Foods',
    'Viettel',
    'Marico South East Asia',
    'Thiên Long',
    'SYNGENTA',
    'Daikin',
    'Deloitte',
    'Diana Unicharm',
    'DKSH',
    'FPT',
    'Greenfeed',
    'GSK',
    'Home Credit',
    'Honda',
    'Insee',
    'KPMG',
    'L\'Oréal',
    'Lazada',
    'Lotte Mart',
    'Maersk',
    'Manulife',
    'Masan',
    'Momo',
    'Mondelez',
    'NashTech',
    'Nestle',
    'NutiFood',
    'Pfizer',
    'PNJ',
    'Prudential',
    'Sabeco',
    'Samsung',
    'Sanofi',
    'Schneider',
    'Shopee',
    'Suntory PepsiCo',
    'One Mount',
    'Techcombank',
    'Unilever',
    'Vinamilk',
    'Vietcombank',
    'VNG',
    'Wipro Consumer',
    'Central Retail',
    'Heineken',
    'Nielsen',
    'BCG',
    'Intel',
    'P&G',
    'PWC',
    'EY',
    'Mindshare',
    'GroupM',
    'Dentsu',
    'Ogilvy'
  ];

  final industries = CompanyIndustry.values.map((e) => e.toString()).toList();

  List<SkillViewModel> skills = [
    SkillViewModel(),
  ];

  List<CompetionViewModel> achivements = [
    CompetionViewModel(),
  ];

  List<WorkingExperienceViewModel> experiences = [
    WorkingExperienceViewModel(),
  ];

  final workingTypes = WorkingType.values
      .map(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(e.toString()),
        ),
      )
      .toList();

  final certificates = EnglistCertification.values
      .map(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(e.toString()),
        ),
      )
      .toList();

  final cambridgeDetails = ['KET', 'PET', 'PEC', 'PCE', 'CAE', 'CPE']
      .map(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ),
      )
      .toList();

  final cefrDetails = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2']
      .map(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ),
      )
      .toList();

  EnglistCertification? certification;
  String certDetail = '';
  final form = GlobalKey<FormState>();

  @override
  void initState() {
    allSkills.sort();
    competitions.sort();
    prizes.sort();
    companies.sort();
    industries.sort();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Form(
      key: form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.current.profileExhibition,
            style: textTheme.displayLarge?.copyWith(
              color: colorScheme.onBackground,
            ),
          ),
          64.h.hSpace,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.skills,
                style: textTheme.displaySmall?.copyWith(
                  color: colorScheme.onBackground,
                ),
              ),
              Text(
                S.current.skillHelperText,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onBackground.withOpacity(0.5),
                  fontStyle: FontStyle.italic,
                ),
              ),
              16.hSpace,
              ...skills.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AutoCompleteWidget(
                          getSuggestData: (value) async {
                            return allSkills
                                .where(
                                  (element) => element.toLowerCase().contains(
                                        value.toLowerCase(),
                                      ),
                                )
                                .toList();
                          },
                          onChanged: (value) {
                            e.skill = value;
                          },
                          onTapItem: (value) {
                            e.skill = value;
                          },
                          label: S.current.skillSelection,
                        ),
                      ),
                      16.wSpace,
                      Expanded(
                        child: TextFieldWidget(
                          initText: e.description,
                          label: S.current.skillDemonstration,
                          maxLength: 120,
                          onChanged: (value) {
                            e.description = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              8.hSpace,
              if (skills.length < 5)
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomOutlinedButton(
                    title: S.current.addSkill,
                    onTap: () {
                      skills.add(SkillViewModel());
                      setState(() {});
                    },
                  ),
                ),
            ],
          ),
          16.hSpace,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.achivements,
                style: textTheme.displaySmall?.copyWith(
                  color: colorScheme.onBackground,
                ),
              ),
              Text(
                S.current.achivementsHelperText,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onBackground.withOpacity(0.5),
                  fontStyle: FontStyle.italic,
                ),
              ),
              16.hSpace,
              ...achivements.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AutoCompleteWidget(
                          getSuggestData: (value) async {
                            return competitions
                                .where(
                                  (element) => element.toLowerCase().contains(
                                        value.toLowerCase(),
                                      ),
                                )
                                .toList();
                          },
                          onChanged: (value) {
                            e.name = value;
                          },
                          onTapItem: (value) {
                            e.name = value;
                          },
                          label: S.current.competitionName,
                        ),
                      ),
                      16.wSpace,
                      Expanded(
                        child: AutoCompleteWidget(
                          getSuggestData: (value) async {
                            return prizes
                                .where(
                                  (element) => element.toLowerCase().contains(
                                        value.toLowerCase(),
                                      ),
                                )
                                .toList();
                          },
                          onChanged: (value) {
                            e.accomplishment = value;
                          },
                          onTapItem: (value) {
                            e.accomplishment = value;
                          },
                          label: S.current.accomplishment,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              8.hSpace,
              if (achivements.length < 2)
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomOutlinedButton(
                    title: S.current.add,
                    onTap: () {
                      achivements.add(CompetionViewModel());
                      setState(() {});
                    },
                  ),
                ),
            ],
          ),
          16.hSpace,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.workingExperience,
                style: textTheme.displaySmall?.copyWith(
                  color: colorScheme.onBackground,
                ),
              ),
              Text(
                S.current.experienceHelperText,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onBackground.withOpacity(0.5),
                  fontStyle: FontStyle.italic,
                ),
              ),
              16.hSpace,
              ...experiences.asMap().entries.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${S.current.job} ${e.key + 1}',
                            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          4.hSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AppDropDownWidget(
                                  label: S.current.workingType,
                                  items: workingTypes,
                                  onChanged: (value) {
                                    e.value.type = value;
                                  },
                                  inputBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              16.wSpace,
                              Expanded(
                                child: AutoCompleteWidget(
                                  getSuggestData: (value) async {
                                    return industries
                                        .where(
                                          (element) => element.toLowerCase().contains(
                                                value.toLowerCase(),
                                              ),
                                        )
                                        .toList();
                                  },
                                  onChanged: (value) {
                                    e.value.industry = value;
                                  },
                                  onTapItem: (value) {
                                    e.value.industry = value;
                                  },
                                  label: S.current.industry,
                                ),
                              ),
                            ],
                          ),
                          8.hSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: DatePickerWidget(
                                  label: S.current.fromDate,
                                  hintText: 'mm-yyyy',
                                  isMonthOnly: true,
                                  helperText: 'e.g. 07-2024',
                                  dateFormat: 'MM-yyyy',
                                  onChanged: (value) {
                                    e.value.fromDate = value;
                                  },
                                ),
                              ),
                              16.wSpace,
                              Expanded(
                                child: DatePickerWidget(
                                  label: S.current.toDate,
                                  hintText: 'mm-yyyy',
                                  isMonthOnly: true,
                                  helperText: 'e.g. 07-2024',
                                  dateFormat: 'MM-yyyy',
                                  onChanged: (value) {
                                    e.value.toDate = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          8.hSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AutoCompleteWidget(
                                  getSuggestData: (value) async {
                                    return companies
                                        .where(
                                          (element) => element.toLowerCase().contains(
                                                value.toLowerCase(),
                                              ),
                                        )
                                        .toList();
                                  },
                                  onChanged: (value) {
                                    e.value.companyName = value;
                                  },
                                  onTapItem: (value) {
                                    e.value.companyName = value;
                                  },
                                  label: S.current.companyName,
                                ),
                              ),
                              16.wSpace,
                              Expanded(
                                child: TextFieldWidget(
                                  label: S.current.jobTitle,
                                  initText: e.value.title,
                                  onChanged: (value) {
                                    e.value.title = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              8.hSpace,
              if (experiences.length < 3)
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomOutlinedButton(
                    title: S.current.addWorkingExperience,
                    onTap: () {
                      experiences.add(WorkingExperienceViewModel());
                      setState(() {});
                    },
                  ),
                ),
            ],
          ),
          16.hSpace,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.englishProficiency,
                style: textTheme.displaySmall?.copyWith(
                  color: colorScheme.onBackground,
                ),
              ),
              Text(
                S.current.englistHelperText,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onBackground.withOpacity(0.5),
                  fontStyle: FontStyle.italic,
                ),
              ),
              16.hSpace,
              Row(
                children: [
                  Expanded(
                    child: AppDropDownWidget(
                      label: S.current.typeOfEnglish,
                      items: certificates,
                      onChanged: (cert) {
                        certification = null;
                        setState(() {});
                        Future.delayed(const Duration(milliseconds: 400)).then(
                          (value) {
                            certification = cert;
                            certDetail = '';
                            setState(() {});
                          },
                        );
                      },
                      inputBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).dividerColor,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  16.wSpace,
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (certification == null) {
                          return const SizedBox.shrink();
                        }
                        switch (certification) {
                          case EnglistCertification.ielts:
                            return TextFieldWidget(
                              required: true,
                              label: S.current.detail,
                              validator: checkRequired,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,1}')),
                              ],
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text(
                                  '/9.0',
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: colorScheme.onBackground.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                certDetail = value;
                              },
                            );
                          case EnglistCertification.toeic:
                            return TextFieldWidget(
                              required: true,
                              label: S.current.detail,
                              validator: checkRequired,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text(
                                  '/990',
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: colorScheme.onBackground.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                certDetail = value;
                              },
                            );
                          case EnglistCertification.toefl:
                            return TextFieldWidget(
                              required: true,
                              label: S.current.detail,
                              validator: checkRequired,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text(
                                  '/120',
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: colorScheme.onBackground.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                certDetail = value;
                              },
                            );
                          case EnglistCertification.cambridge:
                            return AppDropDownWidget(
                              label: S.current.detail,
                              items: cambridgeDetails,
                              onChanged: (value) {
                                certDetail = value ?? '';
                              },
                              inputBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).dividerColor,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          case EnglistCertification.cefr:
                            return AppDropDownWidget(
                              label: S.current.detail,
                              items: cefrDetails,
                              onChanged: (value) {
                                certDetail = value ?? '';
                              },
                              inputBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).dividerColor,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          default:
                            return TextFieldWidget(
                              label: S.current.detail,
                              validator: checkRequired,
                              onChanged: (value) {
                                certDetail = value;
                              },
                            );
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
          64.h.hSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomOutlinedButton(
                title: S.current.back,
                color: Colors.black,
                onTap: () {
                  widget.onBack.call();
                },
              ),
              16.wSpace,
              CustomOutlinedButton(
                title: S.current.continueWord,
                onTap: () {
                  if (form.currentState!.validate()) {
                    widget.onFinish.call(
                      ExhibitionInfoModel(
                        achivements: achivements
                            .where((element) => element.name.isNotEmpty)
                            .map(
                              (e) => AchivementModel(
                                name: e.name,
                                accomplishment: e.accomplishment,
                              ),
                            )
                            .toList(),
                        skills: skills
                            .where((element) => element.skill.isNotEmpty)
                            .map((e) => SkillModel(
                                  skill: e.skill,
                                  description: e.description,
                                ))
                            .toList(),
                        experiences: experiences
                            .where((element) => element.companyName != null && element.type != null && element.companyName != '')
                            .map(
                              (e) => WorkingExperienceModel(
                                type: e.type!,
                                startDate: e.fromDate,
                                endDate: e.toDate,
                                industry: e.industry ?? '',
                                companyName: e.companyName ?? '',
                                jobTitle: e.title ?? '',
                              ),
                            )
                            .toList(),
                        english: certification == null
                            ? null
                            : EnglishProfiencyModel(
                                certification: certification!,
                                detail: certDetail,
                              ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
