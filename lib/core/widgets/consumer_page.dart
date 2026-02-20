import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ConsumerPage<K> extends ConsumerWidget {
  const ConsumerPage({super.key});

  K get provider;
}
