import 'package:flutter/material.dart';

import 'screens/admin/profile_screens/admin_settings.dart';
import 'screens/customer/profile_screens/customer_settings.dart';
import 'screens/delivery/profile_screens/delivery_settings.dart';

// ngôn ngữ tiếng Việt

void main() async {
  runApp(MaterialApp(
    initialRoute: 'delivery_settings',
    debugShowCheckedModeBanner: false,
    routes: {
      'customer_settings': (context) => const CustomerSettingProfile(),
      'delivery_settings': (context) => const DeliverySettingProfile(),
      'admin_settings': (context) => const AdminSettingProfile(),
    },
  ));
}
