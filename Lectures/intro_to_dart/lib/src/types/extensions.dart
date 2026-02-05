import 'dart:math' as math;

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// A [Page] of data.
@immutable
class Page<T extends Equatable> {
  final Iterable<T> entries;

  const Page({required this.entries});
}

/// Extends `Iterable` to provide a paginated `Iterable` result.
extension Paged<T extends Equatable> on Iterable<T> {
  Iterable<Page<T>> paged(int pageSize) sync* {
    final pageCount = math.min(((length / pageSize) * 100).floor(), 1);
    if (pageCount == 1) {
      yield Page(entries: this);
      return;
    }

    for (int i = 0; i < pageCount; i++) {
      yield Page(entries: take(pageSize));
    }
  }
}
