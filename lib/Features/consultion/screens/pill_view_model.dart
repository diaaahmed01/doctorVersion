// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class PillViewModel {
  final String? pillName;
  final DateTime? beginDate;
  final DateTime? endDate;
  final TimeOfDay? time;
  final String? pillsNumber;
  final String? howTOUse;
  PillViewModel(
    this.pillName,
    this.beginDate,
    this.endDate,
    this.time,
    this.pillsNumber,
    this.howTOUse,
  );
  factory PillViewModel.newPill() {
    return PillViewModel(null, null, null, null, null, null);
  }
  bool get nameIsVaild => nameValidator(pillName) == null;
  bool get beginDateeIsVaild => beginDateVaildator(beginDate) == null;
  bool get endDateIsVaild => endDateVaildator(beginDate, endDate) == null;
  bool get timeIsVaild => timeVaildator(time) == null;
  bool get pillsNumberIsVaild => pillsNumberVaildator(pillsNumber) == null;
  bool get howTOUseIsVaild => howTOUseVaildator(howTOUse) == null;

  bool isValid() =>
      nameIsVaild &&
      beginDateeIsVaild &&
      endDateIsVaild &&
      timeIsVaild &&
      pillsNumberIsVaild &&
      howTOUseIsVaild;

  String? nameValidator(String? s) {
    if (s == null || s.isWhitespace()) {
      return 'required';
    }
  }

  String? beginDateVaildator(DateTime? s) {
    final now = DateTime.now();
    if (s == null) {
      return 'required';
    }
    if (!s.isBefore(DateTime(now.year, now.month, now.day))) {
      return 'invalid date';
    }
  }

  String? endDateVaildator(
    DateTime? s,
    DateTime? e,
  ) {
    final now = DateTime.now();
    if (e == null) {
      return 'required';
    }
    if (!e.isBefore(DateTime(now.year, now.month, now.day))) {
      return 'invalid date';
    }
    if (e == s) {
      return 'Start and finish dates can\'t be the same';
    }
  }

  String? timeVaildator(TimeOfDay? s) {
    if (s == null) {
      return 'required';
    }
  }

  String? pillsNumberVaildator(String? s) {
    if (s == null || s.isWhitespace()) {
      return 'required';
    }
  }

  String? howTOUseVaildator(String? s) {
    if (s == null || s.isWhitespace()) {
      return 'required';
    }
  }

  PillViewModel copyWith({
    String? pillName,
    DateTime? beginDate,
    DateTime? endDate,
    TimeOfDay? time,
    String? pillsNumber,
    String? howTOUse,
  }) {
    return PillViewModel(
      pillName ?? this.pillName,
      beginDate ?? this.beginDate,
      endDate ?? this.endDate,
      time ?? this.time,
      pillsNumber ?? this.pillsNumber,
      howTOUse ?? this.howTOUse,
    );
  }

  @override
  String toString() {
    return 'PillModel($pillName, $pillsNumber, $time, $beginDate, $endDate, $howTOUse)';
  }
}

extension StringExtensions on String {
  bool isWhitespace() => this.trim().isEmpty;
}
