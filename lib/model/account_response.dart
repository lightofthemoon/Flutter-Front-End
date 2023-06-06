class AccountResponse {
  int? accountId;
<<<<<<< HEAD
  String? imageUrl;
=======
  String? imageEncode;
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983
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
<<<<<<< HEAD
      this.imageUrl,
=======
      this.imageEncode,
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983
      this.email,
      this.gender,
      this.birthday,
      this.address,
      this.accountTypeId,
      this.status});

  AccountResponse.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    fullName = json['fullName'];
<<<<<<< HEAD
    imageUrl = json['imageUrl'];
    phoneNumber = json['phoneNumber'];
=======
    imageEncode = phoneNumber = json['phoneNumber'];
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983
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
    data['imageUrl'] = imageUrl;
    data['email'] = email;
    data['gender'] = gender;
    data['birthday'] = birthday;
    data['address'] = address;
    data['accountTypeId'] = accountTypeId;
    data['status'] = status;
    return data;
  }
}
