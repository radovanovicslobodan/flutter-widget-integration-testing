// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gherkin_suite_test.dart';

// **************************************************************************
// GherkinSuiteTestGenerator
// **************************************************************************

class _CustomGherkinIntegrationTestRunner extends GherkinIntegrationTestRunner {
  _CustomGherkinIntegrationTestRunner(
    TestConfiguration configuration,
    Future<void> Function(World) appMainFunction,
  ) : super(configuration, appMainFunction);

  @override
  void onRun() {
    testFeature0();
    testFeature1();
  }

  void testFeature0() {
    runFeature(
      'User registration flow:',
      <String>['@test'],
      () {
        runScenario(
          'User can registered with valid email and proper length password',
          <String>['@test'],
          (TestDependencies dependencies) async {
            await runStep(
              'When I fill the "emailInput" field with "test@test.me"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I tap the "nextButton" button',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I fill the "passwordInput" field with "12345"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I tap the "submitButton" button',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I expect the text "You succesfully saved your form." to be present',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: () async => onBeforeRunFeature(
            'User registration flow',
            <String>['@test'],
          ),
          onAfter: () async => onAfterRunFeature(
            'User registration flow',
          ),
        );
      },
    );
  }

  void testFeature1() {
    runFeature(
      'Testing Flutter with Gherkin:',
      <String>['@test'],
      () {
        runScenario(
          'User have some test data',
          <String>['@test'],
          (TestDependencies dependencies) async {
            await runStep(
              'Given: I have some test data',
              <String>["""SOME TEST DATA"""],
              null,
              dependencies,
            );
          },
          onBefore: () async => onBeforeRunFeature(
            'Testing Flutter with Gherkin',
            <String>['@test'],
          ),
          onAfter: () async => onAfterRunFeature(
            'Testing Flutter with Gherkin',
          ),
        );
      },
    );
  }
}

void executeTestSuite(
  TestConfiguration configuration,
  Future<void> Function(World) appMainFunction,
) {
  _CustomGherkinIntegrationTestRunner(configuration, appMainFunction).run();
}
