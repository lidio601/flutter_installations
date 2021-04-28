package io.litosoft.flutter.firebase_installations;

import android.util.Log;

import androidx.annotation.NonNull;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.installations.FirebaseInstallations;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * FirebaseInstallationsPlugin
 */
public class FirebaseInstallationsPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "firebase_installations");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {

    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull final Result result) {
        switch (call.method) {
            case "getId":
                FirebaseInstallations.getInstance().getId()
                        .addOnCompleteListener(new OnCompleteListener<String>() {
                            @Override
                            public void onComplete(@NonNull Task<String> task) {
                                if (task.isSuccessful()) {
                                    final String newId = task.getResult();

                                    if (null != newId) {
                                        Log.d("Installations", "Installation ID: " + newId);
                                        result.success(newId);
                                    } else {
                                        Log.e("Installations", "Installation ID was null");
                                        result.error("firebase_installations", "Empty installation ID", null);
                                    }
                                } else {
                                    Log.e("Installations", "Unable to get Installation ID");
                                    Exception exception = task.getException();
                                    result.error("firebase_installations", exception != null ? exception.getMessage() : null, null);
                                }

                            }
                        });
                break;
            case "delete":
                FirebaseInstallations.getInstance().delete()
                        .addOnCompleteListener(new OnCompleteListener<Void>() {
                            @Override
                            public void onComplete(@NonNull Task<Void> task) {
                                if (task.isSuccessful()) {
                                    Log.d("Installations", "Installation deleted");
                                    result.success(true);
                                } else {
                                    Log.e("Installations", "Unable to delete Installation");
                                    Exception exception = task.getException();
                                    result.error("firebase_installations", exception != null ? exception.getMessage() : null, null);
                                }
                            }
                        });
                break;
            default:
                result.notImplemented();
                break;
        }
    }
}