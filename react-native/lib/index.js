import { NativeModules, Platform } from 'react-native';
const LINKING_ERROR = `The package 'react-native-besitos-offerwall' doesn't seem to be linked. Make sure: \n\n` +
    Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
    '- You rebuilt the app after installing the package\n';
const NativeOfferwall = NativeModules.Offerwall
    ? NativeModules.Offerwall
    : new Proxy({}, {
        get() {
            throw new Error(LINKING_ERROR);
        },
    });
export const Offerwall = {
    show(config) {
        const valid = /^[A-Za-z0-9\-_]+$/;
        if (!config.partnerId || !valid.test(config.partnerId)) {
            throw new Error('Offerwall: partnerId is required and must only contain A-Z a-z 0-9 - _');
        }
        if (!config.userId || !valid.test(config.userId)) {
            throw new Error('Offerwall: userId is required and must only contain A-Z a-z 0-9 - _');
        }
        NativeOfferwall.show(config);
    },
};
