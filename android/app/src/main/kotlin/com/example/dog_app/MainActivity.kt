package dog.app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Build

class MainActivity: FlutterActivity() {
    private val channel = "system_info"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
                call, result ->
            if (call.method == "getOSVersion") {
                val osVersion = Build.VERSION.RELEASE
                result.success(osVersion)
            } else {
                result.notImplemented()
            }
        }
    }
}
