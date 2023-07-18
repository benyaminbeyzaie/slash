String prettifyFileSize(int bytes) {
  if (bytes <= 0) return "0 B";

  const int kb = 1024;
  const int mb = kb * 1024;
  const int gb = mb * 1024;
  const int tb = gb * 1024;

  if (bytes >= tb) {
    double size = bytes / tb;

    return "${size.toStringAsFixed(2)} TB";
  } else if (bytes >= gb) {
    double size = bytes / gb;

    return "${size.toStringAsFixed(2)} GB";
  } else if (bytes >= mb) {
    double size = bytes / mb;

    return "${size.toStringAsFixed(2)} MB";
  } else if (bytes >= kb) {
    double size = bytes / kb;

    return "${size.toStringAsFixed(2)} KB";
  }

  return "$bytes B";
}
