import 'package:flutter/material.dart';

import '../../configs/mediaquery.dart';

class BirthdayDatePickerWidget extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onChanged;

  BirthdayDatePickerWidget({this.initialDate, this.onChanged});

  @override
  _BirthdayDatePickerWidgetState createState() =>
      _BirthdayDatePickerWidgetState();
}

class _BirthdayDatePickerWidgetState extends State<BirthdayDatePickerWidget> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: mediaWidth(context, 30)),
            child: Container(
              height: screenRotate(context)
                  ? mediaHeight(context, 18)
                  : mediaHeight(context, 9),
              padding: EdgeInsets.only(
                  left: mediaWidth(context, 16),
                  right: mediaWidth(context, 16)),
              child: ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${_selectedDate?.day ?? "Ngày"}/${_selectedDate?.month ?? "Tháng"}/${_selectedDate?.year ?? "Năm"}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.green,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: const ColorScheme.light(primary: Colors.green)
                .copyWith(secondary: Colors.green),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.onChanged!(picked);
      });
    }
  }
}
