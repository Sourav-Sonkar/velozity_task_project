class LoginResponse {
  User? user;
  bool? isLoggedIn;
  String? authToken;

  LoginResponse({this.user, this.isLoggedIn, this.authToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if (json["isLoggedIn"] is bool) isLoggedIn = json["isLoggedIn"];
    if (json["authToken"] is String) authToken = json["authToken"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (user != null) {
      data["user"] = user!.toJson();
    }
    data["isLoggedIn"] = isLoggedIn;
    data["authToken"] = authToken;
    return data;
  }
}

class User {
  int? phoneNumber;
  String? accountStatus;
  String? accountType;
  String? email;
  String? name;

  User(
      {this.phoneNumber,
      this.accountStatus,
      this.accountType,
      this.email,
      this.name});

  User.fromJson(Map<String, dynamic> json) {
    if (json["phoneNumber"] is int) phoneNumber = json["phoneNumber"];
    if (json["accountStatus"] is String) accountStatus = json["accountStatus"];
    if (json["accountType"] is String) accountType = json["accountType"];
    if (json["email"] is String) email = json["email"];
    if (json["name"] is String) name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["phoneNumber"] = phoneNumber;
    data["accountStatus"] = accountStatus;
    data["accountType"] = accountType;
    data["email"] = email;
    data["name"] = name;
    return data;
  }
}
