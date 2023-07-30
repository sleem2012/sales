// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/services.dart';

import '../../../../views/widgets/date_picker.dart';
import '../../../shared/error/error_422_model.dart';
import '../../model/allowed_inputs.dart';
import '../../model/date_ranges/date_ranges_union.dart';
import '../../model/dynamic_ui_model.dart';
import '../../model/measurement/measurements.dart';

enum DuiPostMapType { valuesWithId, valuesWithKey, answerCollection, groupedAnswerCollection }

class DynamicUiVM {
  DynamicUiVM._();
  static AllowedInputs allowedInput(DUIFieldModel field) {
    return field.keyboard.when(
      integer: () => AllowedInputs(
        inputType: TextInputType.number,
        fieldFormatModel: field.format,
        formatter: [FilteringTextInputFormatter.allow(RegExp("^-?\\d*"))],
      ),
      name: () => AllowedInputs(
        inputType: TextInputType.name,
        fieldFormatModel: field.format,
        formatter: [FilteringTextInputFormatter.deny(RegExp(r'[0-9_\-=@,\.;]+$'))],
      ),
      phone: () => AllowedInputs(
        isPhone: true,
        inputType: const TextInputType.numberWithOptions(decimal: false, signed: false),
        fieldFormatModel: field.format,
        formatter: [FilteringTextInputFormatter.digitsOnly],
      ),
      money: () => doubleInputs(field),
      quantity: () => AllowedInputs(
        inputType: TextInputType.number,
        fieldFormatModel: field.format,
        formatter: [
          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
          FilteringTextInputFormatter.deny(RegExp(r'^0+')),
        ],
      ),
      password: () => AllowedInputs(inputType: TextInputType.visiblePassword, obscure: true, fieldFormatModel: field.format, formatter: []),
      number: () => AllowedInputs(inputType: TextInputType.number, fieldFormatModel: field.format, formatter: []),
      email: () => AllowedInputs(inputType: TextInputType.emailAddress, fieldFormatModel: field.format, formatter: []),
      dateTime: () => AllowedInputs(
        inputType: TextInputType.name,
        dateTimePickerType: field.format?.format.toString() == 'h' ? KDateTimePickerType.dateTimeHijri : KDateTimePickerType.dateTimeGregorian,
        fieldFormatModel: field.format,
        formatter: [],
      ),
      time: () =>
          AllowedInputs(inputType: TextInputType.name, dateTimePickerType: KDateTimePickerType.time, fieldFormatModel: field.format, formatter: []),
      date: () => AllowedInputs(
        inputType: TextInputType.name,
        dateTimePickerType: field.format?.format.toString() == 'h' ? KDateTimePickerType.dateHijri : KDateTimePickerType.dateGregorian,
        fieldFormatModel: field.format,
        formatter: [],
      ),
      string: () => AllowedInputs(inputType: TextInputType.name, fieldFormatModel: field.format, formatter: []),
      barcode: () => AllowedInputs(inputType: TextInputType.name, fieldFormatModel: field.format, formatter: []),
      avatar: () => AllowedInputs(inputType: TextInputType.name, fieldFormatModel: field.format, formatter: [], isAvatar: true),
      file: () => AllowedInputs(inputType: TextInputType.name, fieldFormatModel: field.format, formatter: [], isAvatar: false),
      duration: () => doubleInputs(field).copyWith(measurementsConversion: MeasurementsUnits.duration),
      length: () => doubleInputs(field).copyWith(measurementsConversion: MeasurementsUnits.length),
      volume: () => doubleInputs(field).copyWith(measurementsConversion: MeasurementsUnits.volume),
      weight: () => doubleInputs(field).copyWith(measurementsConversion: MeasurementsUnits.weight),
    );
  }

  static DateTuple dateList(DUIFieldModel field) {
    DateTuple dateTuple = dateRange(field);

    final fieldFormatModel = DynamicUiVM.allowedInput(field).fieldFormatModel;
    final init = DateTime.tryParse(fieldFormatModel?.initial.toString() ?? "");
    final min = DateTime.tryParse(fieldFormatModel?.min.toString() ?? "");
    final max = DateTime.tryParse(fieldFormatModel?.max.toString() ?? "");
    if (init != null) dateTuple = dateTuple.copyWith(init: init);
    if (min != null) dateTuple = dateTuple.copyWith(min: min);
    if (max != null) dateTuple = dateTuple.copyWith(max: max);


    // final init = DateTime.tryParse(fieldFormatModel?.initial.toString() ?? "") ?? DateTime.tryParse(fieldFormatModel?.min ?? "") ?? list.init;
    // final min = DateTime.tryParse(fieldFormatModel?.min.toString() ?? "") ?? list.min;
    // final max = DateTime.tryParse(fieldFormatModel?.max.toString() ?? "") ?? list.max;
    // List<DateTime?> dateList = [init, min, max]..sort((a, b) => a.compareTo(b));
    return dateTuple;
  }

  static DateTuple dateRange(DUIFieldModel field) {
    final fieldFormatModel = DynamicUiVM.allowedInput(field).fieldFormatModel;
    List<DateTime> dates = [];

    final date = DynamicDateRanges.fromString(fieldFormatModel?.date.toString());
    date.when(
      present: () => dates = [DateTime.now(), DateTime.now(), DateTime(DateTime.now().year + 100)],
      past: () => dates = [DateTime(DateTime.now().year - 100), DateTime.now(), DateTime.now()],
      plus18: () => dates = [DateTime(DateTime.now().year - 100), DateTime(DateTime.now().year - 18), DateTime(DateTime.now().year - 18)],
      plus21: () => dates = [DateTime(DateTime.now().year - 100), DateTime(DateTime.now().year - 21), DateTime(DateTime.now().year - 21)],
      non: () => dates = [DateTime(DateTime.now().year - 100), DateTime.now(), DateTime(DateTime.now().year + 100)],
    );
    dates.sort((a, b) => a.compareTo(b));
    return DateTuple(min: dates[0], mid: dates[1], max: dates[2]);
  }

  static String? error422Text(String key, failure) {
    Error422Model? error422model = failure?.maybeWhen(orElse: () => null, error422: (error422model) => error422model);
    String? e;
    for (var error in error422model?.errors.values.toList() ?? <List<String>>[]) {
      if (error.first.toString().contains(key)) {
        e = error.first.replaceAll("The", '').replaceAll(key, '').replaceAll('.', '');
      }
    }
    return e;
  }
}

AllowedInputs doubleInputs(field) {
  return AllowedInputs(
    inputType: TextInputType.number,
    fieldFormatModel: field.format,
    formatter: [
      FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
      FilteringTextInputFormatter.deny(RegExp(r'^0+')),
    ],
  );
}

class DateTuple {
  final DateTime min;
  final DateTime mid;
  final DateTime max;
  final DateTime? init;
  const DateTuple({
    required this.min,
    required this.mid,
    required this.max,
    this.init,
  });

  @override
  bool operator ==(covariant DateTuple other) {
    if (identical(this, other)) return true;

    return other.init == init && other.min == min && other.max == max && other.mid == mid;
  }

  @override
  int get hashCode {
    return init.hashCode ^ min.hashCode ^ max.hashCode ^ mid.hashCode;
  }

  DateTuple copyWith({
    DateTime? min,
    DateTime? mid,
    DateTime? max,
    DateTime? init,
  }) {
    return DateTuple(
      min: min ?? this.min,
      mid: mid ?? this.mid,
      max: max ?? this.max,
      init: init ?? this.init,
    );
  }
}
