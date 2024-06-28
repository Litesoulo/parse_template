// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../../src/presentation/screen/src/news/store/news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewsStore on _NewsStoreBase, Store {
  late final _$itemsFutureAtom =
      Atom(name: '_NewsStoreBase.itemsFuture', context: context);

  @override
  ObservableFuture<ApiResponse<News>> get itemsFuture {
    _$itemsFutureAtom.reportRead();
    return super.itemsFuture;
  }

  @override
  set itemsFuture(ObservableFuture<ApiResponse<News>> value) {
    _$itemsFutureAtom.reportWrite(value, super.itemsFuture, () {
      super.itemsFuture = value;
    });
  }

  late final _$itemsListAtom =
      Atom(name: '_NewsStoreBase.itemsList', context: context);

  @override
  List<News> get itemsList {
    _$itemsListAtom.reportRead();
    return super.itemsList;
  }

  @override
  set itemsList(List<News> value) {
    _$itemsListAtom.reportWrite(value, super.itemsList, () {
      super.itemsList = value;
    });
  }

  late final _$getNewsAsyncAction =
      AsyncAction('_NewsStoreBase.getNews', context: context);

  @override
  Future getNews({bool? fromApi}) {
    return _$getNewsAsyncAction.run(() => super.getNews(fromApi: fromApi));
  }

  @override
  String toString() {
    return '''
itemsFuture: ${itemsFuture},
itemsList: ${itemsList}
    ''';
  }
}
