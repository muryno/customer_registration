
import 'package:customer_registration/database/DBHelper.dart';
import 'package:customer_registration/screens/registration_screen/registration_screen_mobx.dart';
import 'package:customer_registration/utils/colors.dart';
import 'package:customer_registration/utils/input_field.dart';
import 'package:customer_registration/utils/required_field.dart';
import 'package:customer_registration/utils/snackbar.dart';
import 'package:customer_registration/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


class RegistrationScreen extends StatefulWidget {
  static const routeName = '/RegistrationScreen';
  @override
  _RegistrationScreen createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {








@override
  void initState() {
  ///initializing RegistrationScreenMobx that contain buisness logic
  store.initRegPackages();
    super.initState();
  }


DBHelper dbHelper;
@override
Widget build(BuildContext context) {
  dbHelper = Provider.of<DBHelper>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Registration'  , style: TextStyle(
            fontSize: 22,
            fontFamily: 'MontserratMedium',
            color: Color(0xff232949)

        ),),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
        body: SingleChildScrollView(
      child:     Container(
        padding: EdgeInsets.symmetric(horizontal: 16),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Text(
              "Kindly provide your details and fill all required fields",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'MontserratMedium',
                  color: Color(0xff232949)
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 5,),

            Observer(
              builder: (_) =>
                  GestureDetector(
                    onTap: () {
                      //call camera function
                      store.getImage(type: ImageType.ProfileImage);
                    },
                    child: new Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            width: 160,
                            height: 160,
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                border: Border.all(width: 5, color: AppColors.primaryColor.withOpacity(0.2))),
                            child: store.imageUrl == null ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt_rounded,
                                  color: AppColors.primaryColor,
                                  size: 28,
                                ),
                                formTitle(text:"Upload Photo"),
                              ],
                            ):
                            Container(
                                width: 200.0,
                                height: 200.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(store.imageUrl),

                                    )
                                )),
                          ),

                          Observer( builder: (_) =>
                          store.imageUrl == null ? Container() :

                              GestureDetector(
                                onTap: (){ store.getImage(type: ImageType.ProfileImage);},
                                child:     Column(
                                    children:[
                                      Icon(
                                        Icons.camera_alt_rounded,
                                        color: AppColors.primaryColor,
                                        size: 28,
                                      ),

                                      Text("Change Photo",style: TextStyle(
                                        color: Color(0xff232949),
                                        fontSize: 14,
                                      )),

                                    ]),
                              )

                          ),
                        ],
                      ),
                    ),
                  ),

            ),

            formTitle(text:"IMEI"),
            Observer(
              builder: (_) =>
                  InputField(
                    controller: store.imeiController,
                    type: TextInputType.number,
                    hint: 'Enter your IMEI',
                    border:  InputBorder.none,
                    filled: true,
                    maxLength: 15,
                    textAlign: TextAlign.center,
                    color : Color(0XFFD8D8D8),
                    message: store.IMEIErr,
                    error: store.IMEIErr != null,
                  ),
            ),

            formTitle(text:"First Name"),
            Observer(
              builder: (_) =>
                  InputField(
                    controller: store.firstNameController,
                    type: TextInputType.emailAddress,
                    hint: 'Enter First Name',
                    border:  InputBorder.none,
                    filled: true,
                    textAlign: TextAlign.center,
                    color : Color(0XFFD8D8D8),
                    message: store.firstNameErr,
                    error: store.firstNameErr != null,


                  ),
            ),

            formTitle(text:"Last Name"),
            Observer(
              builder: (_) =>
                  InputField(
                    controller: store.lastNameController,
                    type: TextInputType.emailAddress,
                    hint: 'Enter Last Name',
                    border:  InputBorder.none,
                    filled: true,
                    textAlign: TextAlign.center,
                    color : Color(0XFFD8D8D8),

                    message: store.lastNameErr,
                    error: store.lastNameErr != null,
                  ),
            ),

            formTitle(text:"Pick Date"),

        Observer(
          builder: (_) =>
          GestureDetector(
              onTap: () {
                //Call Date method
                store.showsDatePicker(context: context);
              },
            child:   Container(
              color: Color(0XFFE5E5E5),
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              child:  Text(store.dob == null ? "Pick date":store.dob,
                style: TextStyle(
                    fontSize: 18,
                    color: AppColors.inputColor),
              ),
            )
          )


            ),
            SizedBox(height: 20,),
            Observer(
                builder: (_) =>
                store.showDate==true?   formTitle(text:"Upload Passport") : Container()
            ),

              Observer(
                builder: (_) =>
                 store.showDate==true?
                 GestureDetector(
                      onTap: ()=>{
                        store.getImage(type: ImageType.PASSPORT)
                      },
                      child:  Container(
                        color: Color(0XFFE5E5E5),
                        width: size.width,
                        height: 130,
                        child: Center(
                          child: store.passport== null?
                          Icon(Icons.upload_rounded):
                          Image.file(store.passport),
                        ),


                        // child:Image.file(File())
                      )

                  ) :
                Container(),
              ),

            SizedBox(height: 20,),
            formTitle(text:"Email",required: false),

        Observer(
          builder: (_) =>
            InputField(
              controller: store.emailController,
              type: TextInputType.emailAddress,
              hint: 'Enter Email',
              border:  InputBorder.none,
              filled: true,
              textAlign: TextAlign.center,
              color : Color(0XFFD8D8D8),
              message: store.emailErr,
              error: store.emailErr != null,
            )
            ),



           Container(
             width: double.infinity,
             child:  ElevatedButton(

               style:ButtonStyle(backgroundColor: MaterialStateProperty.all( AppColors.primaryColor),) ,
               onPressed: (){

                 store.submit(context: context,dbHelper:dbHelper);
               },
               child: Text("Save"),
             ),
           ),
            SizedBox(height: 60,)
          ],
        ),
      )
    ));
  }






}
