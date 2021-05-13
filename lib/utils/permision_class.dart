






import 'package:customer_registration/utils/writeToSdCard.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler{

  static requestStoragePermissions() async {
    var storage = await Permission.storage.status;
    var location = await Permission.location.status;
    var camera = await Permission.camera.status;
    var manageExternalStorage = await Permission.manageExternalStorage.status;

    //smart check on permission
    if (!storage.isGranted) {
      await Permission.storage.request();
    }

   // location permision
    if (!location.isGranted) {
      await Permission.location.request();
    }

    //camera permission
    if (!camera.isGranted) {
      await Permission.camera.request();
    }

    //External permission
    if (!manageExternalStorage.isGranted) {
      await FileDownloaderState().getExternalSdCardPath();
    }


  }
}
