import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tweets_record.g.dart';

abstract class TweetsRecord
    implements Built<TweetsRecord, TweetsRecordBuilder> {
  static Serializer<TweetsRecord> get serializer => _$tweetsRecordSerializer;

  String? get name;

  DocumentReference? get uid;

  @BuiltValueField(wireName: 'Post_liked_by')
  BuiltList<DocumentReference>? get postLikedBy;

  @BuiltValueField(wireName: 'Post_Gifted_From')
  String? get postGiftedFrom;

  @BuiltValueField(wireName: 'Tweet_by')
  String? get tweetBy;

  @BuiltValueField(wireName: 'Post_Gifted_by')
  BuiltList<DocumentReference>? get postGiftedBy;

  @BuiltValueField(wireName: 'Tweet_by_email')
  String? get tweetByEmail;

  @BuiltValueField(wireName: 'Tweet_ownerpic')
  String? get tweetOwnerpic;

  @BuiltValueField(wireName: 'Tweet_time')
  DateTime? get tweetTime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(TweetsRecordBuilder builder) => builder
    ..name = ''
    ..postLikedBy = ListBuilder()
    ..postGiftedFrom = ''
    ..tweetBy = ''
    ..postGiftedBy = ListBuilder()
    ..tweetByEmail = ''
    ..tweetOwnerpic = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tweets')
          : FirebaseFirestore.instance.collectionGroup('tweets');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tweets').doc();

  static Stream<TweetsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TweetsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TweetsRecord._();
  factory TweetsRecord([void Function(TweetsRecordBuilder) updates]) =
      _$TweetsRecord;

  static TweetsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTweetsRecordData({
  String? name,
  DocumentReference? uid,
  String? postGiftedFrom,
  String? tweetBy,
  String? tweetByEmail,
  String? tweetOwnerpic,
  DateTime? tweetTime,
}) {
  final firestoreData = serializers.toFirestore(
    TweetsRecord.serializer,
    TweetsRecord(
      (t) => t
        ..name = name
        ..uid = uid
        ..postLikedBy = null
        ..postGiftedFrom = postGiftedFrom
        ..tweetBy = tweetBy
        ..postGiftedBy = null
        ..tweetByEmail = tweetByEmail
        ..tweetOwnerpic = tweetOwnerpic
        ..tweetTime = tweetTime,
    ),
  );

  return firestoreData;
}
