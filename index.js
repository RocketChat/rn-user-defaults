import { NativeModules, Platform, AsyncStorage } from 'react-native';

class RNUserDefaultsAndroid {
  setName = (name) => {};
  objectForKey = async(key) => {
    try {
      const value = await AsyncStorage.getItem(key);
      return JSON.parse(value);
    } catch {
      return null;
    }
  };
  get = (key) => AsyncStorage.getItem(key);
  set = (key, value) => AsyncStorage.setItem(key, value);
  clear = (key) => AsyncStorage.removeItem(key);
}

const RNUserDefaults = Platform.OS === 'ios' ? NativeModules.RNUserDefaults : new RNUserDefaultsAndroid();
export default RNUserDefaults;
