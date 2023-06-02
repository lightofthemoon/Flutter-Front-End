import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanlyquantrasua/api/account_api/account_api.dart';
import 'package:quanlyquantrasua/screens/sign_in/sign_in_screen.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/transition.dart';

import 'draw_header_bar.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final controller = Get.find<AccountController>();
  CustomHomeAppBar({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Obx(() {
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
          return IconButton(
            icon: const Icon(
              Icons.menu,
              size: 24.0,
            ),
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
          );
        }
      }),
      backgroundColor: const Color(0xff06AB8D),
      title: Text(
        "Home",
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      actions: [
        const Icon(
          Icons.message,
          size: 24.0,
          color: Colors.white,
        ),
        const SizedBox(
          width: 23.0,
        ),
        Stack(
          children: const [
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
        const SizedBox(
          width: 23.0,
        ),
        Stack(
          children: const [
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
        const SizedBox(
          width: 23.0,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget buildDrawer(BuildContext context) {
    final accounts = controller.accountRespone.value;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          MyDrawerHeader(
            fullName: '${accounts?.fullName}',
            email: '${accounts?.email}',
            avatarUrl: '${accounts?.birthday}',
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
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}