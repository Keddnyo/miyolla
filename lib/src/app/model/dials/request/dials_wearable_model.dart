class DialsWearableModel {
  final String deviceName, deviceAlias;
  DialsWearableModel(this.deviceName, this.deviceAlias);

  static List<DialsWearableModel> get list => [
        DialsWearableModel('Redmi Band', 'mijia.watch.band01'),
        DialsWearableModel('Xiaomi Mi Smart Band 5', 'hmpace.bracelet.v5'),
        DialsWearableModel('Xiaomi Mi Smart Band 6', 'hmpace.motion.v6'),
        DialsWearableModel('Xiaomi Smart Band 7', 'hmpace.watch.v7'),
        DialsWearableModel('Xiaomi Smart Band 7 Pro', 'hqbd3.watch.l67'),
        DialsWearableModel('Xiaomi Smart Band 7 Pro In', 'hqbd3.watch.l67in'),
        DialsWearableModel('Xiaomi Smart Band 8', 'miwear.watch.m66'),
        DialsWearableModel('Xiaomi Smart Band 8 GL', 'miwear.watch.m66gl'),
        DialsWearableModel('Xiaomi Smart Band 8 NFC', 'miwear.watch.m66nfc'),
        DialsWearableModel('Xiaomi Smart Band 8 DSN', 'miwear.watch.m66dsn'),
        DialsWearableModel('Poco Watch', 'midr.watch.k65w'),
        DialsWearableModel('Redmi Watch', 'midr.watch.k65'),
        DialsWearableModel('Redmi Watch 2', 'midr.watch.k65in'),
        DialsWearableModel('Xiaomi Watch', 'midr.watch.k62'),
        DialsWearableModel('Xiaomi Watch S', 'midr.watch.k62a'),
        DialsWearableModel('Xiaomi Watch S1', 'midr.watch.k63'),
        DialsWearableModel('Xiaomi Watch S1 Active', 'midr.watch.k63a'),
        DialsWearableModel('Xiaomi Mi Watch', 'xiaomi.watch.mars'),
        DialsWearableModel('Xiaomi Mi Watch Lite', 'mijia.watch.v1'),
        DialsWearableModel('Xiaomi Mi Watch Color', 'midr.watch.ds'),
        DialsWearableModel('Xiaomi Mi Watch Color Sports', 'midr.watch.sports'),
        DialsWearableModel('Xiaomi Mi Watch Global', 'mijia.watch.l61')
      ];
}
