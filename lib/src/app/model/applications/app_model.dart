class WearableAppModel {
  WearableAppModel(this.appName, this.downloadUrl);

  final String appName, downloadUrl;

  static List<WearableAppModel> get list => [
        WearableAppModel(
          'Zepp',
          'https://play.google.com/store/apps/details?id=com.huami.watch.hmwatchmanager',
        ),
        WearableAppModel(
          'Zepp Life',
          'https://play.google.com/store/apps/details?id=com.xiaomi.hm.health',
        ),
        WearableAppModel(
          'Mi Fitness',
          'https://play.google.com/store/apps/details?id=com.xiaomi.wearable',
        ),
        WearableAppModel(
          'Notify Lite',
          'https://play.google.com/store/apps/details?id=com.mc.notify',
        ),
        WearableAppModel(
          'Notify for Amazfit',
          'https://play.google.com/store/apps/details?id=com.mc.amazfit1',
        ),
        WearableAppModel(
          'Notify for Mi Band',
          'https://play.google.com/store/apps/details?id=com.mc.miband1',
        ),
        WearableAppModel(
          'Notify Lite for Mi Band',
          'https://play.google.com/store/apps/details?id=com.mc.mibandlite1',
        ),
        WearableAppModel(
          'Master for Amazfit',
          'https://play.google.com/store/apps/details?id=blacknote.amazfitmaster',
        ),
        WearableAppModel(
          'Master for Mi Band',
          'https://play.google.com/store/apps/details?id=blacknote.mibandmaster',
        ),
        WearableAppModel(
          'Tools & Amazfit',
          'https://play.google.com/store/apps/details?id=cz.zdenekhorak.amazfittools',
        ),
        WearableAppModel(
          'Tools & Mi Band',
          'https://play.google.com/store/apps/details?id=cz.zdenekhorak.mibandtools',
        ),
        WearableAppModel(
          'Watch Droid Phone',
          'https://play.google.com/store/apps/details?id=com.lumaticsoft.watchdroidphone',
        ),
        WearableAppModel(
          'Watch Droid Assistant',
          'https://play.google.com/store/apps/details?id=com.lumaticsoft.watchdroidassistant',
        ),
        WearableAppModel(
          'Gadgetbridge',
          'https://f-droid.org/ru/packages/nodomain.freeyourgadget.gadgetbridge/',
        ),
        WearableAppModel(
          'Huafetcher',
          'https://codeberg.org/vanous/huafetcher/releases/latest',
        ),
      ];

  String getIconName(int index) {
    return list[index]
        .appName
        .toLowerCase()
        .replaceAll(' ', '_')
        .replaceAll('&', 'and');
  }
}
