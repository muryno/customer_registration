

import 'dart:io' as Io;
import 'dart:io';
import 'package:customer_registration/screens/storage_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:folder_file_saver/folder_file_saver.dart';
import 'package:image/image.dart' as IM;

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class  FileDownloaderState {
  Directory externalDir;
  Future<void> saveFile({File file,BuildContext context}) async {

    Directory directory = await getExternalSdCardPath();
    if (await Permission.storage.request().isGranted) {

      try {


        final resultPermission = await FolderFileSaver.requestPermission();


        ///write to storage
        var testdir = await new Io.Directory('${directory.path}').create(recursive: true);
        IM.Image image = IM.decodeImage(file.readAsBytesSync());
        return new Io.File(
            '${testdir.path}${DateTime.now().toUtc().toIso8601String()}.png')
          ..writeAsBytesSync(IM.encodePng(image));


      } catch (e) {
        print(e);
      }

    } else {
      // showSnackBar(
      //   context,
      //   message: "kindly grant your phone permission to save to your card",
      // );
    }
  }


  ///get path directories
   getExternalSdCardPath() async {
    List<Directory> extDirectories = await getExternalStorageDirectories();

    List<String> dirs ;
    ///check if an sdk exist on phone then grap as priority else pick phone directories
    if(extDirectories[1]!= null){
      dirs = extDirectories[1].toString().split('/');
    }else{
      dirs = extDirectories[0].toString().split('/');
    }

    String rebuiltPath = '/' + dirs[1] + '/' + dirs[2] + '/';

    print("rebuilt path: " + rebuiltPath);

 //  StorageDetails.getPermission(rebuiltPath);
    return  Directory(rebuiltPath);
  }

}