import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlyquantrasua/screens/create_account_screen.dart';
import 'package:quanlyquantrasua/screens/sign_in/sign_in_screen.dart';
import 'package:quanlyquantrasua/screens/sign_up/signUpScreen.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/transition.dart';
import 'package:intl/intl.dart';
import '../api/account_api.dart';

class AccountsListScreen extends StatelessWidget {
  AccountsListScreen({super.key});
  final controller = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    controller.getAllAccounts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
      ),
      body: Obx(() {
        if (controller.accounts.value != null) {
          return RefreshIndicator(
            onRefresh: controller.getAllAccounts,
            child: ListView.builder(
              itemCount: controller.accounts.value!.length,
              itemBuilder: (context, index) {
                final account = controller.accounts.value![index];

                return ListTile(
                  title: Text(account.username ?? ''),
                  subtitle: Column(
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
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
