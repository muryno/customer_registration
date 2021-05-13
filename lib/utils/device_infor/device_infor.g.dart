// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_infor.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DeviceInfo on _DeviceInfo, Store {
  Computed<String> _$deviceNameComputed;

  @override
  String get deviceName =>
      (_$deviceNameComputed ??= Computed<String>(() => super.deviceName,
              name: '_DeviceInfo.deviceName'))
          .value;

  final _$deviceDataAtom = Atom(name: '_DeviceInfo.deviceData');

  @override
  String get deviceData {
    _$deviceDataAtom.reportRead();
    return super.deviceData;
  }

  @override
  set deviceData(String value) {
    _$deviceDataAtom.reportWrite(value, super.deviceData, () {
      super.deviceData = value;
    });
  }

  final _$initPlatformStateAsyncAction =
      AsyncAction('_DeviceInfo.initPlatformState');

  @override
  Future<void> initPlatformState() {
    return _$initPlatformStateAsyncAction.run(() => super.initPlatformState());
  }

  @override
  String toString() {
    return '''
deviceData: ${deviceData},
deviceName: ${deviceName}
    ''';
  }
}
