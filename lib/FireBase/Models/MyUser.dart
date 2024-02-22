class MyUser {
  String? id;
  String? name;
  String? email;
  String? partnerEmail;
  String? phoneNumber;
  MyUser(
      {required this.name,
      required this.id,
      required this.email,
      required this.partnerEmail, required this.phoneNumber});
  MyUser.fromFireStore(Map<String, dynamic> json)
      : this(
          email: json["email"],
          partnerEmail: json["partnerEmail"],
    id: json["id"],
    name: json["name"],
    phoneNumber: json["phoneNumber"]
        );
  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "partnerEmail": partnerEmail,
      "phoneNumber":phoneNumber
    };
  }
}
