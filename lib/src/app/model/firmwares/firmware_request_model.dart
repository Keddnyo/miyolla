class FirmwareRequestModel {
  FirmwareRequestModel({
    required this.deviceName,
    required this.deviceSource,
    required this.productionSource,
    required this.firmwareApp,
    this.firmwareLocale = FirmwareRequestLocale.en,
    required this.deviceIconName,
  });

  final String deviceName, deviceSource, productionSource;
  final FirmwareRequestApp firmwareApp;
  final FirmwareRequestLocale firmwareLocale;
  final String deviceIconName;

  static List<FirmwareRequestModel> get list => [
        FirmwareRequestModel(
          deviceName: 'Mi Band 3i',
          deviceSource: '31',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'mi_band_3i',
        ),
        FirmwareRequestModel(
          deviceName: 'Mi Band 4 GL',
          deviceSource: '25',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'mi_band_4',
        ),
        FirmwareRequestModel(
          deviceName: 'Mi Band 4 NFC',
          deviceSource: '24',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'mi_band_4',
        ),
        FirmwareRequestModel(
          deviceName: 'Xiaomi Smart Band 5',
          deviceSource: '59',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'mi_band_5_nfc',
        ),
        FirmwareRequestModel(
          deviceName: 'Xiaomi Smart Band 5 NFC',
          deviceSource: '58',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'mi_band_5_nfc',
        ),
        FirmwareRequestModel(
          deviceName: 'Xiaomi Smart Band 6 GL',
          deviceSource: '212',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'mi_band_6',
        ),
        FirmwareRequestModel(
          deviceName: 'Xiaomi Smart Band 6 NFC',
          deviceSource: '211',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'mi_band_6',
        ),
        FirmwareRequestModel(
          deviceName: 'Xiaomi Smart Band 7',
          deviceSource: '260',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'mi_band_7',
        ),
        FirmwareRequestModel(
          deviceName: 'Xiaomi Smart Band 7',
          deviceSource: '262',
          productionSource: '258',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'mi_band_7',
        ),
        FirmwareRequestModel(
          deviceName: 'Xiaomi Smart Band 7',
          deviceSource: '263',
          productionSource: '259',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'mi_band_7',
        ),
        FirmwareRequestModel(
          deviceName: 'Xiaomi Smart Band 7',
          deviceSource: '264',
          productionSource: '260',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'mi_band_7',
        ),
        FirmwareRequestModel(
          deviceName: 'Xiaomi Smart Band 7',
          deviceSource: '265',
          productionSource: '261',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'mi_band_7',
        ),

        // Amazfit Band
        FirmwareRequestModel(
          deviceName: 'Amazfit Band 5',
          deviceSource: '73',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_band_5',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit Band 7',
          deviceSource: '254',
          productionSource: '259',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_band_7',
        ),

        // Amazfit Ares
        FirmwareRequestModel(
          deviceName: 'Amazfit Ares',
          deviceSource: '65',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          firmwareLocale: FirmwareRequestLocale.zh,
          deviceIconName: 'amazfit_ares',
        ),

        // Amazfit Bip
        FirmwareRequestModel(
          deviceName: 'Amazfit Bip',
          deviceSource: '12',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zeppLife,
          firmwareLocale: FirmwareRequestLocale.zh,
          deviceIconName: 'amazfit_bip',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit Bip Lite',
          deviceSource: '39',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'amazfit_bip',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit Bip Lite GL',
          deviceSource: '42',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zeppLife,
          firmwareLocale: FirmwareRequestLocale.zh,
          deviceIconName: 'amazfit_bip',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit Bip S',
          deviceSource: '20',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_bip_s',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit Bip S GL',
          deviceSource: '28',
          productionSource: '258',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_bip_s',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit Bip S Lite',
          deviceSource: '29',
          productionSource: '259',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_bip_s',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit Bip 3',
          deviceSource: '257',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          firmwareLocale: FirmwareRequestLocale.zh,
          deviceIconName: 'amazfit_bip_3',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit Bip 3 Pro',
          deviceSource: '256',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          firmwareLocale: FirmwareRequestLocale.zh,
          deviceIconName: 'amazfit_bip_3',
        ),

        // Amazfit Pop
        FirmwareRequestModel(
          deviceName: 'Amazfit Pop',
          deviceSource: '68',
          productionSource: '258',
          firmwareApp: FirmwareRequestApp.zepp,
          firmwareLocale: FirmwareRequestLocale.zh,
          deviceIconName: 'amazfit_bip_u',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit Pop Pro',
          deviceSource: '67',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          firmwareLocale: FirmwareRequestLocale.zh,
          deviceIconName: 'amazfit_bip_u',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit Bip U',
          deviceSource: '70',
          productionSource: '259',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_bip_u',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit Bip U Pro',
          deviceSource: '69',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_bip_u',
        ),

        // Amazfit GTR
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 42',
          deviceSource: '37',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_42',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 42 GL',
          deviceSource: '38',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_42',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 42 SWK',
          deviceSource: '51',
          productionSource: '260',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_42',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 42 SWK GL',
          deviceSource: '52',
          productionSource: '261',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_42',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 47 Disney',
          deviceSource: '54',
          productionSource: '259',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 47',
          deviceSource: '35',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 47 GL',
          deviceSource: '36',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 47 Lite GL',
          deviceSource: '46',
          productionSource: '258',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 2',
          deviceSource: '63',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_2',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 2 (New)',
          deviceSource: '244',
          productionSource: '258',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_2',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 2 GL',
          deviceSource: '64',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_2',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 2e',
          deviceSource: '206',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_2e',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 2e GL',
          deviceSource: '209',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_2e',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 2 eSIM',
          deviceSource: '98',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_2',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 3',
          deviceSource: '226',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_3',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 3 GL',
          deviceSource: '227',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_3',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 3 Pro',
          deviceSource: '229',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_3',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 3 Pro GL',
          deviceSource: '230',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_3',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTR 3 Pro Ltd',
          deviceSource: '242',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gtr_3',
        ),

        // Amazfit GTS
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS',
          deviceSource: '40',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gts',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS GL',
          deviceSource: '41',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gts',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS 2',
          deviceSource: '245',
          productionSource: '258',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gts_2',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS 2',
          deviceSource: '77',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gts_2',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS 2 GL',
          deviceSource: '78',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gts_2',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS 2 Mini',
          deviceSource: '91',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          firmwareLocale: FirmwareRequestLocale.zh,
          deviceIconName: 'amazfit_gts_2_mini',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS 2 Mini GL',
          deviceSource: '92',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gts_2_mini',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS 2 Mini 2022',
          deviceSource: '243',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gts_2_mini',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS 2e',
          deviceSource: '207',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gts_2',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS 2e GL',
          deviceSource: '210',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gts_2',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS 3',
          deviceSource: '224',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gts_3',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS 3 GL',
          deviceSource: '225',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gts_3',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS 4 Mini',
          deviceSource: '246',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gts_4_mini',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit GTS 4 Mini GL',
          deviceSource: '247',
          productionSource: '259',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_gts_4_mini',
        ),

        // Amazfit Neo
        FirmwareRequestModel(
          deviceName: 'Amazfit Neo',
          deviceSource: '62',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_neo',
        ),

        // Amazfit T-Rex
        FirmwareRequestModel(
          deviceName: 'Amazfit T-Rex',
          deviceSource: '50',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_t_rex',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit T-Rex 2',
          deviceSource: '418',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_t_rex_2',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit T-Rex 2 GL',
          deviceSource: '419',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_t_rex_2',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit T-Rex Pro',
          deviceSource: '83',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_t_rex_pro',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit T-Rex Pro GL',
          deviceSource: '200',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_t_rex_pro',
        ),

        // Amazfit Verge
        FirmwareRequestModel(
          deviceName: 'Amazfit Verge Lite GL',
          deviceSource: '30',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zeppLife,
          deviceIconName: 'amazfit_verge_lite',
        ),

        // Amazfit X
        FirmwareRequestModel(
          deviceName: 'Amazfit X',
          deviceSource: '53',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_x',
        ),
        FirmwareRequestModel(
          deviceName: 'Amazfit X GL',
          deviceSource: '71',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_x',
        ),

        // Zepp E
        FirmwareRequestModel(
          deviceName: 'Zepp E Circle',
          deviceSource: '57',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'zepp_e_circle',
        ),
        FirmwareRequestModel(
          deviceName: 'Zepp E Circle GL',
          deviceSource: '81',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'zepp_e_circle',
        ),
        FirmwareRequestModel(
          deviceName: 'Zepp E Square',
          deviceSource: '61',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'zepp_e_square',
        ),
        FirmwareRequestModel(
          deviceName: 'Zepp E Square GL',
          deviceSource: '82',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'zepp_e_square',
        ),

        // Zepp Z
        FirmwareRequestModel(
          deviceName: 'Zepp Z CH',
          deviceSource: '56',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'zepp_z',
        ),
        FirmwareRequestModel(
          deviceName: 'Zepp Z GL',
          deviceSource: '76',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'zepp_z',
        ),

        // Amazfit Scale
        FirmwareRequestModel(
          deviceName: 'Amazfit Smart Scale',
          deviceSource: '104',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zepp,
          deviceIconName: 'amazfit_smart_scale',
        ),
      ];
}

enum FirmwareRequestApp {
  zepp('com.huami.midong', '7.8.5-play_101072'),
  zeppLife('com.xiaomi.hm.health', '6.7.1_50703');

  const FirmwareRequestApp(this.appname, this.appVersion);
  final String appname, appVersion;
}

enum FirmwareRequestLocale {
  en('en_US', 'US'),
  zh('zh_CH', 'CH');

  const FirmwareRequestLocale(this.lang, this.country);
  final String lang, country;
}
