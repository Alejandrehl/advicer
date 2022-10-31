# Advicer

Flutter, BLoC and Clean Architecture.

## Libraries & Dependencies

1. [Provider](https://pub.dev/packages/provider)
2. [Flutter BLoC](https://pub.dev/packages/flutter_bloc)
3. [Equatable](https://pub.dev/packages/equatable)
4. [Dartz](https://pub.dev/packages/dartz)
5. [DIO](https://pub.dev/packages/dio)
6. [Get it](https://pub.dev/packages/get_it)

## Flutter Testing

### Why do we write tests?

### Why should we test?

- Talk with your team and define your own testing pyramid, for example: Quantity of tests from high(bottom) to low(top).
  1. Integration:
     1. Low amount of tests
     2. Test a complete process of your app
     3. Hard to write and long execution time
     4. Examples:
        1. Make a deposit of your banking account
        2. Create an account of your social media app
        3. Helpful link: [https://docs.flutter.dev/cookbook/testing/integration/introduction](https://docs.flutter.dev/cookbook/testing/integration/introduction)
  2. UI(golden/widget tests):
     1. Medium amount of test
     2. Compares the current UI of your app with a defined image of this UI
     3. Not so hard to write and medium execution time
     4. Examples:
        1. Are all button state being as we expect them
     5. Helpful link 1: [https://verygood.ventures/blog/alchemist-golden-tests-tutorial](https://verygood.ventures/blog/alchemist-golden-tests-tutorial)
     6. Helpful link 2: [https://medium.com/flutter-community/flutter-golden-tests-common-widgets-with-snapshots-27f83f266cea](https://medium.com/flutter-community/flutter-golden-tests-common-widgets-with-snapshots-27f83f266cea)
  3. Business Logic(Unit/BLoC)

### Which kind of tests are available in flutter?
