
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:customer_registration/screens/registration_screen/registration_screen_mobx.dart';


void main() {

  group('Create test for ssim registration', () {
    RegistrationScreenMobx store;
    setUp((){

      store = RegistrationScreenMobx();
    });




    test('test if IMEI is empty',(){
      store.validateImei("");
      expect(store.IMEIErr, 'IMEI is required');
    });

    test('test if IMEI is less than  or greater 15',(){
      store.validateImei("3344332234");
      expect(store.IMEIErr, 'IMEI is 15 digits number');
    });

    test('test for valid IMEI',(){
      store.validateImei("123456789098765");
      expect(store.IMEIErr,null);
    });



    test('test if FirstName is empty',(){
      store.validateFirstName("");
      expect(store.firstNameErr, 'FirstName is required');
    });


    test('test for valid FirstName',(){
      store.validateFirstName("Muraino");
      expect(store.firstNameErr, null);
    });



    test('test for inemail',(){
      store.validateEmail("murainoy");
      expect(store.emailErr,'Email is not valid');
    });


    test('test for correct email',(){
      store.validateEmail("murainoy@.com");
      expect(store.emailErr,null);
    });


    test('test if LastName is empty',(){
      store.validateLastName("");
      expect(store.lastNameErr, 'LastName is required');
    });

    test('test for valid LastName',(){
      store.validateLastName('Yakubu');
      expect(store.lastNameErr, null);
    });


    test('test for valid EmptyImage',(){
      store.validateProfileImage(null);
      expect(store.pictureErr, 'Picture is required');
    });

    test('test for valid EmptyImage',(){
      store.validateProfileImage(File("string path"));
      expect(store.pictureErr, null);
    });

    test('test for valid LastName',(){
      store.validateLastName('Yakubu');
      expect(store.lastNameErr, null);
    });




    test('test for age greater than 18',(){
      final birthday = DateTime(1993, 5, 12);
      store.validateDateDifference(birthday);
      expect(store.showDate, true);
    });

    test('test for age less than 18',(){
      final birthday = DateTime(2020, 5, 12);
      store.validateDateDifference(birthday);
      expect(store.showDate, false);
    });







    // tearDown((){
    //   store.dispose();
    // });


  });
}
