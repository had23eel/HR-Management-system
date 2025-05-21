class UserModel{
  UserModel({
    this.first_name,
    this.email,
    this.number,
    this.jobtitle,
    this.department,
  });
  String? department;
  String? jobtitle;
  String? first_name;
  String? email;
  String? number;
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"]??"",
    first_name:json["first_name"]??"",
    number : json["phone"]??"",
    jobtitle:json["jobtitle"]??"",
    department: json["department"]??""
  );
  Map<String, dynamic> toJson() => {
    "first_name": first_name,
    "email":email,
    "number":number,
    "jobtitle":jobtitle,
    "department":department
  };
}