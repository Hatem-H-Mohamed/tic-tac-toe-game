import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe_game/core/app_assets/app_assets.dart';
import 'package:tic_tac_toe_game/screens/play_screen.dart';
import 'package:tic_tac_toe_game/widgets/gradient_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.background,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  top: 260,
                  left: 65,
                  child: Text(
                    'Tic-Tac-Toe',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Pick who goes first?",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25, top: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => PlayScreen(startingPlayer: 'X'),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    height: 164,
                    width: 164,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: SvgPicture.asset(AppAssets.xIcon),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => PlayScreen(startingPlayer: 'O'),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    height: 164,
                    width: 164,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: SvgPicture.asset(AppAssets.oIcon),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
