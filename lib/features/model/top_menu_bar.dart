class CompanyInfo {
  int? status;
  Data? data;
  String? message;

  CompanyInfo({this.status, this.data, this.message});

  CompanyInfo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  Company? company;

  Data({this.company});

  Data.fromJson(Map<String, dynamic> json) {
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    return data;
  }
}

class Company {
  String? name;
  String? baseUrl;
  String? primaryColor;
  String? secondaryColor;
  String? splashLogo;
  String? splashName;
  String? splashTitle;
  String? companyLogo;

  Company(
      {this.name,
        this.baseUrl,
        this.primaryColor,
        this.secondaryColor,
        this.splashLogo,
        this.splashName,
        this.splashTitle,
        this.companyLogo});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    baseUrl = json['base_url'];
    primaryColor = json['primary_color'];
    secondaryColor = json['secondary_color'];
    splashLogo = json['splash_logo'];
    splashName = json['splash_name'];
    splashTitle = json['splash_title'];
    companyLogo = json['company_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['base_url'] = this.baseUrl;
    data['primary_color'] = this.primaryColor;
    data['secondary_color'] = this.secondaryColor;
    data['splash_logo'] = this.splashLogo;
    data['splash_name'] = this.splashName;
    data['splash_title'] = this.splashTitle;
    data['company_logo'] = this.companyLogo;
    return data;
  }
}