

import 'dart:io';
import 'package:customer_registration/utils/writeToSdCard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';


part 'registration_screen_mobx.g.dart';

class RegistrationScreenMobx = _RegistrationScreenMobx with _$RegistrationScreenMobx;

abstract class _RegistrationScreenMobx with Store {



  @observable
  File imageUrl;


  /// collect user input data

  String firstName;
  String lastName;
  String dob;
  String IMEI;
  File picture;
  String email;
  DateTime  datePicked;



  /// Return Error to user input data
  @observable
  String firstNameErr;

  @observable
  String lastNameErr;

  @observable
  String dobErr;

  @observable
  String IMEIErr;

  @observable
  String pictureErr;

  @observable
  bool showDate ;

  @observable
  String emailErr;

///validator IMEI
  @action
  void validateImei(String value ) {
    if (value == null|| value.isEmpty)
      IMEIErr = 'IMEI is required';
    else if (value.length != 15) {
      IMEIErr = 'IMEI is 15 digits number';
    }else{
      IMEIErr = null;
    }
  }

   ///validate first name
  @action
  void validateFirstName(String value ) {
    if (value == null|| value.isEmpty)
      firstNameErr = 'FirstName is required';
  else{
      firstNameErr = null;
    }
  }

  ///validate last name
  @action
  void validateLastName(String value ) {
    if (value == null|| value.isEmpty)
      lastNameErr = 'LastName is required';
    else{
      lastNameErr = null;
    }
  }

  ///validate valid email
  @action
  void validateEmail(String value ) {
    //check if email is not empty then it should be valid
    if (value != null&& !value.contains("@"))
      emailErr = 'Email is not valid';
    else{
      emailErr = null;
    }
  }


  ///validate Profile Image
  @action
  void validateProfileImage(File value ) {
    if (value == null|| value.path.isEmpty)
      pictureErr = 'Picture is required';
    else{
      pictureErr = null;
    }
  }


  ///validate dob
  @action
  void validateDoB(String value) {
    if (value == null|| value.isEmpty)
      dobErr = 'Date of Birth is required ';
    else{
      dobErr = null;
    }
  }






  ///this check if date of birth is greater tha 17, then return true or false

   validateDateDifference(DateTime birthday) {

    /// Convert 18 Years to Days  == 6,574.365 Days
    final date2 = DateTime.now();
    final difference = date2.difference(birthday).inDays;
    showDate =  difference > 6574.365? true: false;

  }



  @action
  showsDatePicker({BuildContext context}) async {

    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2025),
    );
    if (picked != null )
     ///append date data here
      dob = "${picked?.day.toString()}-${picked?.month.toString()}-${picked?.year.toString()}";

    ///put date pick into validateDateDifference method
    datePicked =   DateTime(picked?.year,picked?.month,picked?.day);
    validateDateDifference(datePicked);
  }




  validateAllField(){
    validateImei(IMEI);
    validateFirstName(firstName);
    validateLastName(lastName);
    validateDoB(dob);
    validateEmail(email);
    validateProfileImage(picture);
  }



  @computed
  bool get hasErrors =>
      firstNameErr != null ||
          lastNameErr != null ||
          IMEIErr != null ||
          pictureErr != null ||
          emailErr != null ||
          dobErr != null;










///image
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageUrl = File(pickedFile.path);
    } else {
      print('No image selected.');
    }

  }




  Future<void> submit( {BuildContext context}) async {

    validateAllField();
    //call button validation
    if (hasErrors) return;


    FileDownloaderState().saveFile(file: imageUrl,context: context);

  }





}




