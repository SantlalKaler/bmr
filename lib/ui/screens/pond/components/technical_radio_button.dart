import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TechnicalRadioButton extends StatefulWidget {
  TechnicalRadioButton(
      {super.key, required this.title, required this.onChanged});
  String title;
  // on change function
  Function(String) onChanged;

  @override
  State<TechnicalRadioButton> createState() => _TechnicalRadioButtonState();
}

class _TechnicalRadioButtonState extends State<TechnicalRadioButton> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          widget.title,
        )),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: "yes",
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                  widget.onChanged("1");
                },
              ),
              const Text('Yes'),
              const Gap(10),
              Radio<String>(
                value: "no",
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                  widget.onChanged("0");
                },
              ),
              const Text('No'),
            ],
          ),
        )
      ],
    );
  }
}
