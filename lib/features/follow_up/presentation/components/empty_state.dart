import 'package:flutter/material.dart';

import '../../../../res/assets.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Image(image: AssetImage(Assets.noDataImage)),
          SizedBox(height: 16),
          Text('No Follow Ups Found', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
