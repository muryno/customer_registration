package com.customer_registration

import android.content.ActivityNotFoundException
import android.content.Context
import android.content.Intent
import android.content.UriPermission
import android.net.Uri
import android.os.Build
import android.os.storage.StorageManager
import android.os.storage.StorageVolume
import android.util.Log
import androidx.annotation.NonNull
import androidx.annotation.Nullable
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.OutputStream


class MainActivity: FlutterActivity() {
    private val CHANNEL = "myCardStorage"

    var myPath :String = ""
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->

            if (call.method == "takeCardUriPermission") {
                 takeCardUriPermission(call.arguments.toString())
             //   result.success(myPath)
            } else {
                result.notImplemented()
            }
        }
    }

    fun takeCardUriPermission(sdCardRootPath: String) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            val sdCard = File(sdCardRootPath)
            val storageManager: StorageManager = getSystemService(Context.STORAGE_SERVICE) as StorageManager
            val storageVolume: StorageVolume = storageManager.getStorageVolume(sdCard)
            val intent: Intent = storageVolume.createAccessIntent(null)
            try {
                startActivityForResult(intent, 4010)
            } catch (e: ActivityNotFoundException) {
                Log.e("TUNE-IN ANDROID", "takeCardUriPermission: $e")
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, @Nullable data: Intent) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 4010) {
            val uri: Uri = data?.data
            grantUriPermission(packageName, uri, Intent.FLAG_GRANT_WRITE_URI_PERMISSION or
                    Intent.FLAG_GRANT_READ_URI_PERMISSION)
            val takeFlags: Int = data.flags and (Intent.FLAG_GRANT_WRITE_URI_PERMISSION or
                    Intent.FLAG_GRANT_READ_URI_PERMISSION)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
                contentResolver.takePersistableUriPermission(uri, takeFlags)
            }

           // methodChannel.invokeMethod("resolveWithSDCardUri", getUri().toString())
        }else{
            myPath =""
        }
    }

    @RequiresApi(Build.VERSION_CODES.KITKAT)
    fun getUri(): Uri? {
        val persistedUriPermissions: List<UriPermission> = contentResolver.persistedUriPermissions
        if (persistedUriPermissions.isNotEmpty()) {
            val uriPermission: UriPermission = persistedUriPermissions[0]
            return uriPermission.uri
        }
        return null
    }

//    fun ghgh(){
//        val filepath = arguments.get("filepath") as String
//        val bytes: ByteArray = methodCall.argument("bytes")
//
//        try {
//            if (filepath == null || bytes == null) throw Exception("Arguments Not found")
//            var documentFile: DocumentFile = DocumentFile.fromTreeUri(applicationContext, getUri())
//            val parts = filepath.split("/".toRegex()).toTypedArray()
//            for (i in parts.indices) {
//                val nextfile: DocumentFile = documentFile.findFile(parts[i])
//                if (nextfile != null) {
//                    documentFile = nextfile
//                }
//            }
//            if (documentFile != null && documentFile.isFile()) {
//                val out: OutputStream = contentResolver.openOutputStream(documentFile.getUri())
//                out.write(bytes)
//                out.close()
//            } else {
//                throw Exception("File Not Found")
//            }
//        } catch (e: Exception) {
//            result.error("400", e.message, e)
//            return
//        }
//        result.success(true)
//    }




}