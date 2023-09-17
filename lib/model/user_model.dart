class UserModel {
  final String mobile;

  UserModel({
    required this.mobile,
  });

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        mobile: json['mobile'],
      );
}
