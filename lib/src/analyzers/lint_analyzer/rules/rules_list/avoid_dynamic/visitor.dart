part of 'avoid_dynamic_rule.dart';

class _Visitor extends RecursiveAstVisitor<void> {
  final _nodes = <AstNode>[];

  Iterable<AstNode> get nodes => _nodes;

  @override
  void visitSimpleIdentifier(SimpleIdentifier node) {
    final parent = node.parent;
    if (parent is NamedType && (parent.type is DynamicType)) {
      final grandParent = node.parent?.parent;
      if (grandParent != null && !_isWithinMap(grandParent)) {
        _nodes.add(grandParent);
      }
    }
  }

  bool _isWithinMap(AstNode grandParent) {
    final grandGrandParent = grandParent.parent;

    return grandGrandParent is NamedType &&
            (grandGrandParent.type?.isDartCoreMap ?? false) ||
        grandGrandParent is SetOrMapLiteral && grandGrandParent.isMap;
  }
}
