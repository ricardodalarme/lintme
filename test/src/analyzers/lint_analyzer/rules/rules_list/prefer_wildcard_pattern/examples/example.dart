void func() {
  const value = 1;

  final value = switch (object) {
    1 => 'good',
    Object() => 'bad', // LINT
    dynamic() => 'bad', // LINT
     _ => 'good',
  };
}

void func2() {
  final object = WithField('hello');

  final value = switch (object) {
    1 => 'good',
    _ => 'good',
  };
}
