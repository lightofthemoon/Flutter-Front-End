import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quanlyquantrasua/screens/sign_in/sign_in_screen.dart';
import 'package:quanlyquantrasua/screens/sign_up/signup_screen.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/transition.dart';

import '../api/account_api/account_api.dart';

class AccountsListScreen extends StatelessWidget {
  AccountsListScreen({super.key});
  final controller = Get.put(AccountApi());
  @override
  Widget build(BuildContext context) {
    controller.getAllAccounts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
        actions: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                height: 35,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    slideinTransition(context, const SignInScreen());
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.login),
                      SizedBox(width: 5.0),
                      Text("Đăng nhập"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Obx(() {
        if (controller.listaccounts.value != null) {
          return RefreshIndicator(
            onRefresh: controller.getAllAccounts,
            child: ListView.builder(
              itemCount: controller.listaccounts.value!.length,
              itemBuilder: (context, index) {
                final account = controller.listaccounts.value![index];

                return ListTile(
                  title: Text(account.username ?? ''),
                  subtitle: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            Image.network('${account.imageUrl}').image,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('Quyền: ${account.accounttypeid}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text(account.email ?? ''),
                            ],
                          ),
                          Row(
                            children: [
                              account.birthday != null
                                  ? Text(DateFormat('dd/MM/yyyy')
                                      .format(account.birthday!.toLocal()))
                                  : const Text('Chưa cập nhật'),
                            ],
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     account.birthday != null
                      //         ? Text(DateFormat('dd/MM/yyyy')
                      //             .format(account.birthday!).t)
                      //         : const Text('Chưa cập nhật'),
                      //   ],
                      // ),
                    ],
                  ),
                  trailing: Text(account.phoneNumber ?? ''),
                );
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 15),
        margin: const EdgeInsets.symmetric(horizontal: 70),
        child: FloatingActionButton(
          onPressed: () {
            slideinTransition(context, const SignUpScreen());
          },
          backgroundColor: Colors.blue,
          shape: const StadiumBorder(),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add),
              SizedBox(width: 5.0),
              Text("Tạo tài khoản mới"),
            ],
          ),
        ),
      ),
    );
  }
}
