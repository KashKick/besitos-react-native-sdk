export interface OfferwallConfig {
    partnerId: string;
    userId: string;
    subId?: string;
    deviceId?: string;
    idfa?: string;
    gdfa?: string;
    info?: string;
    hideHeader?: boolean;
    hideFooter?: boolean;
    onlyOffers?: boolean;
}
export declare const Offerwall: {
    show(config: OfferwallConfig): void;
};
