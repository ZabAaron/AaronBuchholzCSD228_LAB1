import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// A simple interface demonstration.
///
/// As noted in [EquatableSimpleType.props] Dart doesn't have the keyword interface
/// but it does offer modifiers for classes; abstract is exactly that, a modifier,
/// and it allow for a default or an unimplemented (aka abstract) function.
abstract class SimpleServiceInterface<T extends Equatable> {
  /// The public accessor to the raw backing `data`.
  @protected
  @mustBeOverridden
  List<T> get data;

  @visibleForOverriding
  int Function(T prev, T next) get sort;

  @protected
  @mustBeOverridden
  void cacheData(List<T> data);
}
