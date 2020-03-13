package pl.spicymobile.flutter_mobience

import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import pl.spicymobile.mobience.sdk.MobienceSDK


/** FlutterMobiencePlugin */
public class FlutterMobiencePlugin : FlutterPlugin, MethodCallHandler {
    private var applicationContext : Context? = null
    private var methodChannel: MethodChannel? = null


   /* override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        applicationContext = flutterPluginBinding.applicationContext
        val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "flutter_mobience")
        channel.setMethodCallHandler(FlutterMobiencePlugin());
    }*/

    // This static function is optional and equivalent to onAttachedToEngine. It supports the old
    // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
    // plugin registration via this function while apps migrate to use the new Android APIs
    // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
    //
    // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
    // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
    // depending on the user's project. onAttachedToEngine or registerWith must both be defined
    // in the same class.
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            /*val channel = MethodChannel(registrar.messenger(), "flutter_mobience")
            channel.setMethodCallHandler(FlutterMobiencePlugin())*/
            val instance = FlutterMobiencePlugin()
            instance.onAttachedToEngine(registrar.context(), registrar.messenger())
        }
    }

    override fun onAttachedToEngine(binding: FlutterPluginBinding) {
        onAttachedToEngine(binding.applicationContext, binding.binaryMessenger)
    }

    private fun onAttachedToEngine(applicationContext: Context, messenger: BinaryMessenger) {
        this.applicationContext = applicationContext
        methodChannel = MethodChannel(messenger, "flutter_mobience")
        methodChannel?.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "getPlatformVersion" -> {
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            }
            "init" ->{
                val sdk = MobienceSDK.Builder(applicationContext,"V0K6jhiIfem6CRWHYZ59Nmj3oFBBKbJsnSsWfR2JNq7ktblOUXwbJoBQTpWnw2uSwW76gpiu2kun50jweTY69B").build()

                sdk.startService()
                result.success("Starting library resulted as successed")
            }
            else ->{
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        applicationContext = null
        methodChannel?.setMethodCallHandler(null);
        methodChannel = null;
    }
}
