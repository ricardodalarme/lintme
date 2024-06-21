import 'package:dart_code_metrics/src/analyzers/lint_analyzer/models/severity.dart';
import 'package:dart_code_metrics/src/analyzers/lint_analyzer/rules/rules_list/prefer_wildcard_pattern/prefer_wildcard_pattern_rule.dart';
import 'package:test/test.dart';

import '../../../../../helpers/rule_test_helper.dart';

const _examplePath = 'prefer_wildcard_pattern/examples/example.dart';

void main() {
  group(
    'PreferWildcardPatternRule',
    () {
      test('initialization', () async {
        final unit = await RuleTestHelper.resolveFromFile(_examplePath);
        final issues = PreferWildcardPatternRule().check(unit);

        RuleTestHelper.verifyInitialization(
          issues: issues,
          ruleId: 'prefer-wildcard-pattern',
          severity: Severity.style,
        );
      });

      test('reports about found issues', () async {
        final unit = await RuleTestHelper.resolveFromFile(_examplePath);
        final issues = PreferWildcardPatternRule().check(unit);

        RuleTestHelper.verifyIssues(
          issues: issues,
          startLines: [6, 7],
          startColumns: [5, 5],
          messages: [
            'Prefer wildcard pattern.',
            'Prefer wildcard pattern.',
          ],
          locationTexts: [
            "Object() => 'bad'",
            "dynamic() => 'bad'",
          ],
        );
      });
    },
  );
}
