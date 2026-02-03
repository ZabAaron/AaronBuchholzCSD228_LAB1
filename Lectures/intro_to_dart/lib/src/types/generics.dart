import 'package:equatable/equatable.dart';

import 'interfaces.dart';

/// An in memory version of our API.
///
/// Let's break down what is actually going on here.
///
/// Firstly, [T] is _any_ type that has all the base functionality from
/// [Equatable]. This class implements [SimpleServiceInterface], which means it
/// conforms to the
class SimpleInMemoryServiceApi<T extends Equatable>
    implements SimpleServiceInterface<T> {
  /// The number of entries per page.
  final int pageSize;

  /// The underlying data backing service.
  final _data = <T>[];

  SimpleInMemoryServiceApi({
    required this.sort,
    this.pageSize = 15,
    List<T>? data,
  }) {
    // Update the internally cached data.
    cacheData(data ?? <T>[]);
  }

  @override
  late final int Function(T prev, T next) sort;

  @override
  void cacheData(List<T> data) => _data
    ..addAll(data)
    ..sort(sort);

  @override
  List<T> get data => _data;
}
