import { NativeModules, Platform } from 'react-native';

const { RNUserDefaults: NativeUserDefaults } = NativeModules;

const RNUserDefaults = Platform.select({
  ios: {
    ...NativeUserDefaults,
    setPackageContext: () => Promise.resolve()
  },
  android: {
    ...NativeUserDefaults,
    setObjectForKey: (key, value) => {
      const valueStringify = JSON.stringify(value);
      return NativeUserDefaults.set(key, valueStringify);
    },
    objectForKey: async(key) => {
      try {
        const value = await NativeUserDefaults.get(key);
        return JSON.parse(value);
      } catch {
        return null;
      }
    }
  }
});

export default RNUserDefaults;
