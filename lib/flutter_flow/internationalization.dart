import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    '2f5es9a5': {
      'es': 'Principales',
      'en': '',
    },
    'qndympj7': {
      'es': 'Ver todos',
      'en': '',
    },
    '1nbaot11': {
      'es': 'Cupones',
      'en': '',
    },
    '5c174uxr': {
      'es': 'Ver todos',
      'en': '',
    },
    'm9t4evsd': {
      'es': 'Lugares y usuarios',
      'en': '',
    },
    'pjzkgq3l': {
      'es': 'Ver todos',
      'en': '',
    },
    'd47wil70': {
      'es': 'Eventos de la comunidad',
      'en': '',
    },
    'z4sjtnn2': {
      'es': 'Ver todos',
      'en': '',
    },
    'hyef0nte': {
      'es': 'Crear evento',
      'en': '',
    },
    '5xv1ysib': {
      'es': 'Crear cupòn',
      'en': '',
    },
    'uk1rgqxe': {
      'es': 'Home',
      'en': '',
    },
  },
  // AllCupones
  {
    '9t3icsm2': {
      'es': 'Todos los cupones',
      'en': '',
    },
    'o4jkrvxj': {
      'es': '    Buscar...',
      'en': '',
    },
    'dxqw1az6': {
      'es': '',
      'en': '',
    },
    '6hng6ieg': {
      'es': 'Todos',
      'en': '',
    },
    'xu403375': {
      'es': 'Fiestas',
      'en': '',
    },
    'kfi7b96f': {
      'es': 'Deportes',
      'en': '',
    },
    'o7ak2akx': {
      'es': 'Gastronomia',
      'en': '',
    },
    'ov3luudf': {
      'es': 'Educación',
      'en': '',
    },
    'qjfy9jmi': {
      'es': 'Caridad',
      'en': '',
    },
    'bkguur6c': {
      'es': 'Teatro',
      'en': '',
    },
    'bbyj2yzs': {
      'es': 'Música',
      'en': '',
    },
    'whs1vl4p': {
      'es': 'Turismo',
      'en': '',
    },
    '5hfq8i6v': {
      'es': 'Empresarial',
      'en': '',
    },
    '11c7i2xq': {
      'es': 'Infantil',
      'en': '',
    },
    'q6dbs5s7': {
      'es': 'Todos',
      'en': '',
    },
    'l9uz56dz': {
      'es': 'All',
      'en': '',
    },
    'upowz9gz': {
      'es': 'Crear evento',
      'en': '',
    },
    'w78se9ie': {
      'es': 'Crear cupòn',
      'en': '',
    },
    '5k76tppo': {
      'es': 'Home',
      'en': '',
    },
  },
  // AllUsers
  {
    '8o8nqtui': {
      'es': '    Buscar usuarios...',
      'en': '',
    },
    'gk4w5j99': {
      'es': '',
      'en': '',
    },
    'pvs7v6pw': {
      'es': 'Lugares destacados',
      'en': '',
    },
    'nybcn5sl': {
      'es': 'Usuarios destacados',
      'en': '',
    },
    'aniyi26o': {
      'es': 'Home',
      'en': '',
    },
  },
  // EventDetail
  {
    '0m628f7r': {
      'es': ' - ',
      'en': '',
    },
    '9opz2wir': {
      'es': 'Seguir',
      'en': '',
    },
    'b0ii6pgo': {
      'es': 'Dejar de seguir',
      'en': '',
    },
    '0bj8elh5': {
      'es': 'Acerca de este evento',
      'en': '',
    },
    'ebq5m2ie': {
      'es': 'Ubicación del lugar',
      'en': '',
    },
    'j2n16eyk': {
      'es': 'Alvear 800, Rosario, Santa Fe, Argentina',
      'en': '',
    },
    'cadwwne0': {
      'es': 'Participantes del evento',
      'en': '',
    },
    'f4eh9f4p': {
      'es': 'Ver todos',
      'en': '',
    },
    '00w36eyk': {
      'es': 'Unirme al evento',
      'en': '',
    },
    'dtq8bgoi': {
      'es': 'Salir del evento',
      'en': '',
    },
    'i8mw5fr0': {
      'es': 'Cupones activos del usuario',
      'en': '',
    },
    'q4oxr5b4': {
      'es': 'Ver todos',
      'en': '',
    },
    'kcmzngu4': {
      'es': 'Eventos similares',
      'en': '',
    },
    'emifp2hk': {
      'es': 'Ver todos',
      'en': '',
    },
    'vsg6mshc': {
      'es': 'Listado de participantes',
      'en': '',
    },
    'u28rmvka': {
      'es': '¡Se añadio a tus me gustas!',
      'en': '',
    },
    '18xu8mh5': {
      'es': 'Listado de cupones del lugar',
      'en': '',
    },
    '2c7v0oli': {
      'es': 'Home',
      'en': '',
    },
  },
  // PromocionDetail
  {
    'u3hi0wkw': {
      'es': 'Cupón activo',
      'en': '',
    },
    'dxq3q5ed': {
      'es': 'Seguir',
      'en': '',
    },
    'rglab30x': {
      'es': 'Dejar de seguir',
      'en': '',
    },
    'd3u7jrib': {
      'es': 'Cupón valido hasta',
      'en': '',
    },
    'aqf3ph3a': {
      'es': 'Rango de horario para válidez',
      'en': '',
    },
    'zyeavox9': {
      'es': 'a',
      'en': '',
    },
    'tq0vw40h': {
      'es': 'Información sobre el cupón',
      'en': '',
    },
    '9f12ysyn': {
      'es': 'Cupón canjeado',
      'en': '',
    },
    'rz1ria67': {
      'es': 'Canjear cupón',
      'en': '',
    },
    'tfhir9qb': {
      'es': 'Cupon guardado!',
      'en': '',
    },
    '5e5j8rxw': {
      'es': '¡CANJEASTE EL CUPÒN!',
      'en': '',
    },
    '3ww9npwi': {
      'es': 'Fecha y hora del canjeo: ',
      'en': '',
    },
    '8tevq6p5': {
      'es': '¡YA CANJEASTE EL CUPÒN!',
      'en': '',
    },
    'hhx7y0d6': {
      'es': 'Fecha y hora del canjeo: ',
      'en': '',
    },
    'aasaa5jo': {
      'es': 'Home',
      'en': '',
    },
  },
  // CreatePromocion
  {
    'grfxsh51': {
      'es': 'Crear nuevo cupón',
      'en': '',
    },
    'xnixndj2': {
      'es': 'Título del evento',
      'en': '',
    },
    '5b33vk5r': {
      'es': '',
      'en': '',
    },
    '5flofpdn': {
      'es': '‎ ',
      'en': '',
    },
    'r4ay561n': {
      'es': 'Descripción',
      'en': '',
    },
    '5ee3mfly': {
      'es': '‎ ',
      'en': '',
    },
    '9h38ra5y': {
      'es': 'Promoción activa',
      'en': '',
    },
    '05buc49o': {
      'es': '¿El cupón tiene fecha de inicio?',
      'en': '',
    },
    'm5cyvgd2': {
      'es': '¿El cupón tiene fecha de finalización?',
      'en': '',
    },
    'mrdnf6ot': {
      'es': '¿El cupon tiene rango de horario?',
      'en': '',
    },
    'asq4fx8l': {
      'es': 'Inicio',
      'en': '',
    },
    'jm2v01y4': {
      'es': 'Fin',
      'en': '',
    },
    'ag0lppyu': {
      'es': 'Categoría',
      'en': '',
    },
    '1surza76': {
      'es': 'Fiestas',
      'en': '',
    },
    'eusvr034': {
      'es': 'Deportes',
      'en': '',
    },
    'ktmzjtv2': {
      'es': 'Gastronomía',
      'en': '',
    },
    'e2cp3gz2': {
      'es': 'Educación',
      'en': '',
    },
    '9wgelcoa': {
      'es': 'Caridad',
      'en': '',
    },
    '55oaau6l': {
      'es': 'Teatro',
      'en': '',
    },
    '2bfs3l29': {
      'es': 'Música',
      'en': '',
    },
    'bnt1qi6t': {
      'es': 'Turismo',
      'en': '',
    },
    'o3dk3z8u': {
      'es': 'Empresarial',
      'en': '',
    },
    '33dwg69n': {
      'es': 'Infantil',
      'en': '',
    },
    'ftk40dph': {
      'es': 'Otros',
      'en': '',
    },
    'igzw6ykv': {
      'es': 'Fiestas',
      'en': '',
    },
    'kwzgrpqu': {
      'es': 'Crear cupón',
      'en': '',
    },
    'oduqtomn': {
      'es': 'Field is required',
      'en': '',
    },
    'txi8l1px': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'h7bi1gs8': {
      'es': 'Field is required',
      'en': '',
    },
    '54t48ln8': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'b7ik3l6t': {
      'es': 'Field is required',
      'en': '',
    },
    'b40irlko': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '52hhrdv3': {
      'es': 'Field is required',
      'en': '',
    },
    'a1qewv5b': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'o79tydz3': {
      'es': 'Home',
      'en': '',
    },
  },
  // EditUser
  {
    'epprrhbq': {
      'es': 'Editar usuario',
      'en': '',
    },
    'voy277ri': {
      'es': 'Nombre de usuario',
      'en': '',
    },
    '482qx1vd': {
      'es': '',
      'en': '',
    },
    'z9i48brt': {
      'es': 'Email',
      'en': '',
    },
    'cyyfh6sg': {
      'es': 'Descripción',
      'en': '',
    },
    'opq9mnac': {
      'es': 'Enlace para redes sociales',
      'en': '',
    },
    'v1mk9622': {
      'es': '/numberCelular',
      'en': '',
    },
    'm9lwdnd2': {
      'es': '',
      'en': '',
    },
    'nvl6ttoy': {
      'es': '/usernameInstagram',
      'en': '',
    },
    'fnogfk94': {
      'es': '',
      'en': '',
    },
    'i909g65i': {
      'es': '/usernameX',
      'en': '',
    },
    'rrm6hw63': {
      'es': '',
      'en': '',
    },
    '4yxdtkmz': {
      'es': '/usernameTikTok',
      'en': '',
    },
    '4kyjj9jw': {
      'es': '',
      'en': '',
    },
    'gtxo8o3q': {
      'es': 'Usuario profesional',
      'en': '',
    },
    '4pnhqonq': {
      'es': 'Mis fotos',
      'en': '',
    },
    'mxze9pk2': {
      'es': 'Editar usuario',
      'en': '',
    },
    'gk2fiv2x': {
      'es': 'Field is required',
      'en': '',
    },
    'mmdosmv8': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'xscfal3n': {
      'es': 'Field is required',
      'en': '',
    },
    'mdgtryxt': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '93rz8gi4': {
      'es': 'Field is required',
      'en': '',
    },
    'zqkwf9jv': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '1t6sp8k0': {
      'es': 'Field is required',
      'en': '',
    },
    'tzwnhrmg': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ksyz9rkf': {
      'es': 'Home',
      'en': '',
    },
  },
  // AllEvents
  {
    'w4t6uk9d': {
      'es': 'Todos los eventos',
      'en': '',
    },
    'hug8p2ey': {
      'es': '    Buscar...',
      'en': '',
    },
    'ct65g6ij': {
      'es': '',
      'en': '',
    },
    'ofu1gwyp': {
      'es': 'Todos',
      'en': '',
    },
    '1m4ky5z9': {
      'es': 'Comunidad',
      'en': '',
    },
    'r6qr2tb1': {
      'es': 'Fiestas',
      'en': '',
    },
    's80d6rfl': {
      'es': 'Deportes',
      'en': '',
    },
    'xf0ofdku': {
      'es': 'Gastronomía',
      'en': '',
    },
    '31w6uvcr': {
      'es': 'Educación',
      'en': '',
    },
    'ed5g8325': {
      'es': 'Caridad',
      'en': '',
    },
    'qv7vmq3b': {
      'es': 'Teatro',
      'en': '',
    },
    'avmchl7k': {
      'es': 'Música',
      'en': '',
    },
    'd3125el1': {
      'es': 'Turismo',
      'en': '',
    },
    'g6ym55qq': {
      'es': 'Empresarial',
      'en': '',
    },
    '4zk4may3': {
      'es': 'Infantil',
      'en': '',
    },
    '3zdxgj2a': {
      'es': 'Otros',
      'en': '',
    },
    'iyq3nkaa': {
      'es': 'All',
      'en': '',
    },
    'jqaf4nil': {
      'es': 'Crear evento',
      'en': '',
    },
    'z5enxrid': {
      'es': 'Crear cupòn',
      'en': '',
    },
    '3uxwogwy': {
      'es': 'Home',
      'en': '',
    },
  },
  // PantallaAEventus
  {
    'kb1036bx': {
      'es': 'Home',
      'en': '',
    },
  },
  // Login
  {
    'jt6cb5ks': {
      'es': 'Iniciar sesión',
      'en': '',
    },
    'gtku0053': {
      'es': 'Correo o nombre de usuario',
      'en': '',
    },
    'scv5vjam': {
      'es': 'Contraseña',
      'en': '',
    },
    '0wgbc80s': {
      'es': 'Iniciar sesión',
      'en': '',
    },
    'kl6j7gtc': {
      'es': '¿No tienes una cuenta?',
      'en': '',
    },
    'cu5e6kfp': {
      'es': 'Crear cuenta',
      'en': '',
    },
    'fd5f6di3': {
      'es': 'Home',
      'en': '',
    },
  },
  // SignUp
  {
    'bl6q8upc': {
      'es': 'Registrarse con',
      'en': '',
    },
    'd84p3t1j': {
      'es': 'Google',
      'en': '',
    },
    '811e5d29': {
      'es': 'Apple',
      'en': '',
    },
    'x7o7yvsa': {
      'es': 'Facebook',
      'en': '',
    },
    'ghpqflwi': {
      'es': 'Nombre de usuario',
      'en': '',
    },
    'euxy8vkx': {
      'es': 'Correo electrónico',
      'en': '',
    },
    'gevbrmqz': {
      'es': 'Contraseña',
      'en': '',
    },
    '3qv6a7fs': {
      'es': 'Crear cuenta',
      'en': '',
    },
    'y7am0y9x': {
      'es': '¿Ya tienes una cuenta?',
      'en': '',
    },
    'f3yh2wnc': {
      'es': 'Inicia sesión',
      'en': '',
    },
    'gadevcwj': {
      'es': 'Home',
      'en': '',
    },
  },
  // MisCupones
  {
    'mqwptrjr': {
      'es': 'Todos mis cupones guardados',
      'en': '',
    },
    't7xq5rfa': {
      'es': 'Home',
      'en': '',
    },
  },
  // MyProfile
  {
    'scopex55': {
      'es': 'Eventos',
      'en': '',
    },
    'xffb11yu': {
      'es': 'Seguidores',
      'en': '',
    },
    'n4v45rb8': {
      'es': 'Seguidos',
      'en': '',
    },
    'g8agy3rg': {
      'es': 'Editar perfil',
      'en': '',
    },
    'r2uup5to': {
      'es': 'Cerrar sesión',
      'en': '',
    },
    '4ic2cvvt': {
      'es': 'WhatsApp',
      'en': '',
    },
    'lfklr5if': {
      'es': 'Twitter',
      'en': '',
    },
    'mnm51a0v': {
      'es': 'Tik Tok',
      'en': '',
    },
    's3856v8y': {
      'es': 'Instagram',
      'en': '',
    },
    'laq4owqj': {
      'es': 'Mis imagenes',
      'en': '',
    },
    'cr0br54w': {
      'es': 'Mis eventos creados ',
      'en': '',
    },
    '2i23v956': {
      'es': '(',
      'en': '',
    },
    'dy3fi95y': {
      'es': ')',
      'en': '',
    },
    'nv12p14l': {
      'es': 'Eventos a los que estoy unido ',
      'en': '',
    },
    'fheebhho': {
      'es': '(',
      'en': '',
    },
    'n2mfak26': {
      'es': ')',
      'en': '',
    },
    'szmk3y5o': {
      'es': 'Mis cupones guardados',
      'en': '',
    },
    'y4yk6qps': {
      'es': 'Eventos guardados ',
      'en': '',
    },
    'oi1q6v7m': {
      'es': '(',
      'en': '',
    },
    '3yzc27y9': {
      'es': ')',
      'en': '',
    },
    '8kh5x7xf': {
      'es': 'Eventos',
      'en': '',
    },
    'igoped54': {
      'es': 'Seguidores',
      'en': '',
    },
    'x5l77zi9': {
      'es': 'Seguidos',
      'en': '',
    },
    'r6oz8310': {
      'es': 'Editar perfil',
      'en': '',
    },
    'd95jflvh': {
      'es': 'Cerrar sesión',
      'en': '',
    },
    'ecl2vvhq': {
      'es': 'WhatsApp',
      'en': '',
    },
    'iu9viufp': {
      'es': 'Twitter',
      'en': '',
    },
    'dsnoa3st': {
      'es': 'Tik Tok',
      'en': '',
    },
    '9w5igvzp': {
      'es': 'Instagram',
      'en': '',
    },
    'uuk8dsnt': {
      'es': 'Imagenes adicionales',
      'en': '',
    },
    'humoncn1': {
      'es': 'Ubicación del lugar',
      'en': '',
    },
    '5yeq5euj': {
      'es': 'Alvear 800, Rosario, Santa Fe, Argentina',
      'en': '',
    },
    '5o27hmwd': {
      'es': 'Mis cupones',
      'en': '',
    },
    '11mg11pr': {
      'es': 'Ver todos',
      'en': '',
    },
    'l8novv0s': {
      'es': 'Mis eventos',
      'en': '',
    },
    '8bxdqqri': {
      'es': 'Ver todos',
      'en': '',
    },
    '6j59k182': {
      'es': 'Listado de seguidores',
      'en': '',
    },
    'vfx7jiso': {
      'es': 'Listado de seguidos',
      'en': '',
    },
    '1s1pnak4': {
      'es': 'Listado de mis cupones',
      'en': '',
    },
    'i9mldupd': {
      'es': 'Crear evento',
      'en': '',
    },
    'kr3t7jtu': {
      'es': 'Crear cupòn',
      'en': '',
    },
    'cqq9b6wz': {
      'es': 'Listado de eventos',
      'en': '',
    },
    'h9wp1lmc': {
      'es': 'Home',
      'en': '',
    },
  },
  // UserDetail
  {
    'wlpmkidz': {
      'es': 'Volver atrás',
      'en': '',
    },
    'w8vusyf7': {
      'es': 'Eventos',
      'en': '',
    },
    'axdyyop2': {
      'es': 'Seguidores',
      'en': '',
    },
    '29ytkqd9': {
      'es': 'Seguidos',
      'en': '',
    },
    'ky650bqj': {
      'es': 'Seguir',
      'en': '',
    },
    'wcbl37s9': {
      'es': 'Dejar de seguir',
      'en': '',
    },
    'mq2a0cje': {
      'es': 'WhatsApp',
      'en': '',
    },
    '6o2rik4q': {
      'es': 'Instagram',
      'en': '',
    },
    'wjr3tfx9': {
      'es': 'X',
      'en': '',
    },
    'ohn2hqgv': {
      'es': 'Tik Tok',
      'en': '',
    },
    '0ke03pjq': {
      'es': 'Imagenes del usuario',
      'en': '',
    },
    '7wi4o77h': {
      'es': 'Eventos creados por el usuario ',
      'en': '',
    },
    '7jpfxj95': {
      'es': '(',
      'en': '',
    },
    'hwrna9qm': {
      'es': ')',
      'en': '',
    },
    'ymt7sl6x': {
      'es': 'Eventos a los que esta unido el usuario ',
      'en': '',
    },
    'jpzt5h1e': {
      'es': '(',
      'en': '',
    },
    'm0g0uj9i': {
      'es': ')',
      'en': '',
    },
    'vmdd0ncf': {
      'es': 'Eventos que guardo el usuario ',
      'en': '',
    },
    'd9w5xyla': {
      'es': '(',
      'en': '',
    },
    'ufv5gnq8': {
      'es': ')',
      'en': '',
    },
    '4v3wyq2z': {
      'es': 'Eventos',
      'en': '',
    },
    'mukyzhec': {
      'es': 'Seguidores',
      'en': '',
    },
    'fctopes9': {
      'es': 'Seguidos',
      'en': '',
    },
    '47imc0ax': {
      'es': 'Volver atrás',
      'en': '',
    },
    '2qofo96y': {
      'es': 'Seguir',
      'en': '',
    },
    'rwmd7w7w': {
      'es': 'Dejar de seguir',
      'en': '',
    },
    'mnhuafcg': {
      'es': 'WhatsApp',
      'en': '',
    },
    'xvithsqi': {
      'es': 'Instagram',
      'en': '',
    },
    '0f2qeiw2': {
      'es': 'X',
      'en': '',
    },
    'nmhks1au': {
      'es': 'Tik Tok',
      'en': '',
    },
    'f0zme3zl': {
      'es': 'Imagenes adicionales',
      'en': '',
    },
    'ri9d7mfy': {
      'es': 'Ubicación',
      'en': '',
    },
    'fay73723': {
      'es': 'Alvear 800, Rosario, Santa Fe, Argentina',
      'en': '',
    },
    'qipmf8jo': {
      'es': 'Cupones',
      'en': '',
    },
    'zdefmogt': {
      'es': 'Ver todos',
      'en': '',
    },
    'hii3rlvv': {
      'es': 'Eventos',
      'en': '',
    },
    'fs1pxv23': {
      'es': 'Ver todos',
      'en': '',
    },
    'bal64g15': {
      'es': 'Listado de seguidores',
      'en': '',
    },
    'l7hxvucr': {
      'es': 'Listado de seguidos',
      'en': '',
    },
    'wks7izw5': {
      'es': 'Listado de cupones',
      'en': '',
    },
    '4bd2ncm4': {
      'es': 'Listado de eventos',
      'en': '',
    },
    'icz95rbl': {
      'es': 'Home',
      'en': '',
    },
  },
  // EditCupon
  {
    '622bvtba': {
      'es': 'Editar cupón',
      'en': '',
    },
    '2xzpfg9v': {
      'es': 'Título del cupón',
      'en': '',
    },
    'exodo6ff': {
      'es': '',
      'en': '',
    },
    't7bb96sf': {
      'es': 'Descripción',
      'en': '',
    },
    'nebpdwi2': {
      'es': '¿Cupón activo?',
      'en': '',
    },
    '6c55elkw': {
      'es': '¿El cupón tiene fecha de inicio?',
      'en': '',
    },
    'nx4uqr0p': {
      'es': '¿El cupón tiene fecha de finalización?',
      'en': '',
    },
    'ngo4miz0': {
      'es': '¿El cupon tiene rango de horario?',
      'en': '',
    },
    '7jx8iyf2': {
      'es': 'Inicio',
      'en': '',
    },
    't42sj1s4': {
      'es': 'Fin',
      'en': '',
    },
    'qoipdkz6': {
      'es': 'Seleccionar una categoría',
      'en': '',
    },
    'hjg8z41z': {
      'es': 'Create Product',
      'en': '',
    },
    'sp37vohe': {
      'es': 'Fiestas',
      'en': '',
    },
    'f9kau7cq': {
      'es': 'Deportes',
      'en': '',
    },
    'f7zxkhzb': {
      'es': 'Gastronomía',
      'en': '',
    },
    '09xv7rb6': {
      'es': 'Educación',
      'en': '',
    },
    'dfpyfri9': {
      'es': 'Caridad',
      'en': '',
    },
    'vrtu6ors': {
      'es': 'Teatro',
      'en': '',
    },
    's3xkb8c9': {
      'es': 'Música',
      'en': '',
    },
    'kjhp0haj': {
      'es': 'Turismo',
      'en': '',
    },
    'vzroc97a': {
      'es': 'Empresarial',
      'en': '',
    },
    'vcvn561u': {
      'es': 'Infantil',
      'en': '',
    },
    '4tv6fbo8': {
      'es': 'Otros',
      'en': '',
    },
    'sapx6bp0': {
      'es': 'Fiestas',
      'en': '',
    },
    'x19ohz4d': {
      'es': 'Otros',
      'en': '',
    },
    'pkd6f9we': {
      'es': 'Editar cupón',
      'en': '',
    },
    'wufyfs6c': {
      'es': 'Campo obligatorio!',
      'en': '',
    },
    'xuk6aee2': {
      'es': '¡Ingrese un titulo!',
      'en': '',
    },
    'k1vf2nhh': {
      'es': 'El titulo no puede superar los 50 caracteres!',
      'en': '',
    },
    'qwip7l5j': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'uy2jwxd3': {
      'es': 'Field is required',
      'en': '',
    },
    'dt2tlzev': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '3lsvvkdz': {
      'es': 'Home',
      'en': '',
    },
  },
  // MyPromocionDetail
  {
    'ct38214c': {
      'es': 'MI CUPÓN ACTIVO',
      'en': '',
    },
    'xoash5ny': {
      'es': 'Cupón valido hasta',
      'en': '',
    },
    'sx0izxh1': {
      'es': 'Rango de horario para válidez',
      'en': '',
    },
    'djofwzqy': {
      'es': 'a',
      'en': '',
    },
    'gdedel8b': {
      'es': 'Información sobre el cupón',
      'en': '',
    },
    'vwh9io4b': {
      'es': 'Ver cupónes canjeados',
      'en': '',
    },
    '4ezje47o': {
      'es': 'Usuarios que canjearon',
      'en': '',
    },
    'vuqj3727': {
      'es': 'hs',
      'en': '',
    },
    'x3t0ufpg': {
      'es': 'Usuarios que guardaron el cupón',
      'en': '',
    },
    'ckv86pec': {
      'es': 'Cupón sin \ncanjear',
      'en': '',
    },
    'i39qjmkg': {
      'es': 'Cupon\ncanjeado',
      'en': '',
    },
    '2eaq4mej': {
      'es': 'Home',
      'en': '',
    },
  },
  // MyEventDetail
  {
    'c1t8kyz8': {
      'es': 'MI EVENTO',
      'en': '',
    },
    'ha8p2gbb': {
      'es': ' - ',
      'en': '',
    },
    '918z82c1': {
      'es': 'Acerca de este evento',
      'en': '',
    },
    'wowqyg01': {
      'es': 'Ubicación del lugar',
      'en': '',
    },
    'k138lb18': {
      'es': 'Alvear 800, Rosario, Santa Fe, Argentina',
      'en': '',
    },
    '2q819z7d': {
      'es': 'Participantes unidos',
      'en': '',
    },
    'wwezgffh': {
      'es': '(',
      'en': '',
    },
    'kgoae7l4': {
      'es': ')',
      'en': '',
    },
    'nl04qnts': {
      'es': 'Ver todos',
      'en': '',
    },
    '5fyd9jkd': {
      'es': 'Unirme al evento',
      'en': '',
    },
    'uc980v96': {
      'es': 'Salir del evento',
      'en': '',
    },
    '59q8e7ym': {
      'es': 'Cupones activos del usuario',
      'en': '',
    },
    'u5fs9g9x': {
      'es': 'Ver todos',
      'en': '',
    },
    'hogmf1zn': {
      'es': 'Eventos similares',
      'en': '',
    },
    'ut9tvogc': {
      'es': 'Ver todos',
      'en': '',
    },
    '5qkd7xav': {
      'es': 'Ver participantes unidos',
      'en': '',
    },
    'k4p83r9g': {
      'es': 'Usuarios que guardaron el evento',
      'en': '',
    },
    'vav4l9n8': {
      'es': 'Listado de participantes',
      'en': '',
    },
    '33tfjso5': {
      'es': 'Listado de cupones del lugar',
      'en': '',
    },
    '1bjny7de': {
      'es': 'Estadisticas del evento',
      'en': '',
    },
    'yhqadvh0': {
      'es': 'Visualizaciones',
      'en': '',
    },
    'jne09k63': {
      'es': 'Me gustas',
      'en': '',
    },
    'om64m0nn': {
      'es': 'Participantes',
      'en': '',
    },
    '9tiz7l76': {
      'es': 'Home',
      'en': '',
    },
  },
  // CrearEvento1
  {
    '8y3wd5w3': {
      'es': 'Crear nuevo evento',
      'en': '',
    },
    'i1p9epp0': {
      'es': 'Título del evento',
      'en': '',
    },
    '9bvdcqxx': {
      'es': '',
      'en': '',
    },
    '6ybz2pas': {
      'es': 'Este campo es obligatorio!',
      'en': '',
    },
    'awq5yqy4': {
      'es': 'Este campo es obligatorio!',
      'en': '',
    },
    'we3jms3h': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '1rq81tq8': {
      'es': 'Descripción',
      'en': '',
    },
    '3603mj9y': {
      'es': 'Es obligatorio seleccionar al menos una opción',
      'en': '',
    },
    'pxxl43u1': {
      'es': 'Seleccione una o más categorías',
      'en': '',
    },
    'u4nv3av7': {
      'es': 'Fiestas',
      'en': '',
    },
    'eggwy1i3': {
      'es': 'Deportes',
      'en': '',
    },
    'h0d1rxn7': {
      'es': 'Gastronomía',
      'en': '',
    },
    '1s7678yu': {
      'es': 'Educación',
      'en': '',
    },
    'jp43snob': {
      'es': 'Caridad',
      'en': '',
    },
    'bvkq0nt4': {
      'es': 'Teatro',
      'en': '',
    },
    'y8rd6tfx': {
      'es': 'Música',
      'en': '',
    },
    '1ykn168k': {
      'es': 'Turismo',
      'en': '',
    },
    't9xp1s9u': {
      'es': 'Empresarial',
      'en': '',
    },
    'qqbu3l43': {
      'es': 'Infantil',
      'en': '',
    },
    'd7fw78ug': {
      'es': 'Otros',
      'en': '',
    },
    'h3hrtv8x': {
      'es': 'Fiestas',
      'en': '',
    },
    'cuwl8gj6': {
      'es': 'Continuar',
      'en': '',
    },
    'v8wl3ywn': {
      'es': 'Home',
      'en': '',
    },
  },
  // CrearEvento2
  {
    'g7403eqz': {
      'es': 'Configurando evento nuevo',
      'en': '',
    },
    'iak6f5au': {
      'es': '¿El evento tiene una ubicación exacta?',
      'en': '',
    },
    '6ffs2qmm': {
      'es': '¿El evento tiene una fecha?',
      'en': '',
    },
    'lh15a4pw': {
      'es': 'Sin fecha',
      'en': '',
    },
    'vo3k029d': {
      'es': 'Fecha\nexacta',
      'en': '',
    },
    '2uzvc0z4': {
      'es': 'Fecha\nperiódica',
      'en': '',
    },
    'v0ovssa2': {
      'es': 'Ingrese la fecha exacta del evento',
      'en': '',
    },
    'r5hwqz4q': {
      'es': 'Eliga una opción',
      'en': '',
    },
    'isz5lfho': {
      'es': 'Los Lunes',
      'en': '',
    },
    'on3dhy2a': {
      'es': 'Los Martes',
      'en': '',
    },
    'a0hqoshx': {
      'es': 'Los Miércoles',
      'en': '',
    },
    'zs9hx35o': {
      'es': 'Los Jueves',
      'en': '',
    },
    '7fg3isw5': {
      'es': 'Los Viernes',
      'en': '',
    },
    '32urr21t': {
      'es': 'Los Sábados',
      'en': '',
    },
    '303nmsz9': {
      'es': 'Los Domingos',
      'en': '',
    },
    'qzikvkki': {
      'es': 'Fines de semana',
      'en': '',
    },
    'px96mecg': {
      'es': 'Todos los dias',
      'en': '',
    },
    'kaf95cwm': {
      'es': 'Seleccione aqui',
      'en': '',
    },
    '2xdaycr0': {
      'es': 'Search...',
      'en': '',
    },
    'exc3imc6': {
      'es': '¿El evento tiene horario de inicio?',
      'en': '',
    },
    'i0cy4d0c': {
      'es': 'Inicio',
      'en': '',
    },
    's5u8x5x8': {
      'es': '¿El evento tiene horario de fin?',
      'en': '',
    },
    '0993via6': {
      'es': 'Fin',
      'en': '',
    },
    'skzkwxj6': {
      'es': 'Continuar',
      'en': '',
    },
    'n9lxx3h7': {
      'es': 'Home',
      'en': '',
    },
  },
  // CrearEvento3
  {
    '9xx91xhu': {
      'es': 'Terminamos la configuración',
      'en': '',
    },
    '3t81tmwu': {
      'es': '¿Quiere agregar imagenes al evento?',
      'en': '',
    },
    'vk1ez6rf': {
      'es': '¿Desea utilizar alguna funcionalidad?',
      'en': '',
    },
    'tds6e92m': {
      'es': 'Habilitar un listado para que los usuarios se puedan unir',
      'en': '',
    },
    '1jdq41jk': {
      'es': 'El titulo del evento es obligatorio',
      'en': '',
    },
    's00q6r17': {
      'es': 'El titulo del evento es obligatorio',
      'en': '',
    },
    'gayzjys3': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'evit9wao': {
      'es': 'Field is required',
      'en': '',
    },
    'vy5istmw': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fq5tucs4': {
      'es': 'Crear evento',
      'en': '',
    },
    'duohs6b1': {
      'es': 'Home',
      'en': '',
    },
  },
  // EditarEvento
  {
    'u3lknu4t': {
      'es': 'Editar evento',
      'en': '',
    },
    'x0korhvb': {
      'es': '¿Quiere agregar imagenes al evento?',
      'en': '',
    },
    '4ziyfcvm': {
      'es': 'Título del evento',
      'en': '',
    },
    'h3v39lqe': {
      'es': '',
      'en': '',
    },
    'va59tvvh': {
      'es': 'Descripción',
      'en': '',
    },
    'q0v3z3gl': {
      'es': 'Ubicacion exacta del evento',
      'en': '',
    },
    'eqjwmagt': {
      'es': 'Fecha del evento',
      'en': '',
    },
    'kv8vwikk': {
      'es': 'Sin fecha',
      'en': '',
    },
    'da4mzl8s': {
      'es': 'Fecha\nexacta',
      'en': '',
    },
    'qfz3u1i1': {
      'es': 'Fecha\nperiódica',
      'en': '',
    },
    'g8ifx3gx': {
      'es': 'Fecha exacta del evento',
      'en': '',
    },
    'ycuivowp': {
      'es': 'Eliga la opción que corresponda',
      'en': '',
    },
    'mwwemsx9': {
      'es': 'Los Lunes',
      'en': '',
    },
    'gprnz2hg': {
      'es': 'Los Martes',
      'en': '',
    },
    '9ipn1rsl': {
      'es': 'Los Miércoles',
      'en': '',
    },
    'px3ph4s3': {
      'es': 'Los Jueves',
      'en': '',
    },
    'l6rpf2s2': {
      'es': 'Los Viernes',
      'en': '',
    },
    'uo61jzjp': {
      'es': 'Los Sábados',
      'en': '',
    },
    'j2uq6xel': {
      'es': 'Los Domingos',
      'en': '',
    },
    'i5v7376h': {
      'es': 'Fines de semana',
      'en': '',
    },
    'avhikknj': {
      'es': 'Todos los dias',
      'en': '',
    },
    'ohefk4j1': {
      'es': 'Seleccione aqui',
      'en': '',
    },
    'ze94u3pk': {
      'es': 'Search...',
      'en': '',
    },
    '680sb2ua': {
      'es': 'Horario de inicio del evento',
      'en': '',
    },
    'jaunohs7': {
      'es': 'Inicio',
      'en': '',
    },
    'gnozqc3p': {
      'es': 'Horario de fin del evento',
      'en': '',
    },
    'kn5z1l9i': {
      'es': 'Fin',
      'en': '',
    },
    'mpms5204': {
      'es': 'Seleccione una o más categorías',
      'en': '',
    },
    'ebml977f': {
      'es': 'Fiestas',
      'en': '',
    },
    'cp05cxad': {
      'es': 'Deportes',
      'en': '',
    },
    'gc94meqp': {
      'es': 'Gastronomía',
      'en': '',
    },
    'mdi1g58e': {
      'es': 'Educación',
      'en': '',
    },
    'cvezslz2': {
      'es': 'Caridad',
      'en': '',
    },
    '3cwlgrxw': {
      'es': 'Teatro',
      'en': '',
    },
    '7d0z49ab': {
      'es': 'Música',
      'en': '',
    },
    'fh9er8t7': {
      'es': 'Turismo',
      'en': '',
    },
    'ntumzs2d': {
      'es': 'Empresarial',
      'en': '',
    },
    'mjxq10vv': {
      'es': 'Infantil',
      'en': '',
    },
    'dm5lhf3r': {
      'es': 'Otros',
      'en': '',
    },
    'bp3wi5mf': {
      'es': 'Fiestas',
      'en': '',
    },
    'g7w103ag': {
      'es': 'Otros',
      'en': '',
    },
    'lzwtg8xb': {
      'es': 'Seleccione las funcionalidades que desee',
      'en': '',
    },
    'lkm9q68p': {
      'es':
          'Permitir unirse al evento y visualizar el listado de participantes unidos',
      'en': '',
    },
    'bajqyt8c': {
      'es': 'Continuar',
      'en': '',
    },
    'mb7yypcm': {
      'es': '¿Confirma editar este evento?',
      'en': '',
    },
    'm84d3de6': {
      'es': 'Cancelar',
      'en': '',
    },
    'f8c35d4t': {
      'es': 'Confirmar',
      'en': '',
    },
    'p66arv9g': {
      'es': 'Home',
      'en': '',
    },
  },
  // TESTS
  {
    '5nnqb7z4': {
      'es': 'Home',
      'en': '',
    },
  },
  // HomeAdmin
  {
    'dqnrzgd2': {
      'es': 'Todos los usuarios',
      'en': '',
    },
    'oneao3nz': {
      'es': 'Listado completo de usuarios registrados',
      'en': '',
    },
    'ou4n6fav': {
      'es': 'Todos los eventos',
      'en': '',
    },
    'o23ot46e': {
      'es': 'Listado completo de eventos creados',
      'en': '',
    },
    'ppea8m00': {
      'es': 'Todos los cupones',
      'en': '',
    },
    'irvnp66s': {
      'es': 'Listado completo de cupones creados',
      'en': '',
    },
    'b4t9hmde': {
      'es': 'Volver atrás',
      'en': '',
    },
    'ri2fl0eh': {
      'es': 'Panel de administrador',
      'en': '',
    },
    'ix0lruet': {
      'es': 'Home',
      'en': '',
    },
  },
  // EventAdmin
  {
    'qayzv3xx': {
      'es': 'Listado de eventos',
      'en': '',
    },
    'cu7fk8l5': {
      'es': '    Buscar...',
      'en': '',
    },
    '65pve3bl': {
      'es': '',
      'en': '',
    },
    '0e5m9ekb': {
      'es': 'Todos',
      'en': '',
    },
    '5nwzhlep': {
      'es': 'Comunidad',
      'en': '',
    },
    'hjh3h641': {
      'es': 'Fiestas',
      'en': '',
    },
    'ayap3q2k': {
      'es': 'Deportes',
      'en': '',
    },
    'bx0mwffq': {
      'es': 'Gastronomía',
      'en': '',
    },
    'ms6xnlaw': {
      'es': 'Educación',
      'en': '',
    },
    'kxa0umu7': {
      'es': 'Caridad',
      'en': '',
    },
    '4l1sk7by': {
      'es': 'Teatro',
      'en': '',
    },
    'j46x44pn': {
      'es': 'Música',
      'en': '',
    },
    '7dgv79q6': {
      'es': 'Turismo',
      'en': '',
    },
    'ct9oncoz': {
      'es': 'Empresarial',
      'en': '',
    },
    'mdxr3ekq': {
      'es': 'Infantil',
      'en': '',
    },
    'n8jzttgz': {
      'es': 'Otros',
      'en': '',
    },
    'veh9y5cn': {
      'es': 'Todos',
      'en': '',
    },
    '9nsvkt2w': {
      'es': 'All',
      'en': '',
    },
    '9yo8s9nn': {
      'es': 'Home',
      'en': '',
    },
  },
  // UserAdmin
  {
    'amduwk76': {
      'es': 'Listado de usuarios',
      'en': '',
    },
    '5f5phv8j': {
      'es': '    Buscar...',
      'en': '',
    },
    '5wr0x4gf': {
      'es': '',
      'en': '',
    },
    'fqopujoc': {
      'es': 'Todos',
      'en': '',
    },
    '4u2x8yic': {
      'es': 'Comunidad',
      'en': '',
    },
    'i3tah3py': {
      'es': 'Profesionales',
      'en': '',
    },
    'tji2qiwt': {
      'es': 'Todos',
      'en': '',
    },
    'sk4eirez': {
      'es': 'All',
      'en': '',
    },
    'iazbfh0j': {
      'es': 'Home',
      'en': '',
    },
  },
  // CuponesAdmin
  {
    '174x1ucg': {
      'es': 'Listado de cupones',
      'en': '',
    },
    'ek3of3j1': {
      'es': '    Buscar...',
      'en': '',
    },
    'gzcy3p7u': {
      'es': '',
      'en': '',
    },
    'geiggfms': {
      'es': 'Todos',
      'en': '',
    },
    'm7rd4oko': {
      'es': 'Fiestas',
      'en': '',
    },
    '5raz4m1c': {
      'es': 'Deportes',
      'en': '',
    },
    '4khvcof0': {
      'es': 'Gastronomía',
      'en': '',
    },
    'utycb5f9': {
      'es': 'Educación',
      'en': '',
    },
    '79fwx7gw': {
      'es': 'Caridad',
      'en': '',
    },
    'dcw0ljj0': {
      'es': 'Teatro',
      'en': '',
    },
    'o0tl6uo3': {
      'es': 'Música',
      'en': '',
    },
    '4vetgm6w': {
      'es': 'Turismo',
      'en': '',
    },
    'bfshchf8': {
      'es': 'Empresarial',
      'en': '',
    },
    'jxxyttje': {
      'es': 'Infantil',
      'en': '',
    },
    '2hofxhdb': {
      'es': 'Otros',
      'en': '',
    },
    'g1hrf99p': {
      'es': 'Todos',
      'en': '',
    },
    'v008y74k': {
      'es': 'All',
      'en': '',
    },
    'ffsee2mt': {
      'es': 'Home',
      'en': '',
    },
  },
  // MyeventCreado
  {
    'wdmzok4q': {
      'es': '¿Esta seguro de borrar este evento?',
      'en': '',
    },
    '8hufeyjp': {
      'es': 'Cancelar',
      'en': '',
    },
    'f4607vad': {
      'es': 'Borrar',
      'en': '',
    },
    '1gonwaq8': {
      'es': 'Acciones',
      'en': '',
    },
    '5skhcp5m': {
      'es': 'Borrar',
      'en': '',
    },
    'oohtz4ca': {
      'es': 'Editar',
      'en': '',
    },
  },
  // AlertDelete
  {
    '74oshf6s': {
      'es': '¿Quiere borrar este evento?',
      'en': '',
    },
    'q38znpqq': {
      'es': 'Cancelar',
      'en': '',
    },
    '4qo1oo2r': {
      'es': 'Borrar',
      'en': '',
    },
  },
  // MyCuponCreado
  {
    'fnrztc96': {
      'es': '¿Borrar el cupón?',
      'en': '',
    },
    'rz9oafeu': {
      'es': 'Cancelar',
      'en': '',
    },
    'ppee1xc5': {
      'es': 'Borrar',
      'en': '',
    },
    'dlsw9az1': {
      'es': 'Borrar',
      'en': '',
    },
    '7yqydf5b': {
      'es': 'Editar',
      'en': '',
    },
  },
  // userHorizontalCard
  {
    'wgnhgm7s': {
      'es': 'Seguir',
      'en': '',
    },
    '4czzmzi1': {
      'es': 'Dejar de seguir',
      'en': '',
    },
  },
  // userProfesionalCard
  {
    'ewmxy7j3': {
      'es': ' eventos activos',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'd08t76nf': {
      'es': '',
      'en': '',
    },
    'sbcp8rk9': {
      'es': '',
      'en': '',
    },
    'i1yx6l1q': {
      'es': '',
      'en': '',
    },
    'yu5h46tp': {
      'es': '',
      'en': '',
    },
    'tmdhk6xh': {
      'es': '',
      'en': '',
    },
    'xj9xr1ec': {
      'es': '',
      'en': '',
    },
    'v3vqv0c4': {
      'es': '',
      'en': '',
    },
    'mzo4vd8q': {
      'es': '',
      'en': '',
    },
    'sv7xwop6': {
      'es': '',
      'en': '',
    },
    'zu09uqi9': {
      'es': '',
      'en': '',
    },
    'cm7t8rch': {
      'es': '',
      'en': '',
    },
    'wx2epys3': {
      'es': '',
      'en': '',
    },
    'izs32kyy': {
      'es': '',
      'en': '',
    },
    'cw65s0ej': {
      'es': '',
      'en': '',
    },
    'po5vpfsu': {
      'es': '',
      'en': '',
    },
    'wlbweehq': {
      'es': '',
      'en': '',
    },
    'v1ya3r2v': {
      'es': '',
      'en': '',
    },
    '1c7yz32u': {
      'es': '',
      'en': '',
    },
    'ytt5jd9v': {
      'es': '',
      'en': '',
    },
    'f0hrkwx6': {
      'es': '',
      'en': '',
    },
    '85jt0pie': {
      'es': '',
      'en': '',
    },
    't67jzcie': {
      'es': '',
      'en': '',
    },
    '7jvolh9n': {
      'es': '',
      'en': '',
    },
    'dlhhijef': {
      'es': '',
      'en': '',
    },
    'nlucjf3w': {
      'es': '',
      'en': '',
    },
    'epfxcjrg': {
      'es': '',
      'en': '',
    },
    '3glmt9d7': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
