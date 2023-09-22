class MUser {
  String? userNick;
  String? oauth;

  MUser({
    this.userNick,
    this.oauth,
  });

  Map<String, dynamic> toJson() {
    return {
      'userNick': userNick,
      'oauth': oauth,
    };
  }

  factory MUser.fromJson(Map<String, dynamic> json) {
    return MUser(
      userNick: json['userNick'] as String?,
      oauth: json['oauth'] as String?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MUser &&
          runtimeType == other.runtimeType &&
          userNick == other.userNick &&
          oauth == other.oauth;
}
