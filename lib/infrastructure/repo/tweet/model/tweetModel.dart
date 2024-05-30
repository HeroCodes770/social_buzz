// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:social_buzz/domain/core/enum/tweet_type.dart';

class TweetModel {
  final String text;
  final String link;
  final List<dynamic> hashtags;
  final List<dynamic> imageLinks;
  final String uid;
  final String tweetedAt;
  final List<String> likes;
  final TweetType tweetType;
  final List<String> commentIds;
  final String id;
  final int reshareCount;
  TweetModel({
    required this.text,
    required this.link,
    required this.hashtags,
    required this.imageLinks,
    required this.uid,
    required this.tweetedAt,
    required this.likes,
    required this.tweetType,
    required this.commentIds,
    required this.id,
    required this.reshareCount,
  });

  TweetModel copyWith({
    String? text,
    String? link,
    List<String>? hashtags,
    List<String>? imageLinks,
    String? uid,
    String? tweetedAt,
    List<String>? likes,
    TweetType? tweetType,
    List<String>? commentIds,
    String? id,
    int? reshareCount,
  }) {
    return TweetModel(
      text: text ?? this.text,
      link: link ?? this.link,
      hashtags: hashtags ?? this.hashtags,
      imageLinks: imageLinks ?? this.imageLinks,
      uid: uid ?? this.uid,
      tweetedAt: tweetedAt ?? this.tweetedAt,
      tweetType: tweetType ?? this.tweetType,
      id: id ?? this.id,
      reshareCount: reshareCount ?? this.reshareCount,
      likes: [],
      commentIds: [],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'link': link,
      'hashtags': hashtags,
      'imageLinks': imageLinks,
      'uid': uid,
      'tweetedAt': tweetedAt,
      'likes': likes,
      'tweetType': tweetType.type,
      'commentIds': commentIds,
      'reshareCount': reshareCount,
    };
  }

  factory TweetModel.fromMap(Map<String, dynamic> map) {
    return TweetModel(
      text: map['text'] as String,
      link: map['link'] as String,
      hashtags: List<dynamic>.from((map['hashtags'] as List<dynamic>)),
      imageLinks: List<dynamic>.from((map['imageLinks'] as List<dynamic>)),
      uid: map['uid'] as String,
      tweetedAt: map['tweetedAt'] as String,
      likes: List<String>.from((map['likes'] as List<dynamic>)),
      tweetType: (map['tweetType'] as String).toTweetTypeEnum(),
      commentIds: List<String>.from((map['commentIds'] as List<dynamic>)),
      id: map['\$id'] as String,
      reshareCount: map['reshareCount'] as int,
    );
  }

  @override
  String toString() {
    return 'TweetModel(text: $text, link: $link, hashtags: $hashtags, imageLinks: $imageLinks, uid: $uid, likes: $likes, tweetType: $tweetType, commentIds: $commentIds, id: $id, reshareCount: $reshareCount)';
  }

  @override
  bool operator ==(covariant TweetModel other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.link == link &&
        listEquals(other.hashtags, hashtags) &&
        listEquals(other.imageLinks, imageLinks) &&
        other.uid == uid &&
        listEquals(other.likes, likes) &&
        other.tweetType == tweetType &&
        listEquals(other.commentIds, commentIds) &&
        other.id == id &&
        other.reshareCount == reshareCount;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        link.hashCode ^
        hashtags.hashCode ^
        imageLinks.hashCode ^
        uid.hashCode ^
        likes.hashCode ^
        tweetType.hashCode ^
        commentIds.hashCode ^
        id.hashCode ^
        reshareCount.hashCode;
  }
}
