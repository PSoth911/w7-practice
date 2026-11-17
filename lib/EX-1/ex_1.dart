import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool isSelected = false;
  
  void onSelect() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  Color get backgroundColor {
    return isSelected ? Colors.blue : const Color.fromARGB(255, 169, 226, 255);
  }

  Color get textColor {
    return isSelected ? Colors.white : Colors.black;
  }

  String get buttonText {
    return isSelected ? "Selected" : "Not Selected";
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: onSelect,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
        ),
        child: Center(child: Text(buttonText)),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(child: SelectButton()),
    ),
  ),
);
