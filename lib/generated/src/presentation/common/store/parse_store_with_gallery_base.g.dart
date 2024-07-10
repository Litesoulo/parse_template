// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/presentation/common/store/parse_store_with_gallery_base.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ParseStoreBaseWithGallery<T extends ParseObject, G extends ParseObject>
    on _ParseStoreBaseWithGallery<T, G>, Store {
  late final _$itemsFutureAtom =
      Atom(name: '_ParseStoreBaseWithGallery.itemsFuture', context: context);

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

  late final _$itemsGalleryFutureAtom = Atom(
      name: '_ParseStoreBaseWithGallery.itemsGalleryFuture', context: context);

  @override
  ObservableFuture<ApiResponse<G>> get itemsGalleryFuture {
    _$itemsGalleryFutureAtom.reportRead();
    return super.itemsGalleryFuture;
  }

  @override
  set itemsGalleryFuture(ObservableFuture<ApiResponse<G>> value) {
    _$itemsGalleryFutureAtom.reportWrite(value, super.itemsGalleryFuture, () {
      super.itemsGalleryFuture = value;
    });
  }

  late final _$itemsListAtom =
      Atom(name: '_ParseStoreBaseWithGallery.itemsList', context: context);

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

  late final _$itemsGalleryListAtom = Atom(
      name: '_ParseStoreBaseWithGallery.itemsGalleryList', context: context);

  @override
  List<G> get itemsGalleryList {
    _$itemsGalleryListAtom.reportRead();
    return super.itemsGalleryList;
  }

  @override
  set itemsGalleryList(List<G> value) {
    _$itemsGalleryListAtom.reportWrite(value, super.itemsGalleryList, () {
      super.itemsGalleryList = value;
    });
  }

  late final _$getItemsAsyncAction =
      AsyncAction('_ParseStoreBaseWithGallery.getItems', context: context);

  @override
  Future<void> getItems({bool? fromApi}) {
    return _$getItemsAsyncAction.run(() => super.getItems(fromApi: fromApi));
  }

  @override
  String toString() {
    return '''
itemsFuture: ${itemsFuture},
itemsGalleryFuture: ${itemsGalleryFuture},
itemsList: ${itemsList},
itemsGalleryList: ${itemsGalleryList}
    ''';
  }
}
