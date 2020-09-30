
# rn-user-defaults

Use `UserDefaults` (iOS) and `SharedPreferences` (AndroidOS) with React Native, this can help you to share credentials between apps or between app and extensions on iOS.

## Getting started

`$ npm install rn-user-defaults --save`

or 

`$ yarn add rn-user-defaults`

If you are using `React Native 0.60.+` go to the folder **your-project/ios** and run `pod install`, and you're done. 

If not, use one of the following method to link.

### Mostly automatic with `react-native link`

If you are using `React Native <= 0.59.X`, link the native project:

`$ react-native link rn-user-defaults`

### Manual installation

If you are using `React Native <= 0.59.X` and `react-native link` don't work for you:

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `rn-user-defaults` and add `RNUserDefaults.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNUserDefaults.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

- Edit `android/settings.gradle` and add the following

```gradle
include ':app', ':rn-user-defaults'

project(':rn-user-defaults').projectDir = new File(rootProject.projectDir, '../node_modules/rn-user-defaults/android')
```

- Edit `android/app/build.gradle` and add the following line before the react section in dependencies

```gradle
dependencies {
    ...
    implementation project(':rn-user-defaults')
    implementation "com.facebook.react:react-native:+"
}
```

- Add these lines to `MainApplication.java`

```java
...
import chat.rocket.userdefaults;
...
@Override
protected List<ReactPackage> getPackages() {
    @SuppressWarnings("UnnecessaryLocalVariable")
    List<ReactPackage> packages = new PackageList(this).getPackages();
    ...
    packages.add(new RNUserDefaultsPackage());
    return packages;
}
```

## Usage

```js
import RNUserDefaults from 'rn-user-defaults';

RNUserDefaults.set('key', 'value').then(function() {console.log('done')}); // done
RNUserDefaults.get('key').then(function(value) {console.log(value)}); // value
RNUserDefaults.setObjectForKey('objKey', { dog: 1 }).then(function() {console.log('done')}); // done
RNUserDefaults.objectForKey('objKey').then(function(value) {console.log(value)}); // { dog: 1 }
```

## Static methods

Now you can use static methods to access current SharedPreferences or UserDefaults classes on native modules.

#### Android

```java
import android.content.SharedPreferences;
import chat.rocket.userdefaults.RNUserDefaultsModule;

SharedPreferences sharedPreferences = RNUserDefaultsModule.getPreferences();
String exampleString = sharedPreferences.getString("STRING_KEY", "");

SharedPreferences sharedPreferences1 = RNUserDefaultsModule.getPreferences(reactApplicationContext);
String exampleString1 = sharedPreferences1.getString("STRING_KEY", "");

SharedPreferences sharedPreferences2 = RNUserDefaultsModule.getPreferences(reactApplicationContext, contextName, preferencesName);
String exampleString2 = sharedPreferences2.getString("STRING_KEY", "");
```

#### iOS
```objective-c
#import "RNUserDefaults.h"

NSDictionary *exampleObject = [[RNUserDefaults getDefaultUser] objectForKey:@"OBJECT_KEY"];
```

### Set a AppGroup on iOS
Add the follow code to your Info.plist
```
<key>AppGroup</key>
<string>your.group.name</string>
```

## API

```haxe
function get(key:String):Promise<String>;
function set(key:String, value:String):Promise<Void>;
function setObjectForKey(key:String, value:Object):Promise<Void>;
function objectForKey(key:String):Promise<Object>;
function clear(key:String):Promise<Void>;
function clearAll():Promise<Void>;

/**
  Android = getReactApplicationContext().getSharedPreferences(name, Context.MODE_PRIVATE);
**/
function setName(name:String):Promise<Void>;

/**
  You can set a context to you sharedPreferences (Android)
**/
function setPackageContext(context:String):Promise<Void>;
```

## License

```
MIT License

Copyright (c) 2019 Djorkaeff Alexandre
```

See the full [licence file](https://github.com/RocketChat/rn-user-defaults/blob/master/LICENSE).
