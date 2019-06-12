import { NativeModules, Platform, AsyncStorage } from 'react-native';

class RnUserDefaults {
  setName = async(name) => {
    if (Platform.OS === 'ios') {
      const setName = NativeModules.RNUserDefaults.setName(name);
      return setName; 
    };
    return null;
  }
  objectForKey = async(key) => {
    if (Platform.OS === 'ios') {
      const objectForKey = NativeModules.RNUserDefaults.objectForKey(key);
      return objectForKey; 
    };
    return null;
  }
  get = async(key) => {
    if (Platform.OS === 'ios') {
      const get = NativeModules.RNUserDefaults.get(key);
      return get; 
    } else {
      return AsyncStorage.getItem(key);
    }
  }
  set = async(key, value) => {
    if (Platform.OS === 'ios') {
      const set = NativeModules.RNUserDefaults.set(key, value);
      return set; 
    } else {
      return AsyncStorage.setItem(key, value);
    }
  }
  clear = async(key) => {
    if (Platform.OS === 'ios') {
      const clear = NativeModules.RNUserDefaults.clear(key);
      return clear; 
    } else {
      return AsyncStorage.removeItem(key);
    }
  }
}

const RNUserDefaults = new RnUserDefaults();
export default RNUserDefaults;
