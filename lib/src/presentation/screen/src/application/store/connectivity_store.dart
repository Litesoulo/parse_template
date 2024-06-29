import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part '../../../../../../generated/src/presentation/screen/src/application/store/connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  _ConnectivityStore() {
    Connectivity().onConnectivityChanged.listen(
      (event) async {
        isOnline = await hasNetwork();
      },
    );
  }

  @observable
  bool isOnline = true;

  @observable
  Future<void> dispose() async {}
}

Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}
