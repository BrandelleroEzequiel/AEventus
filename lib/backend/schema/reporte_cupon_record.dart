import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReporteCuponRecord extends FirestoreRecord {
  ReporteCuponRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "FechaCanejo" field.
  DateTime? _fechaCanejo;
  DateTime? get fechaCanejo => _fechaCanejo;
  bool hasFechaCanejo() => _fechaCanejo != null;

  // "LookUpUser" field.
  DocumentReference? _lookUpUser;
  DocumentReference? get lookUpUser => _lookUpUser;
  bool hasLookUpUser() => _lookUpUser != null;

  // "LookUpCupon" field.
  DocumentReference? _lookUpCupon;
  DocumentReference? get lookUpCupon => _lookUpCupon;
  bool hasLookUpCupon() => _lookUpCupon != null;

  void _initializeFields() {
    _fechaCanejo = snapshotData['FechaCanejo'] as DateTime?;
    _lookUpUser = snapshotData['LookUpUser'] as DocumentReference?;
    _lookUpCupon = snapshotData['LookUpCupon'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reporteCupon');

  static Stream<ReporteCuponRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReporteCuponRecord.fromSnapshot(s));

  static Future<ReporteCuponRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReporteCuponRecord.fromSnapshot(s));

  static ReporteCuponRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReporteCuponRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReporteCuponRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReporteCuponRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReporteCuponRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReporteCuponRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReporteCuponRecordData({
  DateTime? fechaCanejo,
  DocumentReference? lookUpUser,
  DocumentReference? lookUpCupon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FechaCanejo': fechaCanejo,
      'LookUpUser': lookUpUser,
      'LookUpCupon': lookUpCupon,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReporteCuponRecordDocumentEquality
    implements Equality<ReporteCuponRecord> {
  const ReporteCuponRecordDocumentEquality();

  @override
  bool equals(ReporteCuponRecord? e1, ReporteCuponRecord? e2) {
    return e1?.fechaCanejo == e2?.fechaCanejo &&
        e1?.lookUpUser == e2?.lookUpUser &&
        e1?.lookUpCupon == e2?.lookUpCupon;
  }

  @override
  int hash(ReporteCuponRecord? e) => const ListEquality()
      .hash([e?.fechaCanejo, e?.lookUpUser, e?.lookUpCupon]);

  @override
  bool isValidKey(Object? o) => o is ReporteCuponRecord;
}
