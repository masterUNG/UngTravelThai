import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageModel {
  final String id;
  final String avatar;
  final String name;
  final String message;
  MessageModel({
    required this.id,
    required this.avatar,
    required this.name,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'avatar': avatar,
      'name': name,
      'message': message,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: (map['id'] ?? '') as String,
      avatar: (map['avatar'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      message: (map['message'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
