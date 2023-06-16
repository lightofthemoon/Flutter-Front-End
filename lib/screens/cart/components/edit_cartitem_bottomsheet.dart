import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanlyquantrasua/model/cart_model.dart';
import 'package:quanlyquantrasua/screens/product-detail/components/size_choices.dart';

class EditCartItemBottomSheet extends StatefulWidget {
  const EditCartItemBottomSheet({super.key, required this.cartItem});
  final CartItem cartItem;
  @override
  State<EditCartItemBottomSheet> createState() =>
      _EditCartItemBottomSheetState();
}

class _EditCartItemBottomSheetState extends State<EditCartItemBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.6,
      child: Column(children: [
        Stack(children: [
          SizedBox(
            height: 50,
            child: Center(
              child: Text(
                '${widget.cartItem.dish.dishName}',
                style: GoogleFonts.nunito(fontSize: 18),
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                child: GestureDetector(
                    onTap: () {}, child: Icon(CupertinoIcons.xmark)),
              ))
        ]),
        const Divider(
          thickness: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: [
              Text(
                'Size',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizeRadioChosen(item: widget.cartItem.size),
      ]),
    );
  }
}
