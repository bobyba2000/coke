import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/model.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

enum ColumnTitle {
  name,
  yearOfBirth,
  email,
  phoneNumber,
  hometown,
  currentLocation,
  educationLevel,
  university,
  major,
  gpa,
  graduationYear,
  desiredPathway,
  availability,
  english,
  resume;

  @override
  String toString() {
    switch (this) {
      case name:
        return 'Name';
      case yearOfBirth:
        return 'Year of Birth';
      case email:
        return 'Email';
      case phoneNumber:
        return 'Phone Number';
      case hometown:
        return 'Hometown';
      case currentLocation:
        return 'Current Location';
      case educationLevel:
        return 'Education Level';
      case university:
        return 'University';
      case major:
        return 'Major';
      case gpa:
        return 'GPA';
      case graduationYear:
        return 'Graduation Year';
      case desiredPathway:
        return 'Desired Pathway';
      case availability:
        return 'Availability';
      case english:
        return 'English Proficiency';
      case resume:
        return 'Resume';
    }
  }

  double get width {
    switch (this) {
      case ColumnTitle.name:
        return 200.wMax;
      case ColumnTitle.yearOfBirth:
        return 150.wMax;
      case ColumnTitle.email:
        return 200.wMax;
      case ColumnTitle.phoneNumber:
        return 150.wMax;
      case ColumnTitle.hometown:
        return 300.wMax;
      case ColumnTitle.currentLocation:
        return 300.wMax;
      case ColumnTitle.educationLevel:
        return 200.wMax;
      case ColumnTitle.university:
        return 400.wMax;
      case ColumnTitle.major:
        return 400.wMax;
      case ColumnTitle.gpa:
        return 80.wMax;
      case ColumnTitle.graduationYear:
        return 150.wMax;
      case ColumnTitle.desiredPathway:
        return 200.wMax;
      case ColumnTitle.availability:
        return 350.wMax;
      case ColumnTitle.english:
        return 200.wMax;
      case ColumnTitle.resume:
        return 80.wMax;
    }
  }
}

class ListContestantTable extends StatefulWidget {
  final List<ContestantModel> contestants;
  const ListContestantTable({
    super.key,
    required this.contestants,
  });

  @override
  State<ListContestantTable> createState() => _ListContestantTableState();
}

class _ListContestantTableState extends State<ListContestantTable> {
  List<ColumnTitle> titles = ColumnTitle.values;
  final sizePerPage = 10;
  int totalPages = 1;
  int currentPage = 0;

  @override
  void initState() {
    totalPages = (widget.contestants.length / sizePerPage).ceil();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final start = (currentPage) * sizePerPage;
    final end = (currentPage + 1) * sizePerPage > widget.contestants.length ? widget.contestants.length : (currentPage + 1) * sizePerPage;
    int fromPage = currentPage - 1;
    int toPage = fromPage + 4;
    if (toPage > totalPages - 1) {
      fromPage = totalPages - 4;
      toPage = totalPages - 1;
    }
    if (fromPage < 0) {
      fromPage = 0;
      toPage = totalPages > 4 ? 4 : totalPages;
    }
    final viewContestants = widget.contestants.sublist(currentPage * sizePerPage, end);
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: titles
                      .map(
                        (e) => TableCellWidget(
                          value: e.toString(),
                          isTitle: true,
                          width: e.width,
                        ),
                      )
                      .toList(),
                ),
                ...viewContestants.asMap().entries.map(
                      (e) => TableRowWidget(
                        contestant: e.value,
                        titles: titles,
                        index: currentPage * sizePerPage + e.key,
                      ),
                    ),
              ],
            ),
          ),
          8.hSpace,
          Row(
            children: [
              Text(
                sprintf(S.current.showTotalCV, [
                  (start + 1).toString(),
                  end.toString(),
                  widget.contestants.length.toString(),
                ]),
                style: theme.textTheme.bodyMedium,
              ),
              24.wSpace,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(
                    toPage - fromPage + 1,
                    (value) {
                      final index = value + fromPage;
                      final isSelected = index == currentPage;
                      return InkWell(
                        onTap: () {
                          if (!isSelected) {
                            setState(() {
                              currentPage = index;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: !isSelected
                                ? Border.all(
                                    color: theme.dividerColor,
                                  )
                                : null,
                            color: isSelected ? theme.colorScheme.primary : null,
                          ),
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected ? theme.colorScheme.onPrimary : null,
                              fontWeight: isSelected ? FontWeight.bold : null,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TableRowWidget extends StatefulWidget {
  final ContestantModel contestant;
  final List<ColumnTitle> titles;
  final int index;
  const TableRowWidget({
    super.key,
    required this.contestant,
    required this.titles,
    required this.index,
  });

  @override
  State<TableRowWidget> createState() => _TableRowWidgetState();
}

class _TableRowWidgetState extends State<TableRowWidget> {
  bool isHover = false;
  String cellValue(ColumnTitle title) {
    final contestant = widget.contestant;
    switch (title) {
      case ColumnTitle.name:
        return contestant.personalInfo.fullName;
      case ColumnTitle.yearOfBirth:
        return contestant.personalInfo.yearOfBirth.toString();
      case ColumnTitle.email:
        return contestant.personalInfo.email;
      case ColumnTitle.phoneNumber:
        return contestant.personalInfo.phoneNo;
      case ColumnTitle.hometown:
        return contestant.personalInfo.hometown;
      case ColumnTitle.currentLocation:
        return contestant.personalInfo.currentLocation;
      case ColumnTitle.educationLevel:
        return contestant.educationInfo.education.toString();
      case ColumnTitle.university:
        return contestant.educationInfo.university;
      case ColumnTitle.major:
        return contestant.educationInfo.major;
      case ColumnTitle.gpa:
        return contestant.educationInfo.gpa.toString();
      case ColumnTitle.graduationYear:
        return contestant.educationInfo.graduationYear.toString();
      case ColumnTitle.desiredPathway:
        return contestant.careerInfo.desiredPathway.role.toString();
      case ColumnTitle.availability:
        return '${contestant.careerInfo.availability.type} ${contestant.careerInfo.availability.note}';
      case ColumnTitle.english:
        return '${contestant.exhibition.english.certification} - ${contestant.exhibition.english.detail}';
      case ColumnTitle.resume:
        return contestant.attachment.resumeCV;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isHover
              ? theme.primaryColor.withOpacity(0.3)
              : widget.index % 2 == 0
                  ? const Color(0xFFf7f7f7)
                  : Colors.white,
        ),
        child: Row(
          children: List.generate(widget.titles.length, (index) {
            final value = cellValue(widget.titles[index]);
            final width = widget.titles[index].width;
            return TableCellWidget(
              value: value,
              isTitle: false,
              width: width,
            );
          }),
        ),
      ),
    );
  }
}

class TableCellWidget extends StatelessWidget {
  final String value;
  final bool isTitle;
  final double width;
  const TableCellWidget({
    super.key,
    required this.value,
    required this.isTitle,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
      ),
      padding: EdgeInsets.symmetric(vertical: 6.hMax, horizontal: 12.wMax),
      child: Text(
        value,
        style: textTheme.bodyMedium?.copyWith(
          fontWeight: isTitle ? FontWeight.bold : null,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
