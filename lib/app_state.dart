import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _buscando = false;
  bool get buscando => _buscando;
  set buscando(bool value) {
    _buscando = value;
  }

  bool _isLike = false;
  bool get isLike => _isLike;
  set isLike(bool value) {
    _isLike = value;
  }

  bool _isGuardado = false;
  bool get isGuardado => _isGuardado;
  set isGuardado(bool value) {
    _isGuardado = value;
  }

  List<String> _imgpath = [
    'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg'
  ];
  List<String> get imgpath => _imgpath;
  set imgpath(List<String> value) {
    _imgpath = value;
  }

  void addToImgpath(String value) {
    imgpath.add(value);
  }

  void removeFromImgpath(String value) {
    imgpath.remove(value);
  }

  void removeAtIndexFromImgpath(int index) {
    imgpath.removeAt(index);
  }

  void updateImgpathAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    imgpath[index] = updateFn(_imgpath[index]);
  }

  void insertAtIndexInImgpath(int index, String value) {
    imgpath.insert(index, value);
  }

  List<String> _imgpathFalse = [
    'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg'
  ];
  List<String> get imgpathFalse => _imgpathFalse;
  set imgpathFalse(List<String> value) {
    _imgpathFalse = value;
  }

  void addToImgpathFalse(String value) {
    imgpathFalse.add(value);
  }

  void removeFromImgpathFalse(String value) {
    imgpathFalse.remove(value);
  }

  void removeAtIndexFromImgpathFalse(int index) {
    imgpathFalse.removeAt(index);
  }

  void updateImgpathFalseAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    imgpathFalse[index] = updateFn(_imgpathFalse[index]);
  }

  void insertAtIndexInImgpathFalse(int index, String value) {
    imgpathFalse.insert(index, value);
  }

  String _estado = 'IMAGENES';
  String get estado => _estado;
  set estado(String value) {
    _estado = value;
  }

  bool _isFechaColapse = false;
  bool get isFechaColapse => _isFechaColapse;
  set isFechaColapse(bool value) {
    _isFechaColapse = value;
  }

  bool _isHoraColapse = false;
  bool get isHoraColapse => _isHoraColapse;
  set isHoraColapse(bool value) {
    _isHoraColapse = value;
  }

  DateTime? _fechaInicio;
  DateTime? get fechaInicio => _fechaInicio;
  set fechaInicio(DateTime? value) {
    _fechaInicio = value;
  }

  DateTime? _horaInicio;
  DateTime? get horaInicio => _horaInicio;
  set horaInicio(DateTime? value) {
    _horaInicio = value;
  }

  DateTime? _horaFin;
  DateTime? get horaFin => _horaFin;
  set horaFin(DateTime? value) {
    _horaFin = value;
  }

  bool _option = false;
  bool get option => _option;
  set option(bool value) {
    _option = value;
  }

  String _ImgPerfil =
      'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg';
  String get ImgPerfil => _ImgPerfil;
  set ImgPerfil(String value) {
    _ImgPerfil = value;
  }

  String _imgPortada =
      'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg';
  String get imgPortada => _imgPortada;
  set imgPortada(String value) {
    _imgPortada = value;
  }

  bool _listUserUnidosColapse = false;
  bool get listUserUnidosColapse => _listUserUnidosColapse;
  set listUserUnidosColapse(bool value) {
    _listUserUnidosColapse = value;
  }

  bool _listSeguidoresColapse = false;
  bool get listSeguidoresColapse => _listSeguidoresColapse;
  set listSeguidoresColapse(bool value) {
    _listSeguidoresColapse = value;
  }

  bool _listSeguidosColapse = false;
  bool get listSeguidosColapse => _listSeguidosColapse;
  set listSeguidosColapse(bool value) {
    _listSeguidosColapse = value;
  }

  bool _isborrar = false;
  bool get isborrar => _isborrar;
  set isborrar(bool value) {
    _isborrar = value;
  }

  bool _isRedesSociales = false;
  bool get isRedesSociales => _isRedesSociales;
  set isRedesSociales(bool value) {
    _isRedesSociales = value;
  }

  String _instagram = 'https://www.instagram.com/eze_brandee';
  String get instagram => _instagram;
  set instagram(String value) {
    _instagram = value;
  }

  bool _IsProfesionalCreando = false;
  bool get IsProfesionalCreando => _IsProfesionalCreando;
  set IsProfesionalCreando(bool value) {
    _IsProfesionalCreando = value;
  }

  bool _banderaBooleana = false;
  bool get banderaBooleana => _banderaBooleana;
  set banderaBooleana(bool value) {
    _banderaBooleana = value;
  }

  bool _banderaBoleana2 = false;
  bool get banderaBoleana2 => _banderaBoleana2;
  set banderaBoleana2(bool value) {
    _banderaBoleana2 = value;
  }

  bool _banderaBooleana3 = false;
  bool get banderaBooleana3 => _banderaBooleana3;
  set banderaBooleana3(bool value) {
    _banderaBooleana3 = value;
  }

  int _integert = 0;
  int get integert => _integert;
  set integert(int value) {
    _integert = value;
  }

  DateTime? _fechaFin;
  DateTime? get fechaFin => _fechaFin;
  set fechaFin(DateTime? value) {
    _fechaFin = value;
  }

  String _fechaStr = '';
  String get fechaStr => _fechaStr;
  set fechaStr(String value) {
    _fechaStr = value;
  }

  String _ViewImg =
      'https://images.unsplash.com/photo-1502318217862-aa4e294ba657?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzdGFycnklMjBuaWdodHxlbnwwfHx8fDE3MzA5OTcyMTF8MA&ixlib=rb-4.0.3&q=80&w=1080';
  String get ViewImg => _ViewImg;
  set ViewImg(String value) {
    _ViewImg = value;
  }

  EventCreateStruct _eventoCreado = EventCreateStruct();
  EventCreateStruct get eventoCreado => _eventoCreado;
  set eventoCreado(EventCreateStruct value) {
    _eventoCreado = value;
  }

  void updateEventoCreadoStruct(Function(EventCreateStruct) updateFn) {
    updateFn(_eventoCreado);
  }

  bool _banderaBoleana4 = false;
  bool get banderaBoleana4 => _banderaBoleana4;
  set banderaBoleana4(bool value) {
    _banderaBoleana4 = value;
  }
}
