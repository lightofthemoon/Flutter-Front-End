import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'draw_header_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          size: 24.0,
        ),
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
      ),
      backgroundColor: Color(0xff06AB8D),
      title: Text(
        "Home",
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      actions: const [
        Icon(
          Icons.message,
          size: 24.0,
          color: Colors.white,
        ),
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
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          MyDrawerHeader(
            fullName: "Nguyen Trong Quy",
            email: "nguyentrongquy@gmail.com",
            avatarUrl: "assets/icon/avatar.png",
          ),
          ListTile(
            title: Text('Cập nhật thông tin'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Đổi mật khẩu'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Đơn hàng'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Voucher'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Món yêu thích'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Đăng xuất'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
