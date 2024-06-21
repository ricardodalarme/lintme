part of 'prefer_wildcard_pattern_rule.dart';

class _Visitor extends RecursiveAstVisitor<void> {
  final _expressions = <SwitchExpressionCase>[];

  Iterable<SwitchExpressionCase> get expressions => _expressions;

  _Visitor();

  @override
  void visitSwitchExpressionCase(SwitchExpressionCase node) {
    final pattern = node.guardedPattern.pattern;
    if (pattern is ObjectPattern || pattern is DynamicType) {
      _expressions.add(node);
    }

    super.visitSwitchExpressionCase(node);
  }
}
