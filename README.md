
# rn-user-defaults


Use `UserDefaults` (iOS) with React Native and `AsyncStorage` on AndroidOS.
All data are stored as String, in case more complex data structure is needed, serialize it (e.g. JSON).

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

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.djorkaeffalexandre.rn_user_defaults.RNUserDefaultsPackage;` to the imports at the top of the file
  - Add `new RNUserDefaultsPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':rn-user-defaults'
  	project(':rn-user-defaults').projectDir = new File(rootProject.projectDir, 	'../node_modules/rn-user-defaults/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':rn-user-defaults')
  	```

## Usage
```javascript
import RNUserDefaults from 'rn-user-defaults';

RNUserDefaults.set('key', 'value').then(function() {console.log('done')}); // done
RNUserDefaults.get('key').then(function(value) {console.log(value)}); // value
RNUserDefaults.setObjectForKey({ 'dog': 1 }, 'objKey').then(function() {console.log('done')}); // done
RNUserDefaults.objectForKey('objKey').then(function(value) {console.log(value)}); // { dog: 1 }
```

## API

```haxe
function get(key:String):Promise<String>;
function set(key:String, value:String):Promise<Void>;
function setObjectForKey(data:Object, key:String):Promise<Void>;
function objectForKey(key:String):Promise<Object>;
function clear(key:String):Promise<Void>;

/** Gets and sets the current user default suite name (ios) **/
function setName(name:String):Promise<Void>;
```
