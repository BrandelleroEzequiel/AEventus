import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromocionRecord extends FirestoreRecord {
  PromocionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "user_creator" field.
  DocumentReference? _userCreator;
  DocumentReference? get userCreator => _userCreator;
  bool hasUserCreator() => _userCreator != null;

  // "fechaInicio" field.
  DateTime? _fechaInicio;
  DateTime? get fechaInicio => _fechaInicio;
  bool hasFechaInicio() => _fechaInicio != null;

  // "fechaFin" field.
  DateTime? _fechaFin;
  DateTime? get fechaFin => _fechaFin;
  bool hasFechaFin() => _fechaFin != null;

  // "limite" field.
  int? _limite;
  int get limite => _limite ?? 0;
  bool hasLimite() => _limite != null;

  // "usuariosConsumidores" field.
  List<DocumentReference>? _usuariosConsumidores;
  List<DocumentReference> get usuariosConsumidores =>
      _usuariosConsumidores ?? const [];
  bool hasUsuariosConsumidores() => _usuariosConsumidores != null;

  // "usuariosGuardados" field.
  List<DocumentReference>? _usuariosGuardados;
  List<DocumentReference> get usuariosGuardados =>
      _usuariosGuardados ?? const [];
  bool hasUsuariosGuardados() => _usuariosGuardados != null;

  // "categorys" field.
  List<String>? _categorys;
  List<String> get categorys => _categorys ?? const [];
  bool hasCategorys() => _categorys != null;

  // "horaInicio" field.
  DateTime? _horaInicio;
  DateTime? get horaInicio => _horaInicio;
  bool hasHoraInicio() => _horaInicio != null;

  // "horaFin" field.
  DateTime? _horaFin;
  DateTime? get horaFin => _horaFin;
  bool hasHoraFin() => _horaFin != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _active = snapshotData['active'] as bool?;
    _imagen = snapshotData['imagen'] as String?;
    _userCreator = snapshotData['user_creator'] as DocumentReference?;
    _fechaInicio = snapshotData['fechaInicio'] as DateTime?;
    _fechaFin = snapshotData['fechaFin'] as DateTime?;
    _limite = castToType<int>(snapshotData['limite']);
    _usuariosConsumidores = getDataList(snapshotData['usuariosConsumidores']);
    _usuariosGuardados = getDataList(snapshotData['usuariosGuardados']);
    _categorys = getDataList(snapshotData['categorys']);
    _horaInicio = snapshotData['horaInicio'] as DateTime?;
    _horaFin = snapshotData['horaFin'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promocion');

  static Stream<PromocionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromocionRecord.fromSnapshot(s));

  static Future<PromocionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromocionRecord.fromSnapshot(s));

  static PromocionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromocionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromocionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromocionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromocionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromocionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromocionRecordData({
  String? name,
  String? description,
  bool? active,
  String? imagen,
  DocumentReference? userCreator,
  DateTime? fechaInicio,
  DateTime? fechaFin,
  int? limite,
  DateTime? horaInicio,
  DateTime? horaFin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'active': active,
      'imagen': imagen,
      'user_creator': userCreator,
      'fechaInicio': fechaInicio,
      'fechaFin': fechaFin,
      'limite': limite,
      'horaInicio': horaInicio,
      'horaFin': horaFin,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromocionRecordDocumentEquality implements Equality<PromocionRecord> {
  const PromocionRecordDocumentEquality();

  @override
  bool equals(PromocionRecord? e1, PromocionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.active == e2?.active &&
        e1?.imagen == e2?.imagen &&
        e1?.userCreator == e2?.userCreator &&
        e1?.fechaInicio == e2?.fechaInicio &&
        e1?.fechaFin == e2?.fechaFin &&
        e1?.limite == e2?.limite &&
        listEquality.equals(
            e1?.usuariosConsumidores, e2?.usuariosConsumidores) &&
        listEquality.equals(e1?.usuariosGuardados, e2?.usuariosGuardados) &&
        listEquality.equals(e1?.categorys, e2?.categorys) &&
        e1?.horaInicio == e2?.horaInicio &&
        e1?.horaFin == e2?.horaFin;
  }

  @override
  int hash(PromocionRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.active,
        e?.imagen,
        e?.userCreator,
        e?.fechaInicio,
        e?.fechaFin,
        e?.limite,
        e?.usuariosConsumidores,
        e?.usuariosGuardados,
        e?.categorys,
        e?.horaInicio,
        e?.horaFin
      ]);

  @override
  bool isValidKey(Object? o) => o is PromocionRecord;
}
