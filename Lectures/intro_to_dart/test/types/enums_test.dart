import 'package:intro_to_dart/src/types/enums.dart';
import 'package:test/test.dart';

// Note: The configuration of the tests should not change. This means that what
//  the test is asking for should not change, only the expectations being applied.
//  Changes to the configurations will result in marks being deducted.
//
// Marks: 7
//  - Basic: 1
//  - Advanced: 6
void main() {
  // TODO: Student Task -> Update the following test suites such that they pass.
  group('Enums', () {
    group('Basic', () {
      test(
        '.values returns expected contents: north, east, south, west',
        () => expect(BasicDirectionEnum.values, []),
      );
    });
    group('Enhanced', () {
      test(
        '.values returns expected contents: north, east, south, west',
        () => expect(BasicDirectionEnum.values, []),
      );

      group('fromString', () {
        test('asserts provided string is a valid entry', () {
          final message = '';
          // 1. Provide a non-valid entry for the direction string.
          // 2. Update the contents of message to be the expected error response.
          expect(
            EnhancedDirectionEnum.fromString('north'),
            throwsA(
              isA<AssertionError>().having(
                (p0) => p0.message,
                'has the correct usage',
                message,
              ),
            ),
          );
        });

        // 1. This array should contain string entries for each of the cardinal
        //      directions
        ['I', 'ain\'t', 'a', 'direction'].forEach((direction) {
          test('$direction is a valid fromString', () {
            expect(
              EnhancedDirectionEnum.fromString(direction),
              isA<EnhancedDirectionEnum>().having(
                (p0) => p0.name,
                'name matches entry',
                direction,
              ),
            );
          });
        });
      });
    });
  });
}
