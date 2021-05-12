// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_screen_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegistrationScreenMobx on _RegistrationScreenMobx, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_RegistrationScreenMobx.hasErrors'))
          .value;

  final _$imageUrlAtom = Atom(name: '_RegistrationScreenMobx.imageUrl');

  @override
  File get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(File value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  final _$firstNameAtom = Atom(name: '_RegistrationScreenMobx.firstName');

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  final _$lastNameAtom = Atom(name: '_RegistrationScreenMobx.lastName');

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  final _$dobAtom = Atom(name: '_RegistrationScreenMobx.dob');

  @override
  String get dob {
    _$dobAtom.reportRead();
    return super.dob;
  }

  @override
  set dob(String value) {
    _$dobAtom.reportWrite(value, super.dob, () {
      super.dob = value;
    });
  }

  final _$IMEIAtom = Atom(name: '_RegistrationScreenMobx.IMEI');

  @override
  String get IMEI {
    _$IMEIAtom.reportRead();
    return super.IMEI;
  }

  @override
  set IMEI(String value) {
    _$IMEIAtom.reportWrite(value, super.IMEI, () {
      super.IMEI = value;
    });
  }

  final _$pictureAtom = Atom(name: '_RegistrationScreenMobx.picture');

  @override
  File get picture {
    _$pictureAtom.reportRead();
    return super.picture;
  }

  @override
  set picture(File value) {
    _$pictureAtom.reportWrite(value, super.picture, () {
      super.picture = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegistrationScreenMobx.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$datePickedAtom = Atom(name: '_RegistrationScreenMobx.datePicked');

  @override
  DateTime get datePicked {
    _$datePickedAtom.reportRead();
    return super.datePicked;
  }

  @override
  set datePicked(DateTime value) {
    _$datePickedAtom.reportWrite(value, super.datePicked, () {
      super.datePicked = value;
    });
  }

  final _$firstNameErrAtom = Atom(name: '_RegistrationScreenMobx.firstNameErr');

  @override
  String get firstNameErr {
    _$firstNameErrAtom.reportRead();
    return super.firstNameErr;
  }

  @override
  set firstNameErr(String value) {
    _$firstNameErrAtom.reportWrite(value, super.firstNameErr, () {
      super.firstNameErr = value;
    });
  }

  final _$lastNameErrAtom = Atom(name: '_RegistrationScreenMobx.lastNameErr');

  @override
  String get lastNameErr {
    _$lastNameErrAtom.reportRead();
    return super.lastNameErr;
  }

  @override
  set lastNameErr(String value) {
    _$lastNameErrAtom.reportWrite(value, super.lastNameErr, () {
      super.lastNameErr = value;
    });
  }

  final _$dobErrAtom = Atom(name: '_RegistrationScreenMobx.dobErr');

  @override
  String get dobErr {
    _$dobErrAtom.reportRead();
    return super.dobErr;
  }

  @override
  set dobErr(String value) {
    _$dobErrAtom.reportWrite(value, super.dobErr, () {
      super.dobErr = value;
    });
  }

  final _$IMEIErrAtom = Atom(name: '_RegistrationScreenMobx.IMEIErr');

  @override
  String get IMEIErr {
    _$IMEIErrAtom.reportRead();
    return super.IMEIErr;
  }

  @override
  set IMEIErr(String value) {
    _$IMEIErrAtom.reportWrite(value, super.IMEIErr, () {
      super.IMEIErr = value;
    });
  }

  final _$pictureErrAtom = Atom(name: '_RegistrationScreenMobx.pictureErr');

  @override
  String get pictureErr {
    _$pictureErrAtom.reportRead();
    return super.pictureErr;
  }

  @override
  set pictureErr(String value) {
    _$pictureErrAtom.reportWrite(value, super.pictureErr, () {
      super.pictureErr = value;
    });
  }

  final _$showDateAtom = Atom(name: '_RegistrationScreenMobx.showDate');

  @override
  bool get showDate {
    _$showDateAtom.reportRead();
    return super.showDate;
  }

  @override
  set showDate(bool value) {
    _$showDateAtom.reportWrite(value, super.showDate, () {
      super.showDate = value;
    });
  }

  final _$emailErrAtom = Atom(name: '_RegistrationScreenMobx.emailErr');

  @override
  String get emailErr {
    _$emailErrAtom.reportRead();
    return super.emailErr;
  }

  @override
  set emailErr(String value) {
    _$emailErrAtom.reportWrite(value, super.emailErr, () {
      super.emailErr = value;
    });
  }

  final _$showsDatePickerAsyncAction =
      AsyncAction('_RegistrationScreenMobx.showsDatePicker');

  @override
  Future showsDatePicker({BuildContext context}) {
    return _$showsDatePickerAsyncAction
        .run(() => super.showsDatePicker(context: context));
  }

  final _$_RegistrationScreenMobxActionController =
      ActionController(name: '_RegistrationScreenMobx');

  @override
  void validateImei(String value) {
    final _$actionInfo = _$_RegistrationScreenMobxActionController.startAction(
        name: '_RegistrationScreenMobx.validateImei');
    try {
      return super.validateImei(value);
    } finally {
      _$_RegistrationScreenMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFirstName(String value) {
    final _$actionInfo = _$_RegistrationScreenMobxActionController.startAction(
        name: '_RegistrationScreenMobx.validateFirstName');
    try {
      return super.validateFirstName(value);
    } finally {
      _$_RegistrationScreenMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLastName(String value) {
    final _$actionInfo = _$_RegistrationScreenMobxActionController.startAction(
        name: '_RegistrationScreenMobx.validateLastName');
    try {
      return super.validateLastName(value);
    } finally {
      _$_RegistrationScreenMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_RegistrationScreenMobxActionController.startAction(
        name: '_RegistrationScreenMobx.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_RegistrationScreenMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateProfileImage(File value) {
    final _$actionInfo = _$_RegistrationScreenMobxActionController.startAction(
        name: '_RegistrationScreenMobx.validateProfileImage');
    try {
      return super.validateProfileImage(value);
    } finally {
      _$_RegistrationScreenMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateDoB(String value) {
    final _$actionInfo = _$_RegistrationScreenMobxActionController.startAction(
        name: '_RegistrationScreenMobx.validateDoB');
    try {
      return super.validateDoB(value);
    } finally {
      _$_RegistrationScreenMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageUrl: ${imageUrl},
firstName: ${firstName},
lastName: ${lastName},
dob: ${dob},
IMEI: ${IMEI},
picture: ${picture},
email: ${email},
datePicked: ${datePicked},
firstNameErr: ${firstNameErr},
lastNameErr: ${lastNameErr},
dobErr: ${dobErr},
IMEIErr: ${IMEIErr},
pictureErr: ${pictureErr},
showDate: ${showDate},
emailErr: ${emailErr},
hasErrors: ${hasErrors}
    ''';
  }
}
