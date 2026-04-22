module.exports = {
  dependency: {
    platforms: {
      android: {
        sourceDir: './react-native/android',
        packageImportPath: 'import io.github.kashkick.besitos.reactnative.sdk.offerwall.OfferwallPackage;',
        packageInstance: 'new OfferwallPackage()',
      },
      ios: {
        podspecPath: './react-native/OfferwallRN.podspec',
      },
    },
  },
};
