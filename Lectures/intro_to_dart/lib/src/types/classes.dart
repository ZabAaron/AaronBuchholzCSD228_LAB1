import 'package:equatable/equatable.dart';

/// SimpleType is a constant compatible type (values are known at compile time / don't
/// change over the lifetime of the application).
class SimpleType {
  /// I am a constructor. In Object-Oriented Programming (OOP) languages they act
  /// as a way to provide a new instance of the type.
  const SimpleType({bool? value}) : _value = value;

  /// This is a _private_ field (the identifier starts with an underscore). This
  /// means that it can be used internally to the type and isn't exposed to other
  /// types.
  final bool? _value;

  /// This is a public getter for [_value].
  bool? get value => _value;

  /// A null safe way to expose
  bool get isSet => _value != null;

  /// The equality operator compares two objects to see if they are equal.
  ///
  /// If this method is overridden the `hashCode` getter *should* be overridden
  /// as well.
  @override
  bool operator ==(Object other) {
    if (other is! SimpleType) return false;
    return identical(this, other) || other._value == _value;
  }

  @override
  int get hashCode => super.hashCode ^ _value.hashCode;
}

class SimpleTypeWrapper {
  /// This version of simpleType is nullable, which means it may or may not have a
  /// value. Since Dart (and Flutter by extension) is null-safe we are explicitly
  /// saying this might not have a value.
  final SimpleType? simpleType;

  /// This constructor looks different to the one above. This constructor is able
  /// to reference the _public_ type but not private ones. This also defaults the
  /// value to be `null` unless it is provided.
  const SimpleTypeWrapper({this.simpleType});

  /// While the _boolean field is private to everything else within and outside
  /// this package, this type is able to know of the field because it is within
  /// the same file. This is an anti-pattern; when designing objects you should
  /// be aiming to target the _public_ API. We would instead expect to see
  /// something like this:
  /// ```dart
  ///  bool get isValid => simpleType?.value ?? false;
  /// ```
  ///
  /// Breaking down the line below:
  ///  Since simpleType is nullable we need to explicitly handle the case where isn't
  ///  set.
  bool get isValid => simpleType?.isSet ?? false;
}

/// The [EquatableSimpleType] has an *explicit* base class it is extending.
///
/// Let's break this down a bit.
///
/// Dart, and subsequently Flutter, has OOP as a paradigm (a style). In Dart,
/// everything is an [Object], or rather they extend it. When defining classes,
/// [Object] is implicitly extended, which is why you don't see "extends Object"
/// at the end of the class.
class EquatableSimpleType extends Equatable {
  final bool _value;
  const EquatableSimpleType({bool boolean = true}) : _value = boolean;

  /// This set of props overrides the original provided in the [Equatable] class.
  ///
  /// You will notice that this is a required override. Since [Equatable] is an
  /// abstract class, aka an interface in Dart, that provides an accessor by not
  /// but not a fully defined implementation.
  ///
  /// Note: Dart doesn't have the keyword interface. More on that shortly.
  @override
  List<Object?> get props => [_value];

  @override
  bool? get stringify => false;
}

base class BaseClass {}

sealed class SealedBaseSubClass extends BaseClass {}

final class FinalSealedBasSubClass extends SealedBaseSubClass {}

final class FinalBaseSubClass extends BaseClass {}

mixin class SuperAwesomeAbilitiesMixin {}

mixin class Flyable {
  void fly() {}
}

class Bird {}

class Dodo extends Bird {}

class Pigeon extends Bird with Flyable {}

final class SuperBaseClass extends BaseClass with SuperAwesomeAbilitiesMixin {}
