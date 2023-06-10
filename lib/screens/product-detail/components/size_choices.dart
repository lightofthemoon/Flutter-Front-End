import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlyquantrasua/api/size/api_size.dart';

class SizeChoiceWidget extends StatefulWidget {
  final void Function(String) onSizeSelected;

  const SizeChoiceWidget({Key? key, required this.onSizeSelected})
      : super(key: key);

  @override
  SizeChoiceWidgetState createState() => SizeChoiceWidgetState();
}

class SizeChoiceWidgetState extends State<SizeChoiceWidget> {
  String? _selectedSize = '';
  final sizeController = Get.find<SizeApi>();
  @override
  void initState() {
    super.initState();
    fetchListSize();
  }

  fetchListSize() async {
    await sizeController.getAllSize();
    if (sizeController.listSize != null) {
      _selectedSize = sizeController.listSize?.first.sizeName ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        Row(
          children: [
            if (sizeController.listSize != null) ...[
              for (var size in sizeController.listSize!) ...[
                SizedBox(
                  width: 60,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSize = size.sizeName;
                      });
                      widget.onSizeSelected(size.sizeName!);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: _selectedSize == size.sizeName
                            ? Colors.blue
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(child: Text(size.sizeName!)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ]
            ]
          ],
        ),
      ],
    );
  }
}
