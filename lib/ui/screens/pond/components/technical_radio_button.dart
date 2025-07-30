import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TechnicalRadioButton extends StatefulWidget {
  TechnicalRadioButton({super.key, required this.title});
  String title;

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
                value: 'yes',
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              const Text('Yes'),
              Gap(10),
              Radio<String>(
                value: 'no',
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
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
