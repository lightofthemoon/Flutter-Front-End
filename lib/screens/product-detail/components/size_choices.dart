import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlyquantrasua/api/size/api_size.dart';
import 'package:quanlyquantrasua/model/size_model.dart';

class SizeChoiceWidget extends StatefulWidget {
  final void Function(SizeModel?) onSizeSelected;

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
        const SizedBox(
          height: 8.0,
        ),
        if (sizeController.listSize != null) ...[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: ListView.builder(
              itemCount: sizeController.listSize!.length,
              itemExtent: 100,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = sizeController.listSize![index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedSize = item.sizeName;
                    });
                    widget.onSizeSelected(item);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: _selectedSize == item.sizeName
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(child: Text(item.sizeName!)),
                  ),
                );
              },
            ),
          ),
        ]
      ],
    );
  }
}
