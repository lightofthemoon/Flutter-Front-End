import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanlyquantrasua/api/account_api/account_api.dart';
import 'package:quanlyquantrasua/controller/account_controller.dart';

import 'package:quanlyquantrasua/screens/home/home_screens.dart';
import 'package:quanlyquantrasua/screens/sign_in/sign_in_screen.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/transition.dart';

import 'draw_header_bar.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final controller = Get.find<AccountApi>();
  CustomHomeAppBar({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Obx(() {
          if (controller.accountRespone.value == null) {
            return Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: Image.asset(
                    'assets/images/profile.png',
                    scale: 1,
                  ).image,
                  fit: BoxFit.fill,
                ),
              ),
              child: InkWell(
                onTap: () {
                  slideinTransition(context, const SignInScreen());
                },
              ),
            );
          } else {
            String? imageUrl = controller.accountRespone.value?.imageUrl;
            return GestureDetector(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: imageUrl != null
                  ? Image.network(
                      imageUrl,
                    )
                  : Image.asset(
                      'assets/images/profile.png',
                    ),
            );
          }
        }),
      ),
      backgroundColor: const Color(0xff06AB8D),
      title: Text(
        "Home",
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      actions: const [
        SizedBox(
          width: 23.0,
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.notifications_outlined,
                size: 30.0,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 8,
              right: 0,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.red,
                child: Text(
                  "2",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 23.0,
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 30.0,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 8,
              right: 0,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.red,
                child: Text(
                  "2",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 23.0,
        ),
        SizedBox(
          width: 23.0,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget buildDrawer(BuildContext context) {
    return Obx(() {
      if (controller.accountRespone.value != null) {
        final accounts = controller.accountRespone.value;
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              MyDrawerHeader(
                fullName: '${accounts?.fullName}',
                email: '${accounts?.email}',
                avatarUrl: '${accounts?.imageUrl}',
              ),
              ListTile(
                title: const Text('Cập nhật thông tin'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Đổi mật khẩu'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Đơn hàng'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Voucher'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Món yêu thích'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Đăng xuất'),
                onTap: () {
                  AccountController().logout();
                  Navigator.pop(context);
                  slideinTransitionNoBack(context, const HomeScreenView());
                },
              ),
            ],
          ),
        );
      } else {
        controller.fetchCurrent();
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
