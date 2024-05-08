import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardRecord extends FirestoreRecord {
  CardRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "card_id" field.
  String? _cardId;
  String get cardId => _cardId ?? '';
  bool hasCardId() => _cardId != null;

  // "cif_no" field.
  String? _cifNo;
  String get cifNo => _cifNo ?? '';
  bool hasCifNo() => _cifNo != null;

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "type_m" field.
  String? _typeM;
  String get typeM => _typeM ?? '';
  bool hasTypeM() => _typeM != null;

  void _initializeFields() {
    _cardId = snapshotData['card_id'] as String?;
    _cifNo = snapshotData['cif_no'] as String?;
    _customerName = snapshotData['customer_name'] as String?;
    _typeM = snapshotData['type_m'] as String?;
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
  String? cifNo,
  String? customerName,
  String? typeM,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'card_id': cardId,
      'cif_no': cifNo,
      'customer_name': customerName,
      'type_m': typeM,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardRecordDocumentEquality implements Equality<CardRecord> {
  const CardRecordDocumentEquality();

  @override
  bool equals(CardRecord? e1, CardRecord? e2) {
    return e1?.cardId == e2?.cardId &&
        e1?.cifNo == e2?.cifNo &&
        e1?.customerName == e2?.customerName &&
        e1?.typeM == e2?.typeM;
  }

  @override
  int hash(CardRecord? e) => const ListEquality()
      .hash([e?.cardId, e?.cifNo, e?.customerName, e?.typeM]);

  @override
  bool isValidKey(Object? o) => o is CardRecord;
}
