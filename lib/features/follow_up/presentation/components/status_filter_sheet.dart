import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/follow_up_cubit.dart';

Color statusColor(StatusFilter filter) {
  switch (filter) {
    case StatusFilter.completed:
      return Colors.green;
    case StatusFilter.scheduled:
      return Colors.orange;
    default:
      return Colors.grey;
  }
}

void showStatusFilter(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: StatusFilter.values.map((filter) {
            return ListTile(
              title: Text(filter.name),
              onTap: () {
                context.read<FollowUpCubit>().filterBy(filter);
                Navigator.pop(context);
              },
              trailing: filter.name == 'all'
                  ? null
                  : Icon(Icons.circle, color: statusColor(filter), size: 12),
            );
          }).toList(),
        ),
      );
    },
  );
}
