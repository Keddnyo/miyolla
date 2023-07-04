enum DownloadFileType {
  firmware('Firmwares'),
  watchface('Dials');

  const DownloadFileType(this.title);
  final String title;
}
