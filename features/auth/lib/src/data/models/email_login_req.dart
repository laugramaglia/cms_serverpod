class EmailLoginReq {
  final String email;
  final String password;

  EmailLoginReq({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
