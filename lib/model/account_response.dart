class AccountResponse {
  int? accountId;
  String? imageEncode;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? gender;
  String? birthday;
  String? address;
  int? accountTypeId;
  String? status;

  AccountResponse(
      {this.accountId,
      this.fullName,
      this.phoneNumber,
      this.imageEncode,
      this.email,
      this.gender,
      this.birthday,
      this.address,
      this.accountTypeId,
      this.status});

  AccountResponse.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    fullName = json['fullName'];
    imageEncode = phoneNumber = json['phoneNumber'];
    email = json['email'];
    gender = json['gender'];
    birthday = json['birthday'];
    address = json['address'];
    accountTypeId = json['accountTypeId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountId'] = accountId;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['gender'] = gender;
    data['birthday'] = birthday;
    data['address'] = address;
    data['accountTypeId'] = accountTypeId;
    data['status'] = status;
    return data;
  }
}
