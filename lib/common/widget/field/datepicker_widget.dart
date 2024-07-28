import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'textfield_widget.dart';

class DatePickerWidget extends StatefulWidget {
  final ValueChanged<DateTime>? onChanged;
  final String? label;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final EdgeInsets? padding;
  final TextStyle? labelStyle;
  final bool? readOnly;
  final bool required;
  final TextStyle? textStyle;
  final DateTime? initDate;
  final InputBorder? border;
  final TextAlign? textAlign;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? dateFormat;
  const DatePickerWidget({
    Key? key,
    this.onChanged,
    this.label,
    this.hintText,
    this.validator,
    this.padding,
    this.labelStyle,
    this.readOnly,
    this.required = false,
    this.textStyle,
    this.border,
    this.textAlign,
    this.initDate,
    this.firstDate,
    this.lastDate,
    this.dateFormat,
  }) : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime? selectedDate;
  final TextEditingController dateText = TextEditingController();

  @override
  void initState() {
    selectedDate = widget.initDate;
    dateText.text = selectedDate != null ? convertDateToString(selectedDate!) : '';
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DatePickerWidget oldWidget) {
    if (!isSameDay(widget.initDate, oldWidget.initDate)) {
      selectedDate = widget.initDate ?? selectedDate;
      dateText.text = selectedDate != null ? convertDateToString(selectedDate!) : '';
    }
    super.didUpdateWidget(oldWidget);
  }

  String convertDateToString(DateTime date) {
    if (widget.dateFormat != null) {
      return DateFormat(widget.dateFormat).format(date);
    }
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      inputController: dateText,
      onTap: () {
        if (widget.readOnly == true) {
          return;
        }
        showDatePicker(
          initialDate: selectedDate ?? DateTime.now(),
          context: context,
          firstDate: widget.firstDate ?? DateTime(1890),
          lastDate: widget.lastDate ?? DateTime(2100),
        ).then((value) {
          if (value == null) return;
          selectedDate = value;
          dateText.text = convertDateToString(value);
          widget.onChanged?.call(value);
        });
      },
      label: widget.label,
      textAlign: widget.textAlign,
      hintText: widget.hintText,
      required: widget.required,
      border: widget.border,
      readOnly: widget.readOnly ?? true,
      labelStyle: widget.labelStyle,
      validator: widget.validator,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Icon(
          Icons.calendar_today_outlined,
          color: Theme.of(context).primaryColor.withOpacity(0.8),
        ),
      ),
    );
  }
}
