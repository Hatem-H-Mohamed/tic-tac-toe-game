import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/core/theme/app_colors.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;
  const GradientScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: body,
      ),
    );
  }
}
