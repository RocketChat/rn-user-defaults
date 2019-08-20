package chat.rocket.userdefaults;

import android.content.Context;
import android.content.SharedPreferences;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMapKeySetIterator;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableMap;

import java.util.Map;

public class RNUserDefaultsModule extends ReactContextBaseJavaModule {
  private String preferencesName = "react-native";

  private final ReactApplicationContext reactContext;

  public RNUserDefaultsModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
      return "RNUserDefaults";
  }

  @ReactMethod
  public void get(String key, Promise promise) {
    promise.resolve(getPreferences().getString(key, null));
  }

  @ReactMethod
  public void set(String key, String value, Promise promise) {
    getEditor().putString(key, value).commit();
    promise.resolve(null);
  }

  @ReactMethod
  public void clear(String key, Promise promise) {
    getEditor().remove(key).commit();
    promise.resolve(null);
  }

  @ReactMethod
  public void clearAll(Promise promise) {
    SharedPreferences.Editor editor = getEditor();
    Map<String, ?> allEntries = getPreferences().getAll();
    for (Map.Entry<String, ?> entry : allEntries.entrySet()) {
      editor.remove(entry.getKey());
    }
    editor.commit();
    promise.resolve(null);
  }

  @ReactMethod
  public void setName(String preferencesName, Promise promise) {
    this.preferencesName = preferencesName;
    promise.resolve(null);
  }

  @ReactMethod
  public void getName(Promise promise) {
    promise.resolve(preferencesName);
  }

  private SharedPreferences getPreferences() {
    return getReactApplicationContext().getSharedPreferences(preferencesName, Context.MODE_PRIVATE);
  }
  private SharedPreferences.Editor getEditor() {
    return getPreferences().edit();
  }
}