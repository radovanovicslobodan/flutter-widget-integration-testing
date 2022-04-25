import 'package:gherkin/gherkin.dart';

final givenSampleData = given1(
  'I have some test data',
  (string, context) async {
    print(string);
  },
  configuration: StepDefinitionConfiguration()
    ..timeout = const Duration(seconds: 5),
);
