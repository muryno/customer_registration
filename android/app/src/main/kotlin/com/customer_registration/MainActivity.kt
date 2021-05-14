package com.customer_registration

import android.content.ActivityNotFoundException
import android.content.Context
import android.content.Intent
import android.content.UriPermission
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.os.Build
import android.os.storage.StorageManager
import android.os.storage.StorageVolume
import android.util.Log
import androidx.annotation.Nullable
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.OutputStream
import java.util.*


class MainActivity: FlutterActivity() {
//    private val CHANNEL = "myCardStorage"
//
//    var myPath: String = ""
//
//    @RequiresApi(Build.VERSION_CODES.Q)
//    override fun configureFlutterEngine(@Nullable flutterEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
//
//            when (call.method) {
//                "takeCardUriPermission" -> {
//                    takeCardUriPermission(call.arguments.toString())
//                    //   result.success(myPath)
//                }
//                "getUrl" -> {
//                    val path = getUri(call.arguments as ByteArray)
//                    result.success(path)
//                }
//                else -> {
//                    result.notImplemented()
//                }
//            }
//        }
//    }
//
//
//
//
//    @RequiresApi(Build.VERSION_CODES.Q)
//    fun takeCardUriPermission(sdCardRootPath: String) {
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
//            val sdCard = File(sdCardRootPath)
//            val storageManager: StorageManager = getSystemService(Context.STORAGE_SERVICE) as StorageManager
//            val storageVolume: StorageVolume? = storageManager.getStorageVolume(sdCard)
//            val intent: Intent? = storageVolume?.createOpenDocumentTreeIntent()
//            try {
//                startActivityForResult(intent, 4010)
//            } catch (e: ActivityNotFoundException) {
//                Log.e("TUNE-IN ANDROID", "takeCardUriPermission: $e")
//            }
//        }
//    }
//
//    override fun onActivityResult(requestCode: Int, resultCode: Int, @Nullable data: Intent) {
//        super.onActivityResult(requestCode, resultCode, data)
//        if (requestCode == 4010) {
//            val uri: Uri? = data?.data
//            grantUriPermission(packageName, uri, Intent.FLAG_GRANT_WRITE_URI_PERMISSION or
//                    Intent.FLAG_GRANT_READ_URI_PERMISSION)
//            val takeFlags: Int = data?.flags and (Intent.FLAG_GRANT_WRITE_URI_PERMISSION or
//                    Intent.FLAG_GRANT_READ_URI_PERMISSION)
//            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
//                uri?.let { contentResolver.takePersistableUriPermission(it, takeFlags) }
//            }
//
//            // methodChannel.invokeMethod("resolveWithSDCardUri", getUri().toString())
//        } else {
//            myPath = ""
//        }
//    }
//
//    @RequiresApi(Build.VERSION_CODES.KITKAT)
//    fun getUri(bytes : ByteArray ): Uri? {
//        val persistedUriPermissions: List<UriPermission> = contentResolver.persistedUriPermissions
//        if (persistedUriPermissions.isNotEmpty()) {
//            val uriPermission: UriPermission = persistedUriPermissions[0]
//
//
//            uriPermission.uri.path?.let { saveImages(bytes, it) }
//
//            return uriPermission.uri
//        }
//        return null
//    }
//
//    // Method to save an image to external storage
//    private fun saveImageToExternalStorage(path: Uri, imagePath: String):Uri{
//        // Get the external storage directory path
//
//
//        // Create a file to save the image
//        val file = File(path.path, "${UUID.randomUUID()}.jpg")
//
//        try {
//            // Get the file output stream
//            val stream: OutputStream = FileOutputStream(file)
//
//            // Compress the bitmap
//
//            val bitmap = BitmapFactory.decodeFile(imagePath)
//
//            bitmap.compress(Bitmap.CompressFormat.JPEG, 100, stream)
//
//            // Flush the output stream
//            stream.flush()
//
//            // Close the output stream
//            stream.close()
//            print("Image saved successful.")
//        } catch (e: IOException){ // Catch the exception
//            e.printStackTrace()
//            print("Error to save image.")
//        }
//
//        // Return the saved image path to uri
//        return Uri.parse(file.absolutePath)
//    }
//
//
//
//    fun  saveImages( bytes : ByteArray , filepath :String){
//        try {
//
//
//            var documentFile = DocumentFile.fromTreeUri(applicationContext,filepath)
//            val parts: List<String> = filepath.split("/")
//            for (i in parts.indices) {
//                val nextfile = documentFile!!.findFile(parts[i])
//                if (nextfile != null) {
//                    documentFile = nextfile
//                }
//            }
//            if (documentFile != null && documentFile.isFile) {
//                val out = contentResolver.openOutputStream(documentFile.uri)
//
//                out?.write(bytes)
//                out?.close()
//            } else {
//                throw Exception("File Not Found")
//            }
//        } catch (e: Exception) {
//            print(e.message)
//          //  result.error("400", e.message, e)
//            return
//        }
//    }


}


