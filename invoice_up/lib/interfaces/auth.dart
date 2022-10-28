class Auth {
  late String user;
  late String name;
  late String token;

  Auth({required this.user, required this.token, required this.name});

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        user: json['user'],
        token: json['token'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "token": token,
        "name": name,
      };
}
