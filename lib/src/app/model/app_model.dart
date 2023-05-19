class AppModel {
  final String appName, downloadUrl;
  AppModel(this.appName, this.downloadUrl);

  static List<AppModel> get list => [
        AppModel(
          'Zepp',
          'https://play.google.com/store/apps/details?id=com.huami.watch.hmwatchmanager',
        ),
        AppModel(
          'Zepp Life',
          'https://play.google.com/store/apps/details?id=com.xiaomi.hm.health',
        ),
        AppModel(
          'Mi Fitness',
          'https://play.google.com/store/apps/details?id=com.xiaomi.wearable',
        ),
        AppModel(
          'Notify Lite for Smartwatches',
          'https://play.google.com/store/apps/details?id=com.mc.notify',
        ),
        AppModel(
          'Notify for Amazfit',
          'https://play.google.com/store/apps/details?id=com.mc.amazfit1',
        ),
        AppModel(
          'Notify for Mi Band',
          'https://play.google.com/store/apps/details?id=com.mc.miband1',
        ),
        AppModel(
          'Notify Lite for Mi Band',
          'https://play.google.com/store/apps/details?id=com.mc.mibandlite1',
        ),
        AppModel(
          'Master for Amazfit',
          'https://play.google.com/store/apps/details?id=blacknote.amazfitmaster',
        ),
        AppModel(
          'Master for Mi Band',
          'https://play.google.com/store/apps/details?id=blacknote.mibandmaster',
        ),
        AppModel(
          'Tools & Amazfit',
          'https://play.google.com/store/apps/details?id=cz.zdenek.amazfittools',
        ),
        AppModel(
          'Tools & Mi Band',
          'https://play.google.com/store/apps/details?id=cz.zdenek.mibandtools',
        ),
        AppModel(
          'Watch Droid Phone',
          'https://play.google.com/store/apps/details?id=com.lumaticsoft.watchdroidphone',
        ),
        AppModel(
          'Watch Droid Assistant',
          'https://play.google.com/store/apps/details?id=com.lumaticsoft.watchdroidassistant',
        ),
        AppModel(
          'Gadgetbridge',
          'https://f-droid.org/ru/packages/nodomain.freeyourgadget.gadgetbridge/',
        ),
        AppModel(
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
