import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:touch_dice/pages/homepage.dart';

class WinnersScreen extends StatefulWidget {
  const WinnersScreen({super.key});

  @override
  WinnersScreenState createState() => WinnersScreenState();
}

class WinnersScreenState extends State<WinnersScreen> {
  final List<Offset> _touchPoints = [];
  final int _maxTouches = 10;
  String _statusMessage = "Touch the screen to place your fingers.";
  int _countdown = 4;
  Offset? _winningTouch;
  bool _isCountingDown = false;
  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    if (_touchPoints.length < 2) {
      setState(() {
        _statusMessage = "At least two fingers are required.";
        _touchPoints.clear();
        _isCountingDown = false;
      });
      return;
    }

    setState(() {
      _statusMessage = "Counting down...";
      _isCountingDown = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      for (int i = _countdown; i >= 1; i--) {
        Future.delayed(Duration(seconds: 7 - i), () {
          setState(() {
            _countdown = i;
          });
          if (i == 1) _selectWinner();
        });
      }
    });
  }

  void _selectWinner() {
    final random = Random();
    setState(() {
      _winningTouch = _touchPoints[random.nextInt(_touchPoints.length)];
      _statusMessage = "We have a winner!";
      _isCountingDown = false;
    });
  }

  void _resetGame() {
    setState(() {
      _touchPoints.clear();
      _winningTouch = null;
      _countdown = 4;
      _statusMessage = "Touch the screen to place your fingers.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Winners Game"),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (TapDownDetails details) {
          if (!_isCountingDown && _touchPoints.length < _maxTouches) {
            setState(() {
              _touchPoints.add(details.localPosition);
            });
            if (_touchPoints.length >= 2) {
              _debounceTimer?.cancel();
              _debounceTimer = Timer(const Duration(milliseconds: 500), () {
                if (!_isCountingDown) {
                  _startCountdown();
                }
              });
            }
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              // Circular Patches
              ..._touchPoints.map((point) {
                final isWinner = point == _winningTouch;
                return Positioned(
                  left: point.dx - 40, // Center for 80x80 container
                  top: point.dy - 40,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 150,
                    height: 150,
                    transform:
                        isWinner ? Matrix4.diagonal3Values(1.2, 1.2, 1) : null,
                    decoration: BoxDecoration(
                      color: isWinner ? Colors.amber : Colors.teal,
                      shape: BoxShape.circle,
                      boxShadow: isWinner
                          ? [
                              const BoxShadow(
                                color: Colors.amber,
                                blurRadius: 10,
                                spreadRadius: 2,
                              )
                            ]
                          : [],
                    ),
                  ),
                );
              }),

              // Status Message
              Center(
                child: Text(
                  _isCountingDown ? "$_countdown" : _statusMessage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Replay Button
              if (_winningTouch != null)
                SizedBox(
                  child: ElevatedButton.icon(
                    onPressed: _resetGame,
                    icon: const Icon(Icons.replay),
                    label: const Text("Replay"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
