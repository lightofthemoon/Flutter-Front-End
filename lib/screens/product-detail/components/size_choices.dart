import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlyquantrasua/api/size/api_size.dart';

class SizesChoice extends StatefulWidget {
  const SizesChoice({Key? key, required this.onSizeSelected}) : super(key: key);
  final Function(String) onSizeSelected;
  @override
  SizesChoiceState createState() => SizesChoiceState();
}

class SizesChoiceState extends State<SizesChoice> {
  final sizeController = Get.find<SizeApi>();
  String _selectedSize = 'S';
  @override
  void initState() {
    super.initState();
    sizeController.getAllSize();
  }

  void _selectSize(String sizeName) {
    setState(() {
      _selectedSize = sizeName;
    });
    widget.onSizeSelected(sizeName);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: sizeController.listSize.map((size) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () => _selectSize(size.sizeName ?? ''),
            child: Container(
              decoration: BoxDecoration(
                color: _selectedSize == size.sizeName
                    ? Colors.black
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "${size.sizeName}",
                style: TextStyle(
                  color: _selectedSize == size.sizeName
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
