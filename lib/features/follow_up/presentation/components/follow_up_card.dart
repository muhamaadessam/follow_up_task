import 'package:flutter/material.dart';

import '../../domain/entities/follow_up_entity.dart';

class FollowUpCard extends StatelessWidget {
  final FollowUpEntity followUp;

  const FollowUpCard(this.followUp, {super.key});

  Color get statusColor {
    switch (followUp.status) {
      case FollowUpStatus.completed:
        return Colors.green;
      case FollowUpStatus.scheduled:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,

      child: ListTile(
        title: Text(
          followUp.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 2,
          children: [
            Text(followUp.description, style: TextStyle(fontSize: 16)),
            if (followUp.customerName != null)
              Text(
                followUp.customerName!,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              ),
          ],
        ),
        trailing: Icon(Icons.circle, color: statusColor, size: 12),
      ),
    );
  }
}
