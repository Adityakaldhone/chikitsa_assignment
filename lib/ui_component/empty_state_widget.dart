import 'package:chikitsa_assign/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.empty.path, // You can replace this with your image asset
            height: 250,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          const Text(
            "Nothing Is Here, Add a Medicine",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
