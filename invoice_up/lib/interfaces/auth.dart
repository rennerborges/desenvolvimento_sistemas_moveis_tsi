class Auth {
  late String user;
  late String token;

  Auth({required this.user, required this.token});

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        user: json['user'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "token": token,
      };
}
