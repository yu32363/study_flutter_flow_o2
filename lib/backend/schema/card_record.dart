import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CardRecord extends FirestoreRecord {
  CardRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "card_id" field.
  String? _cardId;
  String get cardId => _cardId ?? '';
  bool hasCardId() => _cardId != null;

  void _initializeFields() {
    _cardId = snapshotData['card_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('card');

  static Stream<CardRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardRecord.fromSnapshot(s));

  static Future<CardRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardRecord.fromSnapshot(s));

  static CardRecord fromSnapshot(DocumentSnapshot snapshot) => CardRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardRecordData({
  String? cardId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'card_id': cardId,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardRecordDocumentEquality implements Equality<CardRecord> {
  const CardRecordDocumentEquality();

  @override
  bool equals(CardRecord? e1, CardRecord? e2) {
    return e1?.cardId == e2?.cardId;
  }

  @override
  int hash(CardRecord? e) => const ListEquality().hash([e?.cardId]);

  @override
  bool isValidKey(Object? o) => o is CardRecord;
}
