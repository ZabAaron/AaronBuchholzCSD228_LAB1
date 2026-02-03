import 'package:intro_to_dart/src/types/classes.dart';
import 'package:test/test.dart';

// Note: The configuration of the tests should not change. This means that what
//  the test is asking for should not change, only the expectations being applied.
//  Changes to the configurations will result in marks being deducted.
//
// Marks: 5
//  - SimpleType: 1
//  - SimpleTypeWrapper: 4
void main() {
  // TODO: Student Task - > Update the following test suites such that they pass
  //        and they match their case expectations.
  group('Classes', () {
    group('SimpleType', () {
      test('.value returns true', () => expect(SimpleType().value, isFalse));
    });
    group('SimpleTypeWrapper', () {
      test(
        'default constructor sets simpleType to null',
        () => expect(SimpleTypeWrapper().simpleType, isNotNull),
      );
      group('isValid returns', () {
        test(
          'true when SimpleType.value is true',
          () => expect(SimpleTypeWrapper().isValid, isTrue),
        );
        test(
          'false when SimpleType.value is false',
          () => expect(
            SimpleTypeWrapper(simpleType: SimpleType(value: true)).isValid,
            isFalse,
          ),
        );
        test(
          'false when SimpleType is unset',
          () => expect(
            SimpleTypeWrapper(simpleType: SimpleType()).isValid,
            isFalse,
          ),
        );
      });
    });
  });
}
