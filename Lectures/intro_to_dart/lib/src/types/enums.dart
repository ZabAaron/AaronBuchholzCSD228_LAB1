enum BasicDirectionEnum { north, east, south, west }

/// An enum representing the cardinal directions.
///
/// This is only supported from Dart >= 2.17. It provides a way to pass constant
/// data. That is the key piece; for enhanced enums to work they must be constant.
///
/// Enhanced enums also are exhaustive when using the switch statement like
/// regular PODOs (Plain Old Dart Object) but unlike those counter parts enhanced
/// enums are unable to be instantiated _outside_ of the enum; nor are you able
/// to provide factory (convenience) constructors.
enum EnhancedDirectionEnum {
  north(degrees: 0),
  east(degrees: 90),
  south(degrees: 180),
  west(degrees: 270);

  /// The [degrees] (radian) with respect to [north].
  ///
  /// This is a custom property on an enum.
  final int degrees;
  const EnhancedDirectionEnum({required this.degrees});

  EnhancedDirectionEnum invertDirection() {
    // A switch case is a type of control flow. It allows us to test against
    // various cases on a type and then react accordingly. It can be thought of
    // as a pattern matcher on a given type. There are cases, like this, where a
    // switch case is preferable to a series of if/else if/else blocks. They do
    // not replace if/else if/else blocks, but rather complement them.
    switch (this) {
      case north:
        return south;
      case east:
        return west;
      case south:
        return north;
      case west:
        return east;
    }
  }

  EnhancedDirectionEnum turnLeft() {
    switch (this) {
      case north:
        return west;
      case east:
        return north;
      case south:
        return east;
      case west:
        return south;
    }
  }

  EnhancedDirectionEnum turnRight() {
    switch (this) {
      case north:
        return east;
      case east:
        return south;
      case south:
        return west;
      case west:
        return north;
    }
  }

  static EnhancedDirectionEnum fromString(String direction) {
    assert(
      r'^(north|east|south|west)$'.allMatches(direction).isEmpty,
      'Provided direction should be one of the following: north, east, south, west',
    );

    return values
        .where((e) => e.name.toLowerCase() == direction.toLowerCase())
        .first;
  }
}
