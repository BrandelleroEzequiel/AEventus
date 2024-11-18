// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventCreateStruct extends FFFirebaseStruct {
  EventCreateStruct({
    String? name,
    List<String>? imagenesAdicionales,
    String? descripcion,
    List<String>? categorias,
    DateTime? fechaInicio,
    String? fechaStr,
    DateTime? horaInicio,
    bool? isHoraInicio,
    DateTime? horaFin,
    bool? isHoraFin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _imagenesAdicionales = imagenesAdicionales,
        _descripcion = descripcion,
        _categorias = categorias,
        _fechaInicio = fechaInicio,
        _fechaStr = fechaStr,
        _horaInicio = horaInicio,
        _isHoraInicio = isHoraInicio,
        _horaFin = horaFin,
        _isHoraFin = isHoraFin,
        super(firestoreUtilData);

  // "Name" field.
  String? _name;
  String get name => _name ?? 'NameEvent';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "imagenesAdicionales" field.
  List<String>? _imagenesAdicionales;
  List<String> get imagenesAdicionales => _imagenesAdicionales ?? const [];
  set imagenesAdicionales(List<String>? val) => _imagenesAdicionales = val;

  void updateImagenesAdicionales(Function(List<String>) updateFn) {
    updateFn(_imagenesAdicionales ??= []);
  }

  bool hasImagenesAdicionales() => _imagenesAdicionales != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  set descripcion(String? val) => _descripcion = val;

  bool hasDescripcion() => _descripcion != null;

  // "categorias" field.
  List<String>? _categorias;
  List<String> get categorias => _categorias ?? const [];
  set categorias(List<String>? val) => _categorias = val;

  void updateCategorias(Function(List<String>) updateFn) {
    updateFn(_categorias ??= []);
  }

  bool hasCategorias() => _categorias != null;

  // "fechaInicio" field.
  DateTime? _fechaInicio;
  DateTime? get fechaInicio => _fechaInicio;
  set fechaInicio(DateTime? val) => _fechaInicio = val;

  bool hasFechaInicio() => _fechaInicio != null;

  // "fechaStr" field.
  String? _fechaStr;
  String get fechaStr => _fechaStr ?? '';
  set fechaStr(String? val) => _fechaStr = val;

  bool hasFechaStr() => _fechaStr != null;

  // "horaInicio" field.
  DateTime? _horaInicio;
  DateTime? get horaInicio => _horaInicio;
  set horaInicio(DateTime? val) => _horaInicio = val;

  bool hasHoraInicio() => _horaInicio != null;

  // "isHoraInicio" field.
  bool? _isHoraInicio;
  bool get isHoraInicio => _isHoraInicio ?? false;
  set isHoraInicio(bool? val) => _isHoraInicio = val;

  bool hasIsHoraInicio() => _isHoraInicio != null;

  // "horaFin" field.
  DateTime? _horaFin;
  DateTime? get horaFin => _horaFin;
  set horaFin(DateTime? val) => _horaFin = val;

  bool hasHoraFin() => _horaFin != null;

  // "isHoraFin" field.
  bool? _isHoraFin;
  bool get isHoraFin => _isHoraFin ?? false;
  set isHoraFin(bool? val) => _isHoraFin = val;

  bool hasIsHoraFin() => _isHoraFin != null;

  static EventCreateStruct fromMap(Map<String, dynamic> data) =>
      EventCreateStruct(
        name: data['Name'] as String?,
        imagenesAdicionales: getDataList(data['imagenesAdicionales']),
        descripcion: data['Descripcion'] as String?,
        categorias: getDataList(data['categorias']),
        fechaInicio: data['fechaInicio'] as DateTime?,
        fechaStr: data['fechaStr'] as String?,
        horaInicio: data['horaInicio'] as DateTime?,
        isHoraInicio: data['isHoraInicio'] as bool?,
        horaFin: data['horaFin'] as DateTime?,
        isHoraFin: data['isHoraFin'] as bool?,
      );

  static EventCreateStruct? maybeFromMap(dynamic data) => data is Map
      ? EventCreateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'imagenesAdicionales': _imagenesAdicionales,
        'Descripcion': _descripcion,
        'categorias': _categorias,
        'fechaInicio': _fechaInicio,
        'fechaStr': _fechaStr,
        'horaInicio': _horaInicio,
        'isHoraInicio': _isHoraInicio,
        'horaFin': _horaFin,
        'isHoraFin': _isHoraFin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'imagenesAdicionales': serializeParam(
          _imagenesAdicionales,
          ParamType.String,
          isList: true,
        ),
        'Descripcion': serializeParam(
          _descripcion,
          ParamType.String,
        ),
        'categorias': serializeParam(
          _categorias,
          ParamType.String,
          isList: true,
        ),
        'fechaInicio': serializeParam(
          _fechaInicio,
          ParamType.DateTime,
        ),
        'fechaStr': serializeParam(
          _fechaStr,
          ParamType.String,
        ),
        'horaInicio': serializeParam(
          _horaInicio,
          ParamType.DateTime,
        ),
        'isHoraInicio': serializeParam(
          _isHoraInicio,
          ParamType.bool,
        ),
        'horaFin': serializeParam(
          _horaFin,
          ParamType.DateTime,
        ),
        'isHoraFin': serializeParam(
          _isHoraFin,
          ParamType.bool,
        ),
      }.withoutNulls;

  static EventCreateStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventCreateStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        imagenesAdicionales: deserializeParam<String>(
          data['imagenesAdicionales'],
          ParamType.String,
          true,
        ),
        descripcion: deserializeParam(
          data['Descripcion'],
          ParamType.String,
          false,
        ),
        categorias: deserializeParam<String>(
          data['categorias'],
          ParamType.String,
          true,
        ),
        fechaInicio: deserializeParam(
          data['fechaInicio'],
          ParamType.DateTime,
          false,
        ),
        fechaStr: deserializeParam(
          data['fechaStr'],
          ParamType.String,
          false,
        ),
        horaInicio: deserializeParam(
          data['horaInicio'],
          ParamType.DateTime,
          false,
        ),
        isHoraInicio: deserializeParam(
          data['isHoraInicio'],
          ParamType.bool,
          false,
        ),
        horaFin: deserializeParam(
          data['horaFin'],
          ParamType.DateTime,
          false,
        ),
        isHoraFin: deserializeParam(
          data['isHoraFin'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'EventCreateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EventCreateStruct &&
        name == other.name &&
        listEquality.equals(imagenesAdicionales, other.imagenesAdicionales) &&
        descripcion == other.descripcion &&
        listEquality.equals(categorias, other.categorias) &&
        fechaInicio == other.fechaInicio &&
        fechaStr == other.fechaStr &&
        horaInicio == other.horaInicio &&
        isHoraInicio == other.isHoraInicio &&
        horaFin == other.horaFin &&
        isHoraFin == other.isHoraFin;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        imagenesAdicionales,
        descripcion,
        categorias,
        fechaInicio,
        fechaStr,
        horaInicio,
        isHoraInicio,
        horaFin,
        isHoraFin
      ]);
}

