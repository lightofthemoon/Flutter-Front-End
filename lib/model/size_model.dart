// ignore_for_file: non_constant_identifier_names

class SizeModel {
  int? sizeID;
  String? sizeName;

  SizeModel({
    this.sizeID,
    this.sizeName,
  });
  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(
      sizeID: json['sizeID'],
      sizeName: json['sizeName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sizeID': sizeID,
      'sizeName': sizeName,
    };
  }
}
