import 'package:fl_subscriber/core/widgets/consumer_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerPage<SplashControllerProvider> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  // TODO: implement provider
  get provider => splashPageProvider;
}
