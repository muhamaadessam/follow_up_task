import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/theme_cubit.dart';
import '../components/empty_state.dart';
import '../components/follow_up_card.dart';
import '../components/search_text_field.dart';
import '../components/status_filter_sheet.dart';
import '../controller/follow_up_cubit.dart';

class FollowUpListScreen extends StatelessWidget {
  const FollowUpListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Follow Ups'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => showStatusFilter(context),
          ),
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          ),
        ],
      ),
      body: BlocBuilder<FollowUpCubit, FollowUpState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: SearchTextField(),
              ),
              Expanded(
                child: state.filtered.isEmpty
                    ? const EmptyState()
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          final isTablet = constraints.maxWidth > 600;

                          return isTablet
                              ? GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 3,
                                      ),
                                  itemCount: state.filtered.length,
                                  itemBuilder: (context, index) =>
                                      FollowUpCard(state.filtered[index]),
                                )
                              : ListView.builder(
                                  itemCount: state.filtered.length,
                                  itemBuilder: (context, index) =>
                                      FollowUpCard(state.filtered[index]),
                                );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}