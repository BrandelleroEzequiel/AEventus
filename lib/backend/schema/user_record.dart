import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "profesional" field.
  bool? _profesional;
  bool get profesional => _profesional ?? false;
  bool hasProfesional() => _profesional != null;

  // "photoPortada_url" field.
  String? _photoPortadaUrl;
  String get photoPortadaUrl => _photoPortadaUrl ?? '';
  bool hasPhotoPortadaUrl() => _photoPortadaUrl != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "seguidores" field.
  List<DocumentReference>? _seguidores;
  List<DocumentReference> get seguidores => _seguidores ?? const [];
  bool hasSeguidores() => _seguidores != null;

  // "siguiendo" field.
  List<DocumentReference>? _siguiendo;
  List<DocumentReference> get siguiendo => _siguiendo ?? const [];
  bool hasSiguiendo() => _siguiendo != null;

  // "imagenesAdicionales" field.
  List<String>? _imagenesAdicionales;
  List<String> get imagenesAdicionales => _imagenesAdicionales ?? const [];
  bool hasImagenesAdicionales() => _imagenesAdicionales != null;

  // "ubicacionLatLng" field.
  LatLng? _ubicacionLatLng;
  LatLng? get ubicacionLatLng => _ubicacionLatLng;
  bool hasUbicacionLatLng() => _ubicacionLatLng != null;

  // "instagramURL" field.
  String? _instagramURL;
  String get instagramURL => _instagramURL ?? '';
  bool hasInstagramURL() => _instagramURL != null;

  // "whatsAppURL" field.
  String? _whatsAppURL;
  String get whatsAppURL => _whatsAppURL ?? '';
  bool hasWhatsAppURL() => _whatsAppURL != null;

  // "tikTokURL" field.
  String? _tikTokURL;
  String get tikTokURL => _tikTokURL ?? '';
  bool hasTikTokURL() => _tikTokURL != null;

  // "XURL" field.
  String? _xurl;
  String get xurl => _xurl ?? '';
  bool hasXurl() => _xurl != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _profesional = snapshotData['profesional'] as bool?;
    _photoPortadaUrl = snapshotData['photoPortada_url'] as String?;
    _followers = getDataList(snapshotData['followers']);
    _descripcion = snapshotData['descripcion'] as String?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _seguidores = getDataList(snapshotData['seguidores']);
    _siguiendo = getDataList(snapshotData['siguiendo']);
    _imagenesAdicionales = getDataList(snapshotData['imagenesAdicionales']);
    _ubicacionLatLng = snapshotData['ubicacionLatLng'] as LatLng?;
    _instagramURL = snapshotData['instagramURL'] as String?;
    _whatsAppURL = snapshotData['whatsAppURL'] as String?;
    _tikTokURL = snapshotData['tikTokURL'] as String?;
    _xurl = snapshotData['XURL'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  bool? profesional,
  String? photoPortadaUrl,
  String? descripcion,
  bool? isAdmin,
  DateTime? createdTime,
  String? uid,
  LatLng? ubicacionLatLng,
  String? instagramURL,
  String? whatsAppURL,
  String? tikTokURL,
  String? xurl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'profesional': profesional,
      'photoPortada_url': photoPortadaUrl,
      'descripcion': descripcion,
      'isAdmin': isAdmin,
      'created_time': createdTime,
      'uid': uid,
      'ubicacionLatLng': ubicacionLatLng,
      'instagramURL': instagramURL,
      'whatsAppURL': whatsAppURL,
      'tikTokURL': tikTokURL,
      'XURL': xurl,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.profesional == e2?.profesional &&
        e1?.photoPortadaUrl == e2?.photoPortadaUrl &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        e1?.descripcion == e2?.descripcion &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.createdTime == e2?.createdTime &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.seguidores, e2?.seguidores) &&
        listEquality.equals(e1?.siguiendo, e2?.siguiendo) &&
        listEquality.equals(e1?.imagenesAdicionales, e2?.imagenesAdicionales) &&
        e1?.ubicacionLatLng == e2?.ubicacionLatLng &&
        e1?.instagramURL == e2?.instagramURL &&
        e1?.whatsAppURL == e2?.whatsAppURL &&
        e1?.tikTokURL == e2?.tikTokURL &&
        e1?.xurl == e2?.xurl;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.phoneNumber,
        e?.profesional,
        e?.photoPortadaUrl,
        e?.followers,
        e?.descripcion,
        e?.isAdmin,
        e?.createdTime,
        e?.uid,
        e?.seguidores,
        e?.siguiendo,
        e?.imagenesAdicionales,
        e?.ubicacionLatLng,
        e?.instagramURL,
        e?.whatsAppURL,
        e?.tikTokURL,
        e?.xurl
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
