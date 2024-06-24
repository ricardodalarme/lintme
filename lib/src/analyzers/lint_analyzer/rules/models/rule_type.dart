/// Represents a rule type. Used by documentation path construction.
enum RuleType {
  common('common'),
  flutter('flutter'),
  intl('intl'),
  angular('angular'),
  flame('flame');

  final String value;

  const RuleType(this.value);
}
