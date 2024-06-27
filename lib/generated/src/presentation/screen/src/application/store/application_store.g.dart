// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../../src/presentation/screen/src/application/store/application_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApplicationStore on _ApplicationStore, Store {
  late final _$statusAtom =
      Atom(name: '_ApplicationStore.status', context: context);

  @override
  AppOpenStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AppOpenStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$initializationProgressAtom =
      Atom(name: '_ApplicationStore.initializationProgress', context: context);

  @override
  double get initializationProgress {
    _$initializationProgressAtom.reportRead();
    return super.initializationProgress;
  }

  @override
  set initializationProgress(double value) {
    _$initializationProgressAtom
        .reportWrite(value, super.initializationProgress, () {
      super.initializationProgress = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_ApplicationStore.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
status: ${status},
initializationProgress: ${initializationProgress}
    ''';
  }
}
