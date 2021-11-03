// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.error,
        this.message,
        this.user,
    });

    final bool error;
    final String message;
    final UserClass user;

    factory User.fromJson(Map<String, dynamic> json) => User(
        error: json["error"],
        message: json["message"],
        user: UserClass.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "user": user.toJson(),
    };
}

class UserClass {
    UserClass({
        this.id,
        this.name,
        this.email,
        this.phone,
    });

    final dynamic id;
    final dynamic name;
    final String email;
    final dynamic phone;

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
    };
}