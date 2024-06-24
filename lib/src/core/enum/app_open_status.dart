enum AppOpenStatus {
  /// The app is currently loading
  loading,

  /// The app is opened for the first time
  firstLaunch,

  /// The user is not authenticated
  unauthorized,

  /// The user is authenticated
  // authenticated,

  /// The user's credentials have expired
  // credentialsExpired,

  /// There was an error on launch
  error,

  /// The app requires an update before use
  // updateRequired,
}

extension AppOpenStatusX on AppOpenStatus {
  AppOpenStatus fromString(String value) {
    switch (value) {
      case 'loading':
        return AppOpenStatus.loading;
      case 'firstLaunch':
        return AppOpenStatus.firstLaunch;
      // case 'authenticated':
      //   return AppOpenStatus.authenticated;
      case 'unauthorized':
        return AppOpenStatus.unauthorized;
      // case 'credentialsExpired':
      //   return AppOpenStatus.credentialsExpired;
      case 'error':
        return AppOpenStatus.error;
      // case 'updateRequired':
      //   return AppOpenStatus.updateRequired;
      default:
        return AppOpenStatus.loading;
    }
  }
}
