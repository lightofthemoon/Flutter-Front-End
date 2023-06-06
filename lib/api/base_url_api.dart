<<<<<<< HEAD:lib/api/base_url_api.dart
// ignore_for_file: file_names

class ApiUrl {
  static const baseUrl = 'http://192.168.1.44:7071/api/';
=======
class ApiUrl {
  static const baseUrl = 'http://10.10.116.60:7071/api/';
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983:lib/api/base-url-api.dart

  static const apiGetAllAccount = '${baseUrl}accounts/all';

  ///// Api của Đạt-------------------------------------------------
  static const apiCreateAccount = '${baseUrl}accounts';
  static const apiCreateCategory = '${baseUrl}user/id/';
  ///// Api của Tính
  static const apiGetAllCategory = '${baseUrl}categories/list';

  static const apiGetAllProduct = '${baseUrl}product/list';

  //// Api của Quý
  static const apiLogin = '${baseUrl}accounts/login';

  ///
  ///
  ///
  ///
  ///
  ///
}
