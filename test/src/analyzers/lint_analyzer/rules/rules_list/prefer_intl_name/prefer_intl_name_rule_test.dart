import 'package:lintme/src/analyzers/lint_analyzer/models/severity.dart';
import 'package:lintme/src/analyzers/lint_analyzer/rules/rules_list/prefer_intl_name/prefer_intl_name_rule.dart';
import 'package:test/test.dart';

import '../../../../../helpers/rule_test_helper.dart';

const _examplePath = 'prefer_intl_name/examples/example.dart';
const _incorrectExamplePath =
    'prefer_intl_name/examples/incorrect_example.dart';
const _notExistingExamplePath =
    'prefer_intl_name/examples/not_existing_example.dart';

void main() {
  group('PreferIntlNameRule', () {
    test('initialization', () async {
      final unit = await RuleTestHelper.resolveFromFile(_examplePath);
      final issues = PreferIntlNameRule().check(unit);

      RuleTestHelper.verifyInitialization(
        issues: issues,
        ruleId: 'prefer-intl-name',
        severity: Severity.warning,
      );
    });

    test('reports no issues', () async {
      final unit = await RuleTestHelper.resolveFromFile(_examplePath);
      final issues = PreferIntlNameRule().check(unit);

      RuleTestHelper.verifyNoIssues(issues);
    });

    test('reports about found issues for incorrect names', () async {
      final unit = await RuleTestHelper.resolveFromFile(_incorrectExamplePath);
      final issues = PreferIntlNameRule().check(unit);

      RuleTestHelper.verifyIssues(
        issues: issues,
        startLines: [
          8,
          14,
          21,
          27,
          33,
          39,
          46,
          53,
          59,
          65,
          71,
          77,
          87,
          93,
          99,
          105,
          111,
          117,
          125,
          131,
          137,
          143,
          149,
          155,
          165,
          173,
          179,
          185,
          193,
          199,
          205,
          211,
          218,
          224,
          230,
          236,
          242,
          248,
        ],
        startColumns: [
          11,
          11,
          13,
          15,
          13,
          15,
          11,
          11,
          13,
          15,
          13,
          15,
          11,
          11,
          13,
          15,
          13,
          15,
          11,
          11,
          13,
          15,
          13,
          15,
          13,
          13,
          13,
          15,
          13,
          15,
          13,
          15,
          9,
          9,
          11,
          13,
          11,
          13,
        ],
        locationTexts: [
          "'SomeButtonClassI18n_staticFinalFieldInClass'",
          "'SomeButtonClassI18n_staticFieldInClass'",
          "'SomeButtonClassI18n_staticPropertyWithBodyInClass'",
          "'SomeButtonClassI18n_staticPropertyWithExpressionInClass'",
          "'SomeButtonClassI18n_staticMethodBodyInClass'",
          "'SomeButtonClassI18n_staticMethodExpressionInClass'",
          "'SomeButtonClassI18n_finalFieldInClass'",
          "'SomeButtonClassI18n_fieldInClass'",
          "'SomeButtonClassI18n_propertyWithBodyInClass'",
          "'SomeButtonClassI18n_propertyWithExpressionInClass'",
          "'SomeButtonClassI18n_methodBodyInClass'",
          "'SomeButtonClassI18n_methodExpressionInClass'",
          "'SomeButtonMixinI18n_staticFinalFieldInMixin'",
          "'SomeButtonMixinI18n_staticFieldInMixin'",
          "'SomeButtonMixinI18n_staticPropertyWithBodyInMixin'",
          "'SomeButtonMixinI18n_staticPropertyWithExpressionInMixin'",
          "'SomeButtonMixinI18n_staticMethodBodyInMixin'",
          "'SomeButtonMixinI18n_staticMethodExpressionInMixin'",
          "'SomeButtonMixinI18n_finalFieldInMixin'",
          "'SomeButtonMixinI18n_fieldInMixin'",
          "'SomeButtonMixinI18n_propertyWithBodyInMixin'",
          "'SomeButtonMixinI18n_propertyWithExpressionInMixin'",
          "'SomeButtonMixinI18n_methodBodyInMixin'",
          "'SomeButtonMixinI18n_methodExpressionInMixin'",
          "'ObjectExtensions_staticPropertyWithBodyInExtensions'",
          "'ObjectExtensions_staticPropertyWithExpressionInExtensions'",
          "'ObjectExtensions_staticMethodBodyInExtensions'",
          "'ObjectExtensions_staticMethodExpressionInExtensions'",
          "'ObjectExtensions_propertyWithBodyInExtensions'",
          "'ObjectExtensions_propertyWithExpressionInExtensions'",
          "'ObjectExtensions_methodBodyInExtensions'",
          "'ObjectExtensions_methodExpressionInExtensions'",
          "'finalField'",
          "'field'",
          "'propertyWithBody'",
          "'propertyWithExpression'",
          "'methodBody'",
          "'methodExpression'",
        ],
        messages: issues.map((issue) =>
            'Incorrect Intl name, should be ${issue.suggestion!.replacement}.'),
        replacements: [
          "'SomeButtonClassI18n_staticFinalFieldInClassTitle'",
          "'SomeButtonClassI18n_staticFieldInClassTitle'",
          "'SomeButtonClassI18n_staticPropertyWithBodyInClassTitle'",
          "'SomeButtonClassI18n_staticPropertyWithExpressionInClassTitle'",
          "'SomeButtonClassI18n_staticMethodBodyInClassTitle'",
          "'SomeButtonClassI18n_staticMethodExpressionInClassTitle'",
          "'SomeButtonClassI18n_finalFieldInClassTitle'",
          "'SomeButtonClassI18n_fieldInClassTitle'",
          "'SomeButtonClassI18n_propertyWithBodyInClassTitle'",
          "'SomeButtonClassI18n_propertyWithExpressionInClassTitle'",
          "'SomeButtonClassI18n_methodBodyInClassTitle'",
          "'SomeButtonClassI18n_methodExpressionInClassTitle'",
          "'SomeButtonMixinI18n_staticFinalFieldInMixinTitle'",
          "'SomeButtonMixinI18n_staticFieldInMixinTitle'",
          "'SomeButtonMixinI18n_staticPropertyWithBodyInMixinTitle'",
          "'SomeButtonMixinI18n_staticPropertyWithExpressionInMixinTitle'",
          "'SomeButtonMixinI18n_staticMethodBodyInMixinTitle'",
          "'SomeButtonMixinI18n_staticMethodExpressionInMixinTitle'",
          "'SomeButtonMixinI18n_finalFieldInMixinTitle'",
          "'SomeButtonMixinI18n_fieldInMixinTitle'",
          "'SomeButtonMixinI18n_propertyWithBodyInMixinTitle'",
          "'SomeButtonMixinI18n_propertyWithExpressionInMixinTitle'",
          "'SomeButtonMixinI18n_methodBodyInMixinTitle'",
          "'SomeButtonMixinI18n_methodExpressionInMixinTitle'",
          "'ObjectExtensions_staticPropertyWithBodyInExtensionsTitle'",
          "'ObjectExtensions_staticPropertyWithExpressionInExtensionsTitle'",
          "'ObjectExtensions_staticMethodBodyInExtensionsTitle'",
          "'ObjectExtensions_staticMethodExpressionInExtensionsTitle'",
          "'ObjectExtensions_propertyWithBodyInExtensionsTitle'",
          "'ObjectExtensions_propertyWithExpressionInExtensionsTitle'",
          "'ObjectExtensions_methodBodyInExtensionsTitle'",
          "'ObjectExtensions_methodExpressionInExtensionsTitle'",
          "'finalFieldTitle'",
          "'fieldTitle'",
          "'propertyWithBodyTitle'",
          "'propertyWithExpressionTitle'",
          "'methodBodyTitle'",
          "'methodExpressionTitle'",
        ],
        replacementComments: issues.map((_) => 'Rename'),
      );
    });

    test('reports about found issues for not existing names', () async {
      final unit =
          await RuleTestHelper.resolveFromFile(_notExistingExamplePath);
      final issues = PreferIntlNameRule().check(unit);

      RuleTestHelper.verifyIssues(
        issues: issues,
        startLines: [
          8,
          14,
          21,
          27,
          33,
          39,
          46,
          52,
          59,
          65,
          71,
          77,
          86,
          92,
          99,
          105,
          111,
          117,
          124,
          130,
          137,
          143,
          149,
          155,
          165,
          171,
          177,
          184,
          190,
          196,
          202,
          208,
          215,
          221,
          227,
          233,
        ],
        startColumns: [
          59,
          48,
          17,
          70,
          17,
          62,
          46,
          35,
          17,
          57,
          17,
          49,
          59,
          48,
          17,
          70,
          17,
          62,
          46,
          35,
          17,
          57,
          17,
          49,
          12,
          17,
          67,
          62,
          17,
          54,
          37,
          26,
          15,
          48,
          15,
          40,
        ],
        locationTexts: issues.map((_) => 'message'),
        messages: issues.map((_) => 'Argument `name` does not exists.'),
      );
    });
  });
}
