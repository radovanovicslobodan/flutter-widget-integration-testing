import 'package:integration_test/integration_test_driver.dart'
    as integration_test_driver;

Future<void> main() {
  integration_test_driver.testOutputsDirectory =
      'integration_test/gherkin/reports';

  return integration_test_driver.integrationDriver(
    timeout: const Duration(minutes: 90),
  );
}
