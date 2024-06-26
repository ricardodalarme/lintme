void func() {
  final collection = [1, 2, 3, 4, 5];

  collection.where((item) => item.isEven).isNotEmpty; // LINT

  collection.where((item) => item.isEven).isEmpty; // LINT
}

void func2() {
  final collection = [1, 2, 3, 4, 5];

  collection.any((item) => item.isEven);

  collection.every((item) => !item.isEven);
}
