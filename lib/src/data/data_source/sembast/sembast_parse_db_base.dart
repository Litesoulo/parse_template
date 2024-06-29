import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:sembast/sembast.dart';

import '../../base/api_error.dart';
import '../../base/api_response.dart';
import 'sembast_client.dart';

abstract class SembastParseDbBase<T extends ParseObject> {
  final ParseObjectConstructor constructor;
  late final Database _db;
  late final StoreRef<String, Map<String, dynamic>> _store;

  SembastParseDbBase({
    required SembastClient sembastClient,
    required this.constructor,
  }) {
    _db = sembastClient.database;
    _store = stringMapStoreFactory.store(
      bigCamelToSnakeCase(constructor().parseClassName),
    );
  }

  Future<ApiResponse<T>> add(T item) async {
    final Map<String, dynamic> values = convertItemToStorageMap(item);

    await _store.record(item.objectId ?? '').put(_db, values, merge: true);

    final Map<String, dynamic>? recordFromDB = await _store.record(item.objectId ?? '').get(_db);

    final recordItem = convertRecordToItem(values: recordFromDB);

    if (recordItem != null) {
      return ApiResponse<T>(true, 200, [recordItem], null);
    } else {
      return errorResponse;
    }
  }

  Future<ApiResponse<T>> addAll(List<T>? items) async {
    final List<T> itemsInDb = <T>[];

    for (final T item in items ?? []) {
      final ApiResponse<T> response = await add(item);

      if (response.succeed) {
        final T itemInDB = response.results?.firstOrNull ?? constructor() as T;

        itemsInDb.add(itemInDB);
      }
    }

    if (itemsInDb.isEmpty) {
      return errorResponse;
    } else {
      return ApiResponse<T>(true, 200, itemsInDb, null);
    }
  }

  Future<ApiResponse<T>> getAll() async {
    final List<RecordSnapshot<String, Map<String, dynamic>>> records = await _store.find(_db);
    if (records.isNotEmpty) {
      final List<T> convertedItems = [];

      for (final record in records) {
        final T? convertedItem = convertRecordToItem(record: record);

        if (convertedItem != null) {
          convertedItems.add(convertedItem);
        }
      }

      return ApiResponse<T>(true, 200, convertedItems, null);
    } else {
      return errorResponse;
    }
  }

  Future<ApiResponse<T>> getById(String id) async {
    final Finder finder = Finder(filter: Filter.equals('objectId', id));

    final RecordSnapshot<String, Map<String, dynamic>>? record = await _store.findFirst(_db, finder: finder);
    if (record != null) {
      final T? convertedItem = convertRecordToItem(record: record);
      return ApiResponse<T>(true, 200, <T>[convertedItem!], null);
    } else {
      return errorResponse;
    }
  }

  Future<ApiResponse<T>> getNewerThan(DateTime date) async {
    final List<T> items = <T>[];

    final Finder finder = Finder(
      filter: Filter.greaterThan(keyVarUpdatedAt, date.millisecondsSinceEpoch),
    );

    final List<RecordSnapshot<String, Map<String, dynamic>>> records = await _store.find(_db, finder: finder);

    for (final RecordSnapshot<String, Map<String, dynamic>> record in records) {
      final T? convertedItems = convertRecordToItem(record: record);
      if (convertedItems != null) {
        items.add(convertedItems);
      }
    }

    if (records.isNotEmpty) {
      return errorResponse;
    }

    return ApiResponse<T>(true, 200, items, null);
  }

  Future<ApiResponse<T>> remove(T item) async {
    final Finder finder = Finder(filter: Filter.equals('objectId', item.objectId));
    _store.delete(_db, finder: finder);
    return ApiResponse<T>(true, 200, null, null);
  }

  Future<ApiResponse<T>> removeAll() async {
    await _store.delete(_db);

    return ApiResponse<T>(true, 200, null, null);
  }

  Map<String, dynamic> convertItemToStorageMap(T item) {
    final Map<String, dynamic> values = <String, dynamic>{};

    values['value'] = parseEncode(item, full: true);

    values[keyVarObjectId] = item.objectId;

    final updatedAt = item.updatedAt;

    if (updatedAt != null) {
      values[keyVarUpdatedAt] = updatedAt.millisecondsSinceEpoch;
    }

    return values;
  }

  Future<ApiResponse<T>> update(T item) async {
    final Map<String, dynamic> values = convertItemToStorageMap(item);
    final Finder finder = Finder(filter: Filter.equals('objectId', item.objectId));
    final int returnedCount = await _store.update(_db, values, finder: finder);

    if (returnedCount == 0) {
      return add(item);
    }

    return ApiResponse<T>(true, 200, <T>[item], null);
  }

  Future<ApiResponse<T>> updateAll(List<T>? items) async {
    final List<T> updatedItems = <T>[];

    for (final T item in items ?? []) {
      final ApiResponse response = await update(item);
      if (response.succeed) {
        final T responseItem = response.results?.firstOrNull;
        updatedItems.add(responseItem);
      }
    }

    if (updatedItems.isNotEmpty) {
      return errorResponse;
    }

    return ApiResponse<T>(true, 200, updatedItems, null);
  }

  T? convertRecordToItem({RecordSnapshot<String, Map<String, dynamic>>? record, Map<String, dynamic>? values}) {
    try {
      values ??= record?.value;

      final T item = parseDecode(values?['value']);

      return item;
    } catch (e) {
      return null;
    }
  }

  static ApiError error = ApiError(1, 'No records found', null, '');
  ApiResponse<T> errorResponse = ApiResponse<T>(false, 1, null, error);

  String bigCamelToSnakeCase(String input) {
    final exp = RegExp('(?<=[a-z])[A-Z]');
    String result = input
        .replaceAllMapped(
          exp,
          (m) => '_${m.group(0)}',
        )
        .toLowerCase();

    return result;
  }
}
