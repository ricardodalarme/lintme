import 'package:dart_code_metrics/src/analyzers/lint_analyzer/models/severity.dart';
import 'package:dart_code_metrics/src/analyzers/lint_analyzer/rules/rules_list/prefer_any_or_every/prefer_any_or_every_rule.dart';
import 'package:test/test.dart';

import '../../../../../helpers/rule_test_helper.dart';

const _examplePath = 'prefer_any_or_every/examples/example.dart';

void main() {
  group(
    'PreferWildcardPatternRule',
    () {
      test('initialization', () async {
        final unit = await RuleTestHelper.resolveFromFile(_examplePath);
        final issues = PreferAnyOrEveryRule().check(unit);

        RuleTestHelper.verifyInitialization(
          issues: issues,
          ruleId: 'prefer-any-or-every',
          severity: Severity.style,
        );
      });

      test('reports about found issues', () async {
        final unit = await RuleTestHelper.resolveFromFile(_examplePath);
        final issues = PreferAnyOrEveryRule().check(unit);

        RuleTestHelper.verifyIssues(
          issues: issues,
          startLines: [4, 6],
          startColumns: [3, 3],
          messages: [
            'Prefer using .any() or .every() instead of .isEmpty or .isNotEmpty',
            'Prefer using .any() or .every() instead of .isEmpty or .isNotEmpty',
          ],
          locationTexts: [
            'collection.where((item) => item.isEven).isNotEmpty',
            'collection.where((item) => item.isEven).isEmpty',
          ],
        );
      });
    },
  );
}
