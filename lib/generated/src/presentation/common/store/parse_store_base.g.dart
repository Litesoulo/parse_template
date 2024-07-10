// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/presentation/common/store/parse_store_base.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ParseStoreBase<T> on _ParseStoreBase<T>, Store {
  late final _$itemsFutureAtom =
      Atom(name: '_ParseStoreBase.itemsFuture', context: context);

  @override
  ObservableFuture<ApiResponse<T>> get itemsFuture {
    _$itemsFutureAtom.reportRead();
    return super.itemsFuture;
  }

  @override
  set itemsFuture(ObservableFuture<ApiResponse<T>> value) {
    _$itemsFutureAtom.reportWrite(value, super.itemsFuture, () {
      super.itemsFuture = value;
    });
  }

  late final _$itemsListAtom =
      Atom(name: '_ParseStoreBase.itemsList', context: context);

  @override
  List<T> get itemsList {
    _$itemsListAtom.reportRead();
    return super.itemsList;
  }

  @override
  set itemsList(List<T> value) {
    _$itemsListAtom.reportWrite(value, super.itemsList, () {
      super.itemsList = value;
    });
  }

  late final _$getItemsAsyncAction =
      AsyncAction('_ParseStoreBase.getItems', context: context);

  @override
  Future<void> getItems({bool? fromApi}) {
    return _$getItemsAsyncAction.run(() => super.getItems(fromApi: fromApi));
  }

  @override
  String toString() {
    return '''
itemsFuture: ${itemsFuture},
itemsList: ${itemsList}
    ''';
  }
}
