import 'dart:convert';

class Session {
  final String title;
  final String uid;
  final String username;
  final startedAt;
  final String channelId;

  Session(
      {required this.title,
      required this.uid,
      required this.username,
      required this.channelId,
      required this.startedAt});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'uid': uid,
      'username': username,
      'channelId': channelId,
      'startedAt': startedAt,
    };
  }

  factory Session.fromMap(Map<String, dynamic> map) {
    return Session(
      title: map['title'] ?? '',
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      channelId: map['channelId'] ?? '',
      startedAt: map['startedAt'] ?? '',
    );
  }
}
