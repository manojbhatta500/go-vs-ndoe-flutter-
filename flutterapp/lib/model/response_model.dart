class ResponseModel {
  String? message;
  String? processingTime;

  ResponseModel({this.message, this.processingTime});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    processingTime = json['processingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['processingTime'] = this.processingTime;
    return data;
  }
}
