class LoginModal {
  LoginModal({
    required this.status,
    required this.message,
  });
  late final String status;
  late final String message;

  LoginModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}
