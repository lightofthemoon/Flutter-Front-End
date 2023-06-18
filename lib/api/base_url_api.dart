class ApiUrl {
  static const baseUrl = 'http://192.168.1.44:7071/api/';

  static const apiGetAllAccount = '${baseUrl}accounts/all';

  ///// Api của Đạt-------------------------------------------------
  static const apiCreateAccount = '${baseUrl}accounts';
  static const apiSendOTP = '${baseUrl}accounts/otp';
  static const apiChangePassword = '${baseUrl}accounts/changepassword';
  static const apiGetDishesByCategory = '${baseUrl}dish/getByCategory';
  // static const apiCreateCategory = '${baseUrl}user/id/';
  ///// Api của Tính
  static const apiGetAllCategory = '${baseUrl}categories';
  static const apiGetAllSize = '${baseUrl}size';
  static const apiGetAllProduct = '${baseUrl}dish';

  //// Api của Quý
  static const apiLogin = '${baseUrl}accounts/login';
  static const apiGetAllToppings = '${baseUrl}topping';
  static const apiCreateOrder = '${baseUrl}orders';
  static const apiUpdateAccount = '${baseUrl}accounts/update';

  ///
  ///
  ///
  ///
  ///
}