EventCreateStruct createEventCreateStruct({
  String? name,
  String? descripcion,
  DateTime? fechaInicio,
  String? fechaStr,
  DateTime? horaInicio,
  bool? isHoraInicio,
  DateTime? horaFin,
  bool? isHoraFin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventCreateStruct(
      name: name,
      descripcion: descripcion,
      fechaInicio: fechaInicio,
      fechaStr: fechaStr,
      horaInicio: horaInicio,
      isHoraInicio: isHoraInicio,
      horaFin: horaFin,
      isHoraFin: isHoraFin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventCreateStruct? updateEventCreateStruct(
  EventCreateStruct? eventCreate, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eventCreate
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventCreateStructData(
  Map<String, dynamic> firestoreData,
  EventCreateStruct? eventCreate,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eventCreate == null) {
    return;
  }
  if (eventCreate.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eventCreate.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventCreateData =
      getEventCreateFirestoreData(eventCreate, forFieldValue);
  final nestedData =
      eventCreateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eventCreate.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventCreateFirestoreData(
  EventCreateStruct? eventCreate, [
  bool forFieldValue = false,
]) {
  if (eventCreate == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eventCreate.toMap());

  // Add any Firestore field values
  eventCreate.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventCreateListFirestoreData(
  List<EventCreateStruct>? eventCreates,
) =>
    eventCreates?.map((e) => getEventCreateFirestoreData(e, true)).toList() ??
    [];
