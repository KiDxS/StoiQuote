import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FavoriteQuotesRecord extends FirestoreRecord {
  FavoriteQuotesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "quote" field.
  String? _quote;
  String get quote => _quote ?? '';
  bool hasQuote() => _quote != null;

  void _initializeFields() {
    _author = snapshotData['author'] as String?;
    _quote = snapshotData['quote'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favorite_quotes');

  static Stream<FavoriteQuotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoriteQuotesRecord.fromSnapshot(s));

  static Future<FavoriteQuotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoriteQuotesRecord.fromSnapshot(s));

  static FavoriteQuotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoriteQuotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoriteQuotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoriteQuotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoriteQuotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoriteQuotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoriteQuotesRecordData({
  String? author,
  String? quote,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'author': author,
      'quote': quote,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoriteQuotesRecordDocumentEquality
    implements Equality<FavoriteQuotesRecord> {
  const FavoriteQuotesRecordDocumentEquality();

  @override
  bool equals(FavoriteQuotesRecord? e1, FavoriteQuotesRecord? e2) {
    return e1?.author == e2?.author && e1?.quote == e2?.quote;
  }

  @override
  int hash(FavoriteQuotesRecord? e) =>
      const ListEquality().hash([e?.author, e?.quote]);

  @override
  bool isValidKey(Object? o) => o is FavoriteQuotesRecord;
}
