import 'package:flutter/material.dart';
import 'package:touch_dice/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text("Touch Dice",
            style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: kCardBackgroundColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Add settings functionality here
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Main Game Mode Options
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Winners Button
                    _buildGameModeCard(
                      context,
                      icon: Icons.emoji_events,
                      label: "Winners",
                      onPressed: () {
                        // Navigate to Winners page
                        print("Winners clicked");
                      },
                    ),
                    // Groups Button
                    _buildGameModeCard(
                      context,
                      icon: Icons.group,
                      label: "Groups",
                      onPressed: () {
                        // Navigate to Groups page
                        print("Groups clicked");
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Numbering Button
                _buildGameModeCard(
                  context,
                  icon: Icons.format_list_numbered,
                  label: "Numbering",
                  onPressed: () {
                    // Navigate to Numbering page
                    print("Numbering clicked");
                  },
                ),
              ],
            ),

            // Let's Play Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Start the game
                print("Let's Play clicked");
              },
              child: const Text(
                "Let's Play!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create game mode cards
  Widget _buildGameModeCard(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.green,
            width: label == "Winners"
                ? 2.0
                : 0.0, // Highlight 'Winners' by default
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
