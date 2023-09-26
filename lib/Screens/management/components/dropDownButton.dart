import 'package:flutter/material.dart';

class DropButton extends StatefulWidget {
  const DropButton({super.key, required this.dropOption});
  final List<String> dropOption;
  @override
  State<DropButton> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropButton> {
  String dropdownValue = 'Class VI';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: const EdgeInsets.only(top: 5, right: 20),
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down_rounded),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          items:
              widget.dropOption.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
