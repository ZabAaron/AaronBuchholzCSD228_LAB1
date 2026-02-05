// I'm ensuring that you have what you need to cover the needed topics!
import 'types/classes.dart';

// Variable declaration

// I'm a dynamically set value that isn't reassignable.
final var1 = SimpleType();

// I can be reassigned as long as I am in scope!
var var2 = SimpleType();

// I'm a value who's values cannot be changed and is a compile-time known value.
const t = SimpleType();

// I work like var but have an explicit type. You can also apply the final or
// const keywords. Only use this notation to disambiguate the type, otherwise
// follow the Dart style guide when it comes to variable declaration.
SimpleType myType = SimpleType();

// Primitives
// Boolean
final myBool = true;
final myBool2 = false;
final result = var1.value ?? var2.value;
final notMyBool = !myBool;

// Strings
final myString = 'My super awesome string is immutable';

// Numbers
final myInt = 3;
final myBinaryInt = 0xb0011;
final myHexInt = 0x03;
final myDouble = 3.0;
final myDoubleScientific = 3.0e15; // Equivalent to 3 * 10^15
