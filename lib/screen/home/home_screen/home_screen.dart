import 'package:flutter/material.dart';
import 'package:xirfadkaab/screen/home/home_screen/content/home_content.dart';
import 'package:xirfadkaab/screen/home/home_screen/home_provider.dart';
import 'package:xirfadkaab/utils/app_consts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SingleChildScrollView(
            child: HomeContent(
              provider: provider,
            ),
          ),
        );
      },
    );
  }
}
