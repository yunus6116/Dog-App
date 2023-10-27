package dog.app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {
    private val channel = "system_info"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
                call, result ->
            if (call.method == "getOSVersion") {
                val version = BuildConfig.VERSION_NAME
                val buildNumber = BuildConfig.VERSION_CODE
                result.success("$version- $buildNumber")
            } else {
                result.notImplemented()
            }
        }
    }
}
