import 'package:chikitsa_assign/gen/assets.gen.dart';
import 'package:chikitsa_assign/presentation/screens/home/bloc.dart';
import 'package:chikitsa_assign/presentation/screens/home/event.dart';
import 'package:chikitsa_assign/presentation/screens/home/state.dart';
import 'package:chikitsa_assign/ui_component/date_selector.dart';
import 'package:chikitsa_assign/ui_component/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(InitEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          switch (state.status) {
            case HomeStatus.initial:
              break;
            case HomeStatus.loading:
              break;
            case HomeStatus.loaded:
              break;
            case HomeStatus.error:
              break;
            case null:
          }
        },
        builder: (context, state) {
          return _buildPage(context, state);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, HomeState state) {
    switch (state.status) {
      case HomeStatus.initial:
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      case HomeStatus.loading:
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      case HomeStatus.loaded:
        return Page();
      default:
        return const Scaffold(
          body: Center(child: Text("Home default")),
        );
    }
  }
}

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi Harry!",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "5 Medicines Left",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_box_outlined,
                            color: Colors.blue),
                      ),
                      CircleAvatar(
                        child: Image.asset(Assets.defaultProfile.path),
                        radius: 18,
                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 16),

              // Date Selector (Component)
              DynamicDateSelector(
                onDateChanged: (DateTime selectedDate) {},
              ),

              const SizedBox(height: 16),

              // Empty State Widget (Component)
              const Expanded(child: EmptyStateWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
