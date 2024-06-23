class InitializationStep {
  final String title;
  final Future<void> Function() init;

  InitializationStep({
    required this.title,
    required this.init,
  });
}
