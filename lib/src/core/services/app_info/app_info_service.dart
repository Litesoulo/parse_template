import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  static final PackageInfoService _instance = PackageInfoService._internal();

  factory PackageInfoService() {
    return _instance;
  }

  PackageInfoService._internal() {
    init();
  }

  init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  static late final PackageInfo packageInfo;
}
