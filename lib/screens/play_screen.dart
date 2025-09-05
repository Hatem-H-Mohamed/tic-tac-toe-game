import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe_game/core/app_assets/app_assets.dart';
import 'package:tic_tac_toe_game/widgets/gradient_scaffold.dart';

class PlayScreen extends StatefulWidget {
  final String startingPlayer;
  const PlayScreen({super.key, required this.startingPlayer});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  List<String> board = List.filled(9, ""); // 3x3 board
  bool isPlayer1 = true; // true = X, false = O

  Timer? _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _seconds = 0;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  String get _formattedTime {
    int minutes = _seconds ~/ 60;
    int secs = _seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  void _onTap(int index) {
    if (board[index].isNotEmpty) return; // prevent overwrite

    setState(() {
      board[index] = isPlayer1
          ? widget.startingPlayer
          : (widget.startingPlayer == "X" ? "O" : "X");
      isPlayer1 = !isPlayer1;
    });

    String? winner = _checkWinner();
    if (winner != null) {
      _showWinnerDialog(winner);
    } else if (!board.contains("")) {
      _showWinnerDialog("Draw");
    }
  }

  String? _checkWinner() {
    // Winning combinations (indices)
    List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combo in winningCombinations) {
      String a = board[combo[0]];
      String b = board[combo[1]];
      String c = board[combo[2]];

      if (a.isNotEmpty && a == b && b == c) {
        return a; // "X" or "O"
      }
    }
    return null;
  }

  void _showWinnerDialog(String winner) {
    _timer?.cancel(); // stop timer when game ends

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(winner == "Draw" ? "It’s a Draw!" : "$winner Wins!"),
        content: Text("Game time: $_formattedTime"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetGame();
            },
            child: const Text("Play Again"),
          ),
        ],
      ),
    );
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, "");
      isPlayer1 = true;
      _startTimer();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          child: Column(
            children: [
              // Timer container
              Container(
                height: 65,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(44)),
                ),
                child: Center(
                  child: Text(
                    _formattedTime,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                isPlayer1
                    ? "${widget.startingPlayer}’s Turn"
                    : "${widget.startingPlayer == "X" ? "O" : "X"}’s Turn",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        AppAssets.backgroundGrid,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 100 / 176,
                          ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _onTap(index);
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Center(
                              child: board[index].isNotEmpty
                                  ? SvgPicture.asset(
                                      board[index] == "X"
                                          ? AppAssets.xIcon
                                          : AppAssets.oIcon,
                                      width: 80,
                                      height: 80,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
