import 'package:flutter/material.dart';

import '../../../../core/widgets/top_app_bar.dart';
import '../widgets/profile_bloc_consumer.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopAppBar(title: 'حسابي'),
      body: ProfileBlocConsumer(),
    );
  }
}
