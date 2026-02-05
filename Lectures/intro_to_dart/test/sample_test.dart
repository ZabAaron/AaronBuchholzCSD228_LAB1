import 'package:test/test.dart';

/// This is a basic Dart unit test suite.
///
/// Unit tests are meant to cover APIs (Application Programming Interface) or
/// functionality of an object.
///
/// There are plethora ways to design your tests, one such pattern is BDD (Behaviour
/// Driven Development) where you design tests first (knowing they fail) and then
/// add functionality. When Flutter is introduced this will come back up.
void main() {
  // setUp is the function used to initialize / preconfigure the environment for
  // testing. At the top level like this is called before the groups. If contained
  // within a group a setUp call is only scoped to apply to that group.
  setUp(() {
    // This could also be an async function.
  });

  // tearDown is the clean up function. This resets mocks or removes temp file etc.
  // It behaves similarly to setUp.
  tearDown(() {
    // This could also be an async function.
  });

  group('A group (aka a suite) of tests', () {
    // Warning! This may seem similar to setUp but this calls all setUp functions
    // until it reaches the root of the main scope. In general avoid this function
    // unless the configuration is too slow. eg. You have a long running async
    // process to set up in the group's test environment.
    //
    // Called _before all_ tests within the group. This could cause interdependent
    // tests when they should be isolated.
    setUpAll(() {
      // This could also be an async function.
    });

    // In general avoid this function
    // unless the configuration is too slow. eg. You have a long running async
    // process to tear down in the group's test environment.
    //
    // Called _after all_ tests within the group. This could cause interdependent
    // tests when they should be isolated.
    tearDownAll(() {
      // This could also be an async function.
    });
    // Each test should target the smallest unit of work. This could be a single
    // function or it could be to enforce assertions.
    test('like me', () => expect(true, isTrue));
  });
}
