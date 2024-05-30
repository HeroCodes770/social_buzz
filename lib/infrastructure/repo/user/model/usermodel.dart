// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

class UserModel {
  final String email;
  final String name;
  final List<dynamic> followers;
  final List<dynamic> following;
  final String profilePic;
  final String uid;
  final String bio;
  final bool isVerified;
  UserModel({
    required this.email,
    required this.name,
    required this.followers,
    required this.following,
    required this.profilePic,
    required this.uid,
    required this.bio,
    required this.isVerified,
  });

  UserModel copyWith({
    String? email,
    String? name,
    List<String>? followers,
    List<String>? following,
    String? profilePic,
    String? uid,
    String? bio,
    bool? isVerified,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      profilePic: profilePic ?? this.profilePic,
      uid: uid ?? this.uid,
      bio: bio ?? this.bio,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'email': email,
      'name': name,
      'followers': followers,
      'following': following,
      'profilePic': profilePic,
      'bio': bio,
      'isVerified': isVerified,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      name: map['name'] as String,
      followers: List<dynamic>.from((map['followers'] as List<dynamic>)),
      following: List<dynamic>.from((map['following'] as List<dynamic>)),
      profilePic: map['profilePic'] as String,
      uid: map['\$id'] ?? "",
      bio: map['bio'] as String,
      isVerified: map['isVerified'] as bool,
    );
  }

 
  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, followers: $followers, following: $following, profilePic: $profilePic, uid: $uid, bio: $bio, isVerified: $isVerified)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.name == name &&
      listEquals(other.followers, followers) &&
      listEquals(other.following, following) &&
      other.profilePic == profilePic &&
      other.uid == uid &&
      other.bio == bio &&
      other.isVerified == isVerified;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      name.hashCode ^
      followers.hashCode ^
      following.hashCode ^
      profilePic.hashCode ^
      uid.hashCode ^
      bio.hashCode ^
      isVerified.hashCode;
  }
}


 