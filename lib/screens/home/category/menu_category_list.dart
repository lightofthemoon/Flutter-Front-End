import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/list_data.dart';

class MenuCategoryList extends StatelessWidget {
  const MenuCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: SizedBox(
          height: 80.0,
          child: ListView.builder(
            itemCount: ListDataTemp.menuCategory.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var item = ListDataTemp.menuCategory[index];
              return Container(
                margin: const EdgeInsets.only(
                  left: 28.27,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "${item['image']}",
                        width: 42.0,
                        height: 42.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 6.74,
                    ),
                    Text(
                      "${item['name']}",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
