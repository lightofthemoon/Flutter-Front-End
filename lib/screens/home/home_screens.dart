import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlyquantrasua/api/account_api/account_api.dart';

import '../../api/category/api_category.dart';
import 'components/home_appbar.dart';
import 'components/listproduct_container.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenViewState extends State<HomeScreenView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.put(AccountApi());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      ////////////////MENU NAVIGATION BAR BEN TRAI O DAY//////////////
      appBar: CustomHomeAppBar(scaffoldKey: scaffoldKey),
      endDrawer:
          CustomHomeAppBar(scaffoldKey: scaffoldKey).buildDrawer(context),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 129.0,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xff06AB8D),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24.3),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 24.0,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 15.39,
                            height: 20,
                          ),
                          Text(
                            "33/39 Vạn Kiếp, Bình Thạnh, TP.HCM",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              fontSize: 14.5,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.23,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 12.0,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey[400]!,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 21.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              initialValue: null,
                              decoration: InputDecoration.collapsed(
                                filled: true,
                                fillColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                hintText: "Tìm kiếm sản phẩm",
                                hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: const Color(0xff5F6E7C),
                                ),
                              ),
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.search),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Column(
                children: [
                  SizedBox(height: 10),
                  GroceryContainer(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
