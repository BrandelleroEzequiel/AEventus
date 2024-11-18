import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
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

  // "imagen_url" field.
  String? _imagenUrl;
  String get imagenUrl => _imagenUrl ?? '';
  bool hasImagenUrl() => _imagenUrl != null;

  // "user_creator" field.
  DocumentReference? _userCreator;
  DocumentReference? get userCreator => _userCreator;
  bool hasUserCreator() => _userCreator != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "fechaInicio" field.
  DateTime? _fechaInicio;
  DateTime? get fechaInicio => _fechaInicio;
  bool hasFechaInicio() => _fechaInicio != null;

  // "ubicacion" field.
  String? _ubicacion;
  String get ubicacion => _ubicacion ?? '';
  bool hasUbicacion() => _ubicacion != null;

  // "ImagenesAdicionales" field.
  List<String>? _imagenesAdicionales;
  List<String> get imagenesAdicionales => _imagenesAdicionales ?? const [];
  bool hasImagenesAdicionales() => _imagenesAdicionales != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "isLiked" field.
  bool? _isLiked;
  bool get isLiked => _isLiked ?? false;
  bool hasIsLiked() => _isLiked != null;

  // "usersLikes" field.
  List<DocumentReference>? _usersLikes;
  List<DocumentReference> get usersLikes => _usersLikes ?? const [];
  bool hasUsersLikes() => _usersLikes != null;

  // "usersUnidos" field.
  List<DocumentReference>? _usersUnidos;
  List<DocumentReference> get usersUnidos => _usersUnidos ?? const [];
  bool hasUsersUnidos() => _usersUnidos != null;

  // "isParticipar" field.
  bool? _isParticipar;
  bool get isParticipar => _isParticipar ?? false;
  bool hasIsParticipar() => _isParticipar != null;

  // "Privacidad" field.
  String? _privacidad;
  String get privacidad => _privacidad ?? '';
  bool hasPrivacidad() => _privacidad != null;

  // "iscreatorProfesional" field.
  bool? _iscreatorProfesional;
  bool get iscreatorProfesional => _iscreatorProfesional ?? false;
  bool hasIscreatorProfesional() => _iscreatorProfesional != null;

  // "horaInicio" field.
  DateTime? _horaInicio;
  DateTime? get horaInicio => _horaInicio;
  bool hasHoraInicio() => _horaInicio != null;

  // "horaFin" field.
  DateTime? _horaFin;
  DateTime? get horaFin => _horaFin;
  bool hasHoraFin() => _horaFin != null;

  // "cantVisualizaciones" field.
  int? _cantVisualizaciones;
  int get cantVisualizaciones => _cantVisualizaciones ?? 0;
  bool hasCantVisualizaciones() => _cantVisualizaciones != null;

  // "ubicacionLatLng" field.
  LatLng? _ubicacionLatLng;
  LatLng? get ubicacionLatLng => _ubicacionLatLng;
  bool hasUbicacionLatLng() => _ubicacionLatLng != null;

  // "categorys" field.
  List<String>? _categorys;
  List<String> get categorys => _categorys ?? const [];
  bool hasCategorys() => _categorys != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "fechaStr" field.
  String? _fechaStr;
  String get fechaStr => _fechaStr ?? '';
  bool hasFechaStr() => _fechaStr != null;

  // "isHoraInicio" field.
  bool? _isHoraInicio;
  bool get isHoraInicio => _isHoraInicio ?? false;
  bool hasIsHoraInicio() => _isHoraInicio != null;

  // "isHoraFin" field.
  bool? _isHoraFin;
  bool get isHoraFin => _isHoraFin ?? false;
  bool hasIsHoraFin() => _isHoraFin != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _imagenUrl = snapshotData['imagen_url'] as String?;
    _userCreator = snapshotData['user_creator'] as DocumentReference?;
    _active = snapshotData['active'] as bool?;
    _fechaInicio = snapshotData['fechaInicio'] as DateTime?;
    _ubicacion = snapshotData['ubicacion'] as String?;
    _imagenesAdicionales = getDataList(snapshotData['ImagenesAdicionales']);
    _likes = castToType<int>(snapshotData['likes']);
    _isLiked = snapshotData['isLiked'] as bool?;
    _usersLikes = getDataList(snapshotData['usersLikes']);
    _usersUnidos = getDataList(snapshotData['usersUnidos']);
    _isParticipar = snapshotData['isParticipar'] as bool?;
    _privacidad = snapshotData['Privacidad'] as String?;
    _iscreatorProfesional = snapshotData['iscreatorProfesional'] as bool?;
    _horaInicio = snapshotData['horaInicio'] as DateTime?;
    _horaFin = snapshotData['horaFin'] as DateTime?;
    _cantVisualizaciones = castToType<int>(snapshotData['cantVisualizaciones']);
    _ubicacionLatLng = snapshotData['ubicacionLatLng'] as LatLng?;
    _categorys = getDataList(snapshotData['categorys']);
    _id = castToType<int>(snapshotData['id']);
    _fechaStr = snapshotData['fechaStr'] as String?;
    _isHoraInicio = snapshotData['isHoraInicio'] as bool?;
    _isHoraFin = snapshotData['isHoraFin'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event');

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  String? name,
  String? description,
  String? imagenUrl,
  DocumentReference? userCreator,
  bool? active,
  DateTime? fechaInicio,
  String? ubicacion,
  int? likes,
  bool? isLiked,
  bool? isParticipar,
  String? privacidad,
  bool? iscreatorProfesional,
  DateTime? horaInicio,
  DateTime? horaFin,
  int? cantVisualizaciones,
  LatLng? ubicacionLatLng,
  int? id,
  String? fechaStr,
  bool? isHoraInicio,
  bool? isHoraFin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'imagen_url': imagenUrl,
      'user_creator': userCreator,
      'active': active,
      'fechaInicio': fechaInicio,
      'ubicacion': ubicacion,
      'likes': likes,
      'isLiked': isLiked,
      'isParticipar': isParticipar,
      'Privacidad': privacidad,
      'iscreatorProfesional': iscreatorProfesional,
      'horaInicio': horaInicio,
      'horaFin': horaFin,
      'cantVisualizaciones': cantVisualizaciones,
      'ubicacionLatLng': ubicacionLatLng,
      'id': id,
      'fechaStr': fechaStr,
      'isHoraInicio': isHoraInicio,
      'isHoraFin': isHoraFin,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.imagenUrl == e2?.imagenUrl &&
        e1?.userCreator == e2?.userCreator &&
        e1?.active == e2?.active &&
        e1?.fechaInicio == e2?.fechaInicio &&
        e1?.ubicacion == e2?.ubicacion &&
        listEquality.equals(e1?.imagenesAdicionales, e2?.imagenesAdicionales) &&
        e1?.likes == e2?.likes &&
        e1?.isLiked == e2?.isLiked &&
        listEquality.equals(e1?.usersLikes, e2?.usersLikes) &&
        listEquality.equals(e1?.usersUnidos, e2?.usersUnidos) &&
        e1?.isParticipar == e2?.isParticipar &&
        e1?.privacidad == e2?.privacidad &&
        e1?.iscreatorProfesional == e2?.iscreatorProfesional &&
        e1?.horaInicio == e2?.horaInicio &&
        e1?.horaFin == e2?.horaFin &&
        e1?.cantVisualizaciones == e2?.cantVisualizaciones &&
        e1?.ubicacionLatLng == e2?.ubicacionLatLng &&
        listEquality.equals(e1?.categorys, e2?.categorys) &&
        e1?.id == e2?.id &&
        e1?.fechaStr == e2?.fechaStr &&
        e1?.isHoraInicio == e2?.isHoraInicio &&
        e1?.isHoraFin == e2?.isHoraFin;
  }

  @override
  int hash(EventRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.imagenUrl,
        e?.userCreator,
        e?.active,
        e?.fechaInicio,
        e?.ubicacion,
        e?.imagenesAdicionales,
        e?.likes,
        e?.isLiked,
        e?.usersLikes,
        e?.usersUnidos,
        e?.isParticipar,
        e?.privacidad,
        e?.iscreatorProfesional,
        e?.horaInicio,
        e?.horaFin,
        e?.cantVisualizaciones,
        e?.ubicacionLatLng,
        e?.categorys,
        e?.id,
        e?.fechaStr,
        e?.isHoraInicio,
        e?.isHoraFin
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
