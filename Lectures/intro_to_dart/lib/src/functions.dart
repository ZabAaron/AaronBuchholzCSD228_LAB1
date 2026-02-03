// This is a named import, it allows you to provide a namespace to access the
// exports from.
import 'dart:math' as math;

import 'package:intro_to_dart/src/types/classes.dart';

// Breaking down a function signature in Dart

/// This is a simple expression call (arrow syntax)
///
/// [SimpleType] is what is returned to the consumer.
/// `aSimpleFunctionExample` is how consumer would call the function. In this
/// case since the function is just creating a type we used the arrow syntax.
/// The functions following are using what is known as a block scope function.
/// This simply means that the function is the encapsulated within the two {}
/// (the scope). For now, we will look at _synchronous_ functions and will dive
/// into _asynchronous_ function within the advanced_dart
SimpleType aSimpleFunctionExample() => SimpleType();

/// Conditional access is a common pattern in software development.
///
/// Dart supports if / else blocks
void simpleIfElseBlockExampleFunction() {
  if (math.Random.secure().nextBool()) {
    print('I\'m a random true value.');
  } else {
    print('I\'m a random false value.');
  }
}

/// Sometimes complex conditions exist on value or result.
///
/// The if / else if / .. / else block enables checking for multiple checks. Note
/// these are treated as the "same" control flow. When working with these kinds
/// of blocks be mindful of where you place cases you are checking for. A good
/// rule of thumb is to cover uncommon / base cases first and then the rest (it
/// generally ends up with improved maintenance).
void simpleIfElseIfBlockExample() {
  final v = math.Random.secure().nextInt(125);
  if (v % 5 == 0) {
    print('5 is a factor of $v');
  } else if (v % 6 == 0 && v % 4 == 0) {
    print('4 & 6 are factors of $v');
  } else {
    print('What is a factor of $v');
  }
}

/// Sometimes we can provide an inline conditional setting of values.
///
/// The ternary is a powerful operator, but it can get very messy when there are
/// multiple levels of ternary nesting.
///
/// As a rule of thumb: avoid nesting ternaries if and when possible.
String simpleTernaryExample(int v) => v % 2 == 0 ? 'even' : 'odd';

/// The while loop, a reliable way to to iterate until a condition is true.
///
/// With that, you're likely wondering what it would look like if it were
/// _always_ be `true`.
///
/// ```dart
/// while (true) {
///   print('I will keep printing until time immemorial!');
/// }
/// ```
void simpleWhileExampleFunction() {
  var i = 0;
  // What would happen if you set i to 10?
  while (i < 10) {
    i++;
    print('$i');
  }
}

/// `do-while` and `while` loops are similar, with a notable difference.
///
/// The `do-while` loop differs from the `while` in that it does some work and
/// _then_ checks to see if the condition is met, stopping if so; otherwise it
/// continues on like a `while` loop.
void simpleDoWhileExampleFunction() {
  var i = 11;
  do {
    i++;
    print('Wassup!');
  } while (i < 10);
}
