import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../domain/use_case/use_case.dart';
import '../../model/model.dart';

class InitParseSdkUseCase implements UseCase {
  @override
  Future call({params}) async {
    await Parse().initialize(
      'myappID',
      'http://95.85.112.134:1338/parse',
      clientKey: 'DXmeuwzNjZWV',
      debug: kDebugMode,
      clientCreator: ({bool? sendSessionId, SecurityContext? securityContext}) => ParseDioClient(
        sendSessionId: sendSessionId ?? true,
        securityContext: securityContext,
      ),
      parseUserConstructor: (
        username,
        password,
        emailAddress, {
        client,
        debug,
        sessionToken,
      }) =>
          CustomParseUser(
        username: username,
        password: password,
        emailAddress: emailAddress,
      ),
      registeredSubClassMap: <String, ParseObjectConstructor>{
        News.classname: () => News(),
        NewsGallery.classname: () => NewsGallery(),
      },
    );
  }
}
