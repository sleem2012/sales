bool? _isEmpty(dynamic value) {
  if (value is String) {
    return value.toString().trim().isEmpty;
  }
  if (value is Iterable || value is Map) {
    return value.isEmpty as bool?;
  }
  return false;
}

bool _hasLength(dynamic value) {
  return value is Iterable || value is String || value is Map;
}



int? _obtainDynamicLength(dynamic value) {
  if (value == null) {
    return null;
  }

  if (_hasLength(value)) {
    return value.length as int?;
  }

  if (value is int) {
    return value.toString().length;
  }

  if (value is double) {
    return value.toString().replaceAll('.', '').length;
  }

  return null;
}

class AppUtils {
  AppUtils._();

  static bool isNull(dynamic value) => value == null;

  static dynamic nil(dynamic s) => s;

  static bool? isNullOrBlank(dynamic value) {
    if (isNull(value)) {
      return true;
    }

    return _isEmpty(value);
  }

  static bool? isBlank(dynamic value) {
    return _isEmpty(value);
  }

  static bool isNum(String value) {
    if (isNull(value)) {
      return false;
    }

    return num.tryParse(value) is num;
  }

  static bool isNumericOnly(String s) => hasMatch(s, r'^\d+$');

  static bool isAlphabetOnly(String s) => hasMatch(s, r'^[a-zA-Z]+$');

  static bool hasCapitalletter(String s) => hasMatch(s, r'[A-Z]');

  static bool isBool(String value) {
    if (isNull(value)) {
      return false;
    }

    return (value == 'true' || value == 'false');
  }

  static bool isVideo(String filePath) {
    var ext = filePath.toLowerCase();

    return ext.endsWith(".mp4") ||
        ext.endsWith(".avi") ||
        ext.endsWith(".wmv") ||
        ext.endsWith(".rmvb") ||
        ext.endsWith(".mpg") ||
        ext.endsWith(".mpeg") ||
        ext.endsWith(".3gp");
  }

