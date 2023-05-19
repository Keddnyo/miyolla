class DialModel {
  final String deviceName, deviceAlias;
  DialModel(this.deviceName, this.deviceAlias);

  static List<DialModel> get list => [
        DialModel('Redmi Band', 'mijia.watch.band01'),
        DialModel('Xiaomi Mi Smart Band 5', 'hmpace.bracelet.v5'),
        DialModel('Xiaomi Mi Smart Band 6', 'hmpace.motion.v6'),
        DialModel('Xiaomi Smart Band 7', 'hmpace.watch.v7'),
        DialModel('Xiaomi Smart Band 7 Pro', 'hqbd3.watch.l67'),
        DialModel('Xiaomi Smart Band 7 Pro In', 'hqbd3.watch.l67in'),
        DialModel('Poco Watch', 'midr.watch.k65w'),
        DialModel('Redmi Watch', 'midr.watch.k65'),
        DialModel('Redmi Watch 2', 'midr.watch.k65in'),
        DialModel('Xiaomi Watch', 'midr.watch.k62'),
        DialModel('Xiaomi Watch S', 'midr.watch.k62a'),
        DialModel('Xiaomi Watch S1', 'midr.watch.k63'),
        DialModel('Xiaomi Watch S1 Active', 'midr.watch.k63a'),
        DialModel('Xiaomi Mi Watch', 'xiaomi.watch.mars'),
        DialModel('Xiaomi Mi Watch Lite', 'mijia.watch.v1'),
        DialModel('Xiaomi Mi Watch Color', 'midr.watch.ds'),
        DialModel('Xiaomi Mi Watch Color Sports', 'midr.watch.sports'),
        DialModel('Xiaomi Mi Watch Global', 'mijia.watch.l61')
      ];
}
