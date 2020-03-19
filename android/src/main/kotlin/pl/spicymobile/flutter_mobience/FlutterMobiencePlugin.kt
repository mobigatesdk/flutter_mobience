package pl.spicymobile.flutter_mobience

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import org.json.JSONException
import org.json.JSONObject
import pl.spicymobile.mobience.sdk.Category
import pl.spicymobile.mobience.sdk.MobienceSDK
import pl.spicymobile.mobience.sdk.SDK
import kotlin.concurrent.thread


/** FlutterMobiencePlugin */
public class FlutterMobiencePlugin : FlutterPlugin, MethodCallHandler {
    private var applicationContext: Context? = null
    private var methodChannel: MethodChannel? = null
    private var mobienceSDK: SDK? = null


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
            "init" -> {
                val builder = MobienceSDK.Builder(applicationContext, call.argument<String>("apiKey"))

                if (call.hasArgument("appIdentifier")) {
                    val appIdentifier = call.argument<String>("appIdentifier")
                    appIdentifier?.let {
                        builder.setAppIdentifier(it)
                    }
                }
                if (call.hasArgument("appInstallationSource")) {
                    val appInstallationSource = call.argument<String>("appInstallationSource")
                    appInstallationSource?.let {
                        builder.setAppInstallationSource(it)
                    }
                }
                if (call.hasArgument("email")) {
                    val email = call.argument<String>("email")
                    email?.let {
                        builder.setEmail(it)
                    }
                }
                if (call.hasArgument("customUserAgent")) {
                    val customUserAgent = call.argument<String>("customUserAgent")
                    customUserAgent?.let {
                        builder.setCustomUserAgent(it)
                    }
                }
                if (call.hasArgument("cusUserId")) {
                    val cusUserId = call.argument<String>("cusUserId")
                    cusUserId?.let {
                        builder.setCustomUserID(it)
                    }
                }
                if (call.hasArgument("userFields")) {
                    val userFields = call.argument<List<String>>("userFields")
                    userFields?.let {
                        builder.enableUserField(*userFields.map { SDK.UserField.valueOf(it) }.toTypedArray())
                    }

                }
                if (call.hasArgument("monitorState")) {
                    val monitorState = call.argument<String>("monitorState")
                    val notificationText = call.argument<String>("notificationText")
                    monitorState?.let {
                        builder.setDataGatherPolicy(SDK.MONITOR_STATE.valueOf(it),
                                notificationText ?: "")
                    }

                }

                if (call.hasArgument("iDsProfiles")) {
                    val iDsProfiles = call.argument<Boolean>("iDsProfiles")
                    iDsProfiles?.let {
                        builder.enableIDsProfiles(it)
                    }
                }
                mobienceSDK = builder.build()

                if (mobienceSDK != null) {
                    result.success("success")
                } else {
                    result.error("Error", "init() exceptions, check logs for details", "");
                }

            }
            "startsdk" -> {
                mobienceSDK.let {
                    if (it != null) {
                        it.startService()
                        result.success("success")
                    } else
                        result.error("Error", "startsdk() library first!", "")
                }

            }
            "setCollectAll" -> {
                mobienceSDK?.setCollectAll()
            }
            "configureDataCollectors" -> {
                val enable = call.argument<Boolean>("enable") ?: false
                val dataCollectors = call.argument<List<Int>>("collectors")?.toIntArray()
                dataCollectors?.let {
                    if (it.isNotEmpty()) {
                        mobienceSDK?.configureDataCollectors(enable, dataCollectors)
                    }
                }
            }
            "disableAllDataCollector" -> {
                Log.i("kamilll", "disabling all data colelctors")
                mobienceSDK?.disableAllDataCollector()
            }
            "setEmail" -> {
                val email = call.argument<String>("email") ?: ""
                Log.i("kamilll", "setting email to $email")
                mobienceSDK?.setEmail(email)
            }
            "getEmail" -> {
                mobienceSDK.let {
                    if (it != null)
                        result.success(it.getEmail())
                    else
                        result.error("Error", "getEmail() library first!", "")
                }
            }
            "setFbToken" -> {
                val token = call.argument<String>("fbtoken")
                Log.i("kamilll", "setting fb token to $token")
                mobienceSDK?.setFbToken(token)
            }
            "getSDKInfo" -> {
                mobienceSDK.let {
                    if (it != null)
                        result.success(it.sdkInfo)
                    else
                        result.error("Error", "getSDKInfo() library first!", "")
                }
            }
            "getSDKUniqueIdentifier" -> {
                mobienceSDK.let {
                    if (it != null)
                        result.success(it.sdkUniqueIdentifier)
                    else
                        result.error("Error", "getSDKUniqueIdentifier() library first!", "")
                }
            }
            "getIDsProfiles" -> {
                mobienceSDK.let {
                    if (it != null) {
                        val idsProfiles = it.getIDsProfiles()?.toList() ?: listOf()
                        result.success(idsProfiles)
                    } else
                        result.error("Error", "getIDsProfiles() library first!", "")
                }
            }
            "getAdOceanTargeting" -> {
                thread(start = true) {

                    mobienceSDK.let {
                        if (it != null) {
                            val adOceanTargeting = it.adOceanTargeting.toMap()
                            Log.i("kamilll", "adocean target: ${it}")

                            Handler(Looper.getMainLooper()).post {
                                result.success(adOceanTargeting)
                            }
                        } else
                            result.error("Error", "getAdOceanTargeting() library first!", "")
                    }
                }

            }
            "trackAppInstall" -> {
                val timestamp = call.argument<Long>("timestamp") ?: 0
                MobienceSDK.get().trackAppInstall(timestamp)
            }
            "trackEvent" -> {
                val categoryJson = call.argument<String>("event")
                categoryJson?.let { jsonString ->


                    try {
                        val options = JSONObject(jsonString)
                        val categoryName = options.getString("category")
                        val builder = Category.Builder(categoryName)
                        val parameters = options.optJSONArray("parameters")
                        if (parameters != null) {
                            for (i in 0 until parameters.length()) {
                                val item = parameters.getJSONObject(i)
                                val parametersIterator = item.keys()
                                while (parametersIterator.hasNext()) {
                                    val key = parametersIterator.next()
                                    builder.setParameter(key, item.opt(key))
                                }
                            }
                        }
                        MobienceSDK.get().trackEvent(builder.build());
                      //  Log.i("kamilll", "this is category: ${builder.build().toString()}")
                    } catch (ex: JSONException) {
                        ex.printStackTrace()
                    }
                }
            }

            else -> {
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
