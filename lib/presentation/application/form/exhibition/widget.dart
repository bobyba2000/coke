import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/validator.dart';
import 'package:coke_platform/common/widget/button/outlined.dart';
import 'package:coke_platform/common/widget/field/auto_complete_widget.dart';
import 'package:coke_platform/common/widget/field/custom_dropdown.dart';
import 'package:coke_platform/common/widget/field/datepicker_widget.dart';
import 'package:coke_platform/common/widget/field/textfield_widget.dart';
import 'package:coke_platform/constants/others.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/exhibition/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WordCountInputFormatter extends TextInputFormatter {
  final int maxWords;

  WordCountInputFormatter({required this.maxWords});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final words = newValue.text.trim().split(RegExp(r'\s+'));

    if (words.length <= maxWords) {
      return newValue;
    }

    return oldValue;
  }
}

class SkillViewModel {
  Skill? skill;
  String description = '';
}

class CompetionViewModel {
  String name = '';
  String accomplishment = '';
}

class WorkingExperienceViewModel {
  WorkingType? type;
  CompanyIndustry? industry;
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

  final companies = [...OthersConstant.companies];

  List<SkillViewModel> skills = [
    SkillViewModel(),
  ];

  List<CompetionViewModel> achivements = [
    CompetionViewModel(),
  ];

  List<WorkingExperienceViewModel> experiences = [
    WorkingExperienceViewModel(),
  ];

  final cambridgeDetails = ['KET', 'PET', 'PEC', 'PCE', 'CAE', 'CPE'];

  final cefrDetails = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2'];

  EnglistCertification? certification;
  String certDetail = '';
  final form = GlobalKey<FormState>();

  @override
  void initState() {
    competitions.sort();
    companies.sort();
    super.initState();
  }

  int _countWords(String text) {
    final words = text.trim().split(RegExp(r'\s+'));
    return words.length;
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
              ...skills.asMap().entries.map(
                (e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${S.current.skill} ${e.key + 1}',
                              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Visibility(
                              visible: skills.length > 1,
                              child: TextButton(
                                onPressed: () {
                                  skills.remove(e.value);
                                  setState(() {});
                                },
                                child: Text(
                                  S.current.delete,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomDropdown(
                                label: S.current.skillSelection,
                                items: Skill.values,
                                value: e.value.skill,
                                getItems: () {
                                  final previousSkills = skills.map((element) => element.skill).toList();
                                  previousSkills.removeAt(e.key);
                                  final selectableSkills = Skill.values
                                      .where(
                                        (value) => !previousSkills.contains(value),
                                      )
                                      .toList();
                                  return selectableSkills;
                                },
                                onSelect: (value) {
                                  e.value.skill = value;
                                },
                                required: true,
                                validator: checkRequired,
                              ),
                            ),
                            16.wSpace,
                            Expanded(
                              child: TextFieldWidget(
                                initText: e.value.description,
                                required: true,
                                label: S.current.skillDemonstration,
                                maxWords: 120,
                                inputFormatters: [
                                  WordCountInputFormatter(maxWords: 120),
                                ],
                                onChanged: (value) {
                                  e.value.description = value;
                                },
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return S.current.inputRequired;
                                  }

                                  if (_countWords(value) > 120) {
                                    return S.current.exceed120Words;
                                  }

                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              8.hSpace,
              if (skills.length < OthersConstant.maxSkillCount)
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
              ...achivements.asMap().entries.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${S.current.achivement} ${e.key + 1}',
                                style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Visibility(
                                visible: achivements.length > 1,
                                child: TextButton(
                                  onPressed: () {
                                    achivements.remove(e.value);
                                    setState(() {});
                                  },
                                  child: Text(
                                    S.current.delete,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
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
                                    e.value.name = value;
                                  },
                                  onTapItem: (value) {
                                    e.value.name = value;
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
                                    e.value.accomplishment = value;
                                  },
                                  onTapItem: (value) {
                                    e.value.accomplishment = value;
                                  },
                                  label: S.current.accomplishment,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              8.hSpace,
              if (achivements.length < OthersConstant.maxAchivementCount)
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
                          Row(
                            children: [
                              Text(
                                '${S.current.job} ${e.key + 1}',
                                style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Visibility(
                                visible: experiences.length > 1,
                                child: TextButton(
                                  onPressed: () {
                                    experiences.remove(e.value);
                                    setState(() {});
                                  },
                                  child: Text(
                                    S.current.delete,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomDropdown(
                                  value: e.value.type,
                                  items: WorkingType.values,
                                  onSelect: (value) {
                                    e.value.type = value;
                                  },
                                  required: false,
                                  label: S.current.workingType,
                                ),
                              ),
                              16.wSpace,
                              Expanded(
                                child: CustomDropdown(
                                  value: e.value.industry,
                                  items: CompanyIndustry.values,
                                  onSelect: (value) {
                                    e.value.industry = value;
                                  },
                                  required: false,
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
              if (experiences.length < OthersConstant.maxExperiencesCount)
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
              8.hSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomDropdown(
                      maxHeight: 200,
                      label: '',
                      items: EnglistCertification.values,
                      value: certification,
                      onSelect: (value) {
                        certification = value;
                        certDetail = '';
                        Future.delayed(const Duration(milliseconds: 400), () {
                          setState(() {});
                        });
                      },
                      required: true,
                      validator: checkRequired,
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
                            return CustomDropdown(
                              items: cambridgeDetails,
                              label: S.current.detail,
                              maxHeight: 150,
                              value: certDetail,
                              onSelect: (value) {
                                certDetail = value ?? '';
                              },
                              required: true,
                              validator: checkRequired,
                            );

                          case EnglistCertification.cefr:
                            return CustomDropdown(
                              value: certDetail,
                              items: cefrDetails,
                              label: S.current.detail,
                              maxHeight: 150,
                              onSelect: (value) {
                                certDetail = value ?? '';
                              },
                              required: true,
                              validator: checkRequired,
                            );
                          default:
                            return TextFieldWidget(
                              label: S.current.detail,
                              validator: checkRequired,
                              required: true,
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
                            .where((element) => element.skill != null)
                            .map((e) => SkillModel(
                                  skill: e.skill!,
                                  description: e.description,
                                ))
                            .toList(),
                        experiences: experiences
                            .where((element) =>
                                element.companyName != null && element.type != null && element.companyName != '' && element.industry != null)
                            .map(
                              (e) => WorkingExperienceModel(
                                type: e.type!,
                                startDate: e.fromDate,
                                endDate: e.toDate,
                                industry: e.industry!,
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
