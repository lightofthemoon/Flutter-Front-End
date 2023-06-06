import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanlyquantrasua/api/account_api/account_api.dart';
<<<<<<< HEAD:lib/screens/home/components/home_appbar.dart

import 'package:quanlyquantrasua/screens/home/home_screens.dart';
=======
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983:lib/screens/home/product/home_appbar.dart
import 'package:quanlyquantrasua/screens/sign_in/sign_in_screen.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/transition.dart';

import 'draw_header_bar.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
<<<<<<< HEAD:lib/screens/home/components/home_appbar.dart
  final controller = Get.find<AccountApi>();
=======
  final controller = Get.find<AccountController>();
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983:lib/screens/home/product/home_appbar.dart
  CustomHomeAppBar({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
<<<<<<< HEAD:lib/screens/home/components/home_appbar.dart
      leading: GestureDetector(
          onTap: () => slideinTransition(context, const HomeScreenView()),
          child: const Icon(
            Icons.home_outlined,
            color: Color.fromARGB(255, 229, 199, 111),
            size: 30,
          )),
=======
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
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983:lib/screens/home/product/home_appbar.dart
      backgroundColor: const Color(0xff06AB8D),
      title: Text(
        "Home",
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      actions: [
<<<<<<< HEAD:lib/screens/home/components/home_appbar.dart
        const SizedBox(
          width: 23.0,
        ),
        const Stack(
          children: [
=======
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
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983:lib/screens/home/product/home_appbar.dart
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
<<<<<<< HEAD:lib/screens/home/components/home_appbar.dart
        const Stack(
          children: [
=======
        Stack(
          children: const [
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983:lib/screens/home/product/home_appbar.dart
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
<<<<<<< HEAD:lib/screens/home/components/home_appbar.dart
        SizedBox(
          width: 45,
          child: Obx(() {
            final userInfo = controller.accountRespone.value;
            if (userInfo == null) {
              return Container(
                width: 45,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: Image.asset(
                      'assets/images/profile.png',
                      scale: 1,
                    ).image,
                    fit: BoxFit.fill,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    slideinTransition(context, const SignInScreen());
                  },
                ),
              );
            } else {
              String? imageUrl = controller.accountRespone.value?.imageUrl;
              return Container(
                width: 45,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageUrl != null
                        ? Image.network(
                            imageUrl,
                          ).image
                        : Image.asset(
                            'assets/images/profile.png',
                          ).image,
                    fit: BoxFit.fill,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              );
            }
          }),
        ),
        const SizedBox(
          width: 23.0,
        ),
=======
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983:lib/screens/home/product/home_appbar.dart
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget buildDrawer(BuildContext context) {
<<<<<<< HEAD:lib/screens/home/components/home_appbar.dart
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
                  controller.logout();
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
=======
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
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983:lib/screens/home/product/home_appbar.dart
  }
}
