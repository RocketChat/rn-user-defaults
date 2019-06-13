
# rn-user-defaults

Use `UserDefaults` (iOS) with React Native and `AsyncStorage` on AndroidOS.

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

Not need setup.

## Usage
```javascript
import RNUserDefaults from 'rn-user-defaults';

RNUserDefaults.set('key', 'value').then(function() {console.log('done')}); // done
RNUserDefaults.get('key').then(function(value) {console.log(value)}); // value
RNUserDefaults.objectForKey('objKey').then(function(value) {console.log(value)}); // { dog: 1 }
```

## API

```haxe
function get(key:String):Promise<String>;
function set(key:String, value:String):Promise<Void>;
function objectForKey(key:String):Promise<Object>;
function clear(key:String):Promise<Void>;

/** Set the current user default suite name (ios) **/
function setName(name:String):Promise<Void>;
```
