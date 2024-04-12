import 'package:flutter/material.dart';

class CommonDropDown extends StatefulWidget {
  const CommonDropDown({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.textLable,
  });

  final String selectedValue;
  final String textLable;
  final List<String> items;
  final Function(String?) onChanged;

  @override
  _CommonDropDownState createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    return Column(
        // colum to input text field lable and text fieild
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // [abe; text]
          Text(
            widget.textLable,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(height: 5),
          Container(
            width: mediaqueryWidth * .8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 231, 230, 230),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButton<String>(
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                // Value to display initially
                value: widget.selectedValue,
                // Dropdown items
                items: widget.items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                // Dropdown onChanged callback
                onChanged: (String? value) {
                  setState(() {
                    // Call the onChanged callback to pass the selected value to the parent widget
                    widget.onChanged(value);
                  });
                },
                // Dropdown hint text
                hint: const Text('Select an item'),
              ),
            ),
          )
        ]);
    // Input text field
  }
}
