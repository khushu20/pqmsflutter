class SplashModel {
  bool? success;
  String? statusMessage;
  int? statusCode;
  Data? data;
  bool? paginated;

  SplashModel(
      {this.success,
      this.statusMessage,
      this.statusCode,
      this.data,
      this.paginated});

  SplashModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusMessage = json['status_Message'];
    statusCode = json['status_Code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    paginated = json['paginated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_Message'] = this.statusMessage;
    data['status_Code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['paginated'] = this.paginated;
    return data;
  }
}

class Data {
  String? appName;
  Null? webServiceName;
  String? versionNo;
  String? lastUpdatedDate;
  int? maxTimeChk;

  Data(
      {this.appName,
      this.webServiceName,
      this.versionNo,
      this.lastUpdatedDate,
      this.maxTimeChk});

  Data.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    webServiceName = json['webServiceName'];
    versionNo = json['versionNo'];
    lastUpdatedDate = json['lastUpdatedDate'];
    maxTimeChk = json['maxTimeChk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    data['webServiceName'] = this.webServiceName;
    data['versionNo'] = this.versionNo;
    data['lastUpdatedDate'] = this.lastUpdatedDate;
    data['maxTimeChk'] = this.maxTimeChk;
    return data;
  }
}