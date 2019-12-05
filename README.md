
# rn-user-defaults

Use `UserDefaults` (iOS) with React Native and `SharedPreferences` on AndroidOS.

## Getting started

`$ npm install rn-user-defaults --save`

### Mostly automatic installation

`$ react-native link rn-user-defaults`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `rn-user-defaults` and add `RNUserDefaults.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNUserDefaults.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

- Edit `android/settings.gradle` and add the following

```
include ':app', ':rn-user-defaults'

project(':rn-user-defaults').projectDir = new File(rootProject.projectDir, '../node_modules/rn-user-defaults/android')
```

- Edit `android/app/build.gradle` and add the following line before the react section in dependencies

```
dependencies {
    ...
    implementation project(':rn-user-defaults')
    implementation "com.facebook.react:react-native:+"
}
```

- Add these lines to `MainApplication.java`

```
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
```javascript
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
```

#### iOS
```objective-c
#import "RNUserDefaults.h"

NSDictionary *exampleObject = [[RNUserDefaults getDefaultUser] objectForKey:host];
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
  iOS = [[NSUserDefaults alloc] initWithSuiteName:name];
  Android = getReactApplicationContext().getSharedPreferences(name, Context.MODE_PRIVATE);
**/
function setName(name:String):Promise<Void>;

/**
  You can set a context to you sharedPreferences (Android)
**/
function setPackageContext(context:String):Promise<Void>;
```
