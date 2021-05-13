

import 'dart:io';
import 'package:customer_registration/database/DBHelper.dart';
import 'package:customer_registration/database/model/Registrations.dart';
import 'package:customer_registration/utils/ToastHelper.dart';
import 'package:customer_registration/utils/device_infor/device_infor.dart';
import 'package:customer_registration/utils/geolocation/geolocation.dart';
import 'package:customer_registration/utils/snackbar.dart';
import 'package:customer_registration/utils/utils.dart';
import 'package:customer_registration/utils/writeToSdCard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';


part 'registration_screen_mobx.g.dart';

class RegistrationScreenMobx = _RegistrationScreenMobx with _$RegistrationScreenMobx;

abstract class _RegistrationScreenMobx with Store {

  ///controller
  var imeiController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();


  @observable
  File imageUrl;


  @observable
  File passport;



  @observable
  DateTime  datePicked;

  @observable
  String dob;





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

  @observable
  double lat;

  @observable
  double lon;

  @observable
  String deviceName;

///validator IMEI
  ///The IMEI number consists of 15 digits.
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
      dob = "${picked?.day.toString()}/${picked?.month.toString()}/${picked?.year.toString()}";

    ///put date pick into validateDateDifference method
    datePicked =   DateTime(picked?.year,picked?.month,picked?.day);
    validateDateDifference(datePicked);
  }


  validateAllField(){
    validateImei(imeiController.text);
    validateFirstName(firstNameController.text);
    validateLastName(lastNameController.text);
    validateDoB(dob);
   // validateEmail(emailController.text);
    validateProfileImage(imageUrl);
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
  Future getImage({ImageType type}) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      if(type ==ImageType.ProfileImage)
      imageUrl = File(pickedFile.path);
      else
        passport = File(pickedFile.path);
    } else {
      print('No image selected.');
    }

  }


  initRegPackages(){
    device.initPlatformState();

    deviceName = device.deviceName;

    //get lat and lon
    GeoLocale.determinePosition().then((value) => {
      if(value!= null){
        lat = value.latitude ?? 0.0,
        lon = value.longitude ?? 0.0
      }
    });
  }


///submit logic that write to storage
  Future<void> submit( {BuildContext context,DBHelper dbHelper}) async {

    validateAllField();
    //call button validation
    if (hasErrors) return;

    try {

      var person = {
      "first_name":firstNameController.text,
      "last_name " : lastNameController.text,
      "email " : emailController.text,
      "imei ":imeiController.text,
      " picturepath ": imageUrl.path,
      "lat ": lat.toString(),
      "lon ": lon.toString(),
      "dobirth": dob,
      "device": deviceName.toString(),
      };




      var result = await dbHelper.insert(person);

      if (result>0) {



        passport = null;
        imeiController.text = '';
        lastNameController.text = '';
        imeiController.text = '';
        emailController.text = '';
        firstNameController.text = '';
        dob = '';
        imageUrl = null;
          ToastHelper.toastSuccess("$result data Saved");

      } else {
       ToastHelper.toastError("data not saved Saved");

      }
    }catch(e){
  ToastHelper.toastError(e.toString());

    }
  }
}
///initializing the bussiness logic class
RegistrationScreenMobx store = RegistrationScreenMobx();

///getting device information
DeviceInfo device =  DeviceInfo();
