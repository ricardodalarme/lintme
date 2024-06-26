part of 'prefer_any_or_every_rule.dart';

class _Visitor extends RecursiveAstVisitor<void> {
  final _invocations = <PropertyAccess>[];

  Iterable<PropertyAccess> get invocations => _invocations;

  @override
  void visitPropertyAccess(PropertyAccess node) {
    print(
      'INVOCATION visitArgumentList - ${node.propertyName} ${node.realTarget.parent?.parent.runtimeType}',
    );

    final property = node.propertyName.toString();
    final realTargetMethodContainsWhere =
        node.realTarget.toString().contains('where');

    if ((property == 'isEmpty' || property == 'isNotEmpty') &&
        realTargetMethodContainsWhere &&
        isIterableOrSubclass(node.realTarget.staticType)) {
      _invocations.add(node);
    }
    super.visitPropertyAccess(node);
  }
}