  static bool isImage(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".jpg") || ext.endsWith(".jpeg") || ext.endsWith(".png") || ext.endsWith(".gif") || ext.endsWith(".bmp");
  }

  static bool isAudio(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".mp3") || ext.endsWith(".wav") || ext.endsWith(".wma") || ext.endsWith(".amr") || ext.endsWith(".ogg");
  }

  static bool isPPT(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".ppt") || ext.endsWith(".pptx");
  }

  static bool isWord(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".doc") || ext.endsWith(".docx");
  }

  static bool isExcel(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".xls") || ext.endsWith(".xlsx");
  }

  static bool isAPK(String filePath) {
    return filePath.toLowerCase().endsWith(".apk");
  }

  static bool isPDF(String filePath) {
    return filePath.toLowerCase().endsWith(".pdf");
  }

  static bool isTxt(String filePath) {
    return filePath.toLowerCase().endsWith(".txt");
  }

  static bool isChm(String filePath) {
    return filePath.toLowerCase().endsWith(".chm");
  }

  static bool isVector(String filePath) {
    return filePath.toLowerCase().endsWith(".svg");
  }

  static bool isHTML(String filePath) {
    return filePath.toLowerCase().endsWith(".html");
  }

  static bool isUsername(String s) => hasMatch(s, r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$');

  static bool isURL(String s) => hasMatch(s,
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",);

  static bool isEmail(String s) => hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',);

  static bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  static bool isDateTime(String s) => hasMatch(s, r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$');

  static bool isMD5(String s) => hasMatch(s, r'^[a-f0-9]{32}$');

  static bool isSHA1(String s) => hasMatch(s, r'(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})');

  static bool isSHA256(String s) => hasMatch(s, r'([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}');

  static bool isSSN(String s) => hasMatch(s, r'^(?!0{3}|6{3}|9[0-9]{2})[0-9]{3}-?(?!0{2})[0-9]{2}-?(?!0{4})[0-9]{4}$');

  static bool isBinary(String s) => hasMatch(s, r'^[0-1]+$');

  static bool isIPv4(String s) => hasMatch(s, r'^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$');

  static bool isIPv6(String s) => hasMatch(s,
      r'^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$',);

  static bool isHexadecimal(String s) => hasMatch(s, r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');

  static bool isPalindrom(String string) {
    final cleanString = string.toLowerCase().replaceAll(RegExp(r"\s+"), '').replaceAll(RegExp(r"[^0-9a-zA-Z]+"), "");

    for (var i = 0; i < cleanString.length; i++) {
      if (cleanString[i] != cleanString[cleanString.length - i - 1]) {
        return false;
      }
    }

    return true;
  }

  static bool isOneAKind(dynamic value) {
    if ((value is String || value is List) && !isNullOrBlank(value)!) {
      final first = value[0];
      final len = value.length as num;

      for (var i = 0; i < len; i++) {
        if (value[i] != first) {
          return false;
        }
      }

      return true;
    }

    if (value is int) {
      final stringValue = value.toString();
      final first = stringValue[0];

      for (var i = 0; i < stringValue.length; i++) {
        if (stringValue[i] != first) {
          return false;
        }
      }

      return true;
    }

    return false;
  }

  static bool isPassport(String s) => hasMatch(s, r'^(?!^0+$)[a-zA-Z0-9]{6,9}$');

  static bool isCurrency(String s) => hasMatch(s,
      r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$',);

  static bool isLengthGreaterThan(dynamic value, int maxLength) {
    final length = _obtainDynamicLength(value);

    if (length == null) {
      return false;
    }

    return length > maxLength;
  }

  static bool isLengthGreaterOrEqual(dynamic value, int maxLength) {
    final length = _obtainDynamicLength(value);

    if (length == null) {
      return false;
    }

    return length >= maxLength;
  }

  static bool isLengthLowerThan(dynamic value, int maxLength) => isLengthLessThan(value, maxLength);

  static bool isLengthLessThan(dynamic value, int maxLength) {
    final length = _obtainDynamicLength(value);
    if (length == null) {
      return false;
    }

    return length < maxLength;
  }

  static bool isLengthLowerOrEqual(dynamic value, int maxLength) => isLengthLessOrEqual(value, maxLength);

  static bool isLengthLessOrEqual(dynamic value, int maxLength) {
    final length = _obtainDynamicLength(value);

    if (length == null) {
      return false;
    }

    return length <= maxLength;
  }

  static bool isLengthEqualTo(dynamic value, int otherLength) {
    final length = _obtainDynamicLength(value);

    if (length == null) {
      return false;
    }

    return length == otherLength;
  }

  static bool isLengthBetween(dynamic value, int minLength, int maxLength) {
    if (isNull(value)) {
      return false;
    }

    return isLengthGreaterOrEqual(value, minLength) && isLengthLessOrEqual(value, maxLength);
  }

  static bool isCaseInsensitiveContains(String a, String b) {
    return a.toLowerCase().contains(b.toLowerCase());
  }

  static bool isCaseInsensitiveContainsAny(String a, String b) {
    final lowA = a.toLowerCase();
    final lowB = b.toLowerCase();

    return lowA.contains(lowB) || lowB.contains(lowA);
  }

  static bool isLowerThan(num a, num b) => a < b;

  static bool isGreaterThan(num a, num b) => a > b;

  static bool isEqual(num a, num b) => a == b;

  static bool isCnpj(String cnpj) {
    final numbers = cnpj.replaceAll(RegExp(r'[^0-9]'), '');

    if (numbers.length != 14) {
      return false;
    }

    if (RegExp(r'^(\d)\1*$').hasMatch(numbers)) {
      return false;
    }

    final digits = numbers.split('').map(int.parse).toList();

    var calcDv1 = 0;
    var j = 0;
    for (var i in Iterable<int>.generate(12, (i) => i < 4 ? 5 - i : 13 - i)) {
      calcDv1 += digits[j++] * i;
    }
    calcDv1 %= 11;
    final dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    if (digits[12] != dv1) {
      return false;
    }

    var calcDv2 = 0;
    j = 0;
    for (var i in Iterable<int>.generate(13, (i) => i < 5 ? 6 - i : 14 - i)) {
      calcDv2 += digits[j++] * i;
    }
    calcDv2 %= 11;
    final dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    if (digits[13] != dv2) {
      return false;
    }

    return true;
  }

  static bool isCpf(String cpf) {
    final numbers = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    if (numbers.length != 11) {
      return false;
    }

    if (RegExp(r'^(\d)\1*$').hasMatch(numbers)) {
      return false;
    }

    final digits = numbers.split('').map(int.parse).toList();

    var calcDv1 = 0;
    for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calcDv1 += digits[10 - i] * i;
    }
    calcDv1 %= 11;

    final dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    if (digits[9] != dv1) {
      return false;
    }

    var calcDv2 = 0;
    for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calcDv2 += digits[11 - i] * i;
    }
    calcDv2 %= 11;

    final dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    if (digits[10] != dv2) {
      return false;
    }

    return true;
  }

  static String? capitalize(String value) {
    if (isNull(value)) return null;
    if (isBlank(value)!) return value;
    return value.split(' ').map(capitalizeFirst).join(' ');
  }

  static String? capitalizeFirst(String s) {
    if (isNull(s)) return null;
    if (isBlank(s)!) return s;
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  static String removeAllWhitespace(String value) {
    return value.replaceAll(' ', '');
  }

  static String? camelCase(String value) {
    if (isNullOrBlank(value)!) {
      return null;
    }

    final separatedWords = value.split(RegExp(r'[!@#<>?":`~;[\]\\|=+)(*&^%-\s_]+'));
    var newString = '';

    for (final word in separatedWords) {
      newString += word[0].toUpperCase() + word.substring(1).toLowerCase();
    }

    return newString[0].toLowerCase() + newString.substring(1);
  }

  static final RegExp _upperAlphaRegex = RegExp(r'[A-Z]');
  static final _symbolSet = {' ', '.', '/', '_', '\\', '-'};
  static List<String> _groupIntoWords(String text) {
    var sb = StringBuffer();
    var words = <String>[];
    var isAllCaps = text.toUpperCase() == text;

    for (var i = 0; i < text.length; i++) {
      var char = text[i];
      var nextChar = i + 1 == text.length ? null : text[i + 1];
      if (_symbolSet.contains(char)) {
        continue;
      }
      sb.write(char);
      var isEndOfWord = nextChar == null || (_upperAlphaRegex.hasMatch(nextChar) && !isAllCaps) || _symbolSet.contains(nextChar);
      if (isEndOfWord) {
        words.add('$sb');
        sb.clear();
      }
    }
    return words;
  }

  static String? snakeCase(String? text, {String separator = '_'}) {
    if (isNullOrBlank(text)!) {
      return null;
    }
    return _groupIntoWords(text!).map((word) => word.toLowerCase()).join(separator);
  }

  static String? paramCase(String? text) => snakeCase(text, separator: '-');

  static String numericOnly(String s, {bool firstWordOnly = false}) {
    var numericOnlyStr = '';

    for (var i = 0; i < s.length; i++) {
      if (isNumericOnly(s[i])) {
        numericOnlyStr += s[i];
      }
      if (firstWordOnly && numericOnlyStr.isNotEmpty && s[i] == " ") {
        break;
      }
    }

    return numericOnlyStr;
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static String createPath(String path, [Iterable? segments]) {
    if (segments == null || segments.isEmpty) {
      return path;
    }
    final list = segments.map((e) => '/$e');
    return path + list.join();
  }
}

typedef PrintFunctionCallback = void Function(
  String prefix,
  dynamic value,
  String info, {
  bool? isError,
});
