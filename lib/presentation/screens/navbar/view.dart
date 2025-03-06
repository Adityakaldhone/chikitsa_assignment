import 'package:chikitsa_assign/presentation/screens/home_screen/view.dart';
import 'package:chikitsa_assign/presentation/screens/navbar/bloc.dart';
import 'package:chikitsa_assign/presentation/screens/navbar/event.dart';
import 'package:chikitsa_assign/presentation/screens/navbar/state.dart';
import 'package:chikitsa_assign/presentation/screens/profile_screen/view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavbarPage extends StatelessWidget {
  const NavbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavbarBloc(),
      child: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state.currentIndex,
              children: const [
                ProfilePage(),
                ReportPage(),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              surfaceTintColor: Colors.black26,
              shadowColor: Colors.grey,
              elevation: 6,
              height: 60,
              shape: const CircularNotchedRectangle(),
              notchMargin: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 35,
                      color:
                          state.currentIndex == 0 ? Colors.blue : Colors.black,
                    ),
                    onPressed: () {
                      context
                          .read<NavbarBloc>()
                          .add(const ChangeNavbarTabEvent(0));
                    },
                  ),
                  const SizedBox(width: 68), // Space for FAB
                  IconButton(
                    icon: Icon(
                      Icons.bar_chart,
                      size: 35,
                      color:
                          state.currentIndex == 1 ? Colors.blue : Colors.black,
                    ),
                    onPressed: () {
                      context
                          .read<NavbarBloc>()
                          .add(const ChangeNavbarTabEvent(1));
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(top: .0),
              child: SizedBox(
                height: 70,
                width: 70,
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () {},
                  shape: const CircleBorder(),
                  child:  const Icon(
                    Icons.add,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }
}
