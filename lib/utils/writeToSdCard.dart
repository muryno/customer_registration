

import 'dart:io' as Io;
import 'dart:io';
import 'package:customer_registration/screens/storage_details.dart';
import 'package:customer_registration/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as IM;

import 'package:file_utils/file_utils.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

class  FileDownloaderState {

 // Permission permission1 = Permission.manageExternalStorage;

  Directory externalDir;


  // Future<void> saveFile({File file,BuildContext context}) async {
  //   List files = [];
  //
  //
  //
  //
  //
  //   Directory directory = await getExternalSdCardPath();
  //   if (await Permission.storage.request().isGranted) {
  //
  //
  //
  //     try {
  //
  //       FileUtils.mkdir(['${directory.path}/iLearn']);
  //
  //       var testdir = await new Io.Directory('${directory.path}').create(recursive: true);
  //       IM.Image image = IM.decodeImage(file.readAsBytesSync());
  //       return new Io.File(
  //           '${testdir.path}/${DateTime.now().toUtc().toIso8601String()}.png')
  //         ..writeAsBytesSync(IM.encodePng(image));
  //
  //
  //
  //
  //     } catch (e) {
  //       print(e);
  //     }
  //
  //   } else {
  //     // showSnackBar(
  //     //   context,
  //     //   message: "kindly grant your phone permission to save to your card",
  //     // );
  //   }
  // }


   getExternalSdCardPath() async {
    List<Directory> extDirectories = await getExternalStorageDirectories();

    List<String> dirs = extDirectories[1].toString().split('/');
    String rebuiltPath = '/' + dirs[1] + '/' + dirs[2] + '/';

    print("rebuilt path: " + rebuiltPath);

    StorageDetails.getPermission(rebuiltPath);
     new Directory(rebuiltPath);
  }



}