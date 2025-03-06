import 'package:chikitsa_assign/presentation/screens/home_screen/bloc.dart';
import 'package:chikitsa_assign/presentation/screens/home_screen/event.dart';
import 'package:chikitsa_assign/presentation/screens/home_screen/state.dart';
import 'package:chikitsa_assign/ui_components/circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportBloc()..add(LoadReportEvent()),
      child: BlocConsumer<ReportBloc, ReportState>(
        listener: (context, state) {
          // Optional: Handle things like toasts or error dialogs here
        },
        builder: (context, state) {
          return _buildPage(context, state);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, ReportState state) {
    switch (state.status) {
      case ReportStatus.initial:
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      case ReportStatus.loading:
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      case ReportStatus.loaded:
        return Page(state: state);
      case ReportStatus.error:
        return const Scaffold(
          body: Center(child: Text("Failed to load report")),
        );
    }
  }
}

class Page extends StatelessWidget {
  final ReportState state;

  const Page({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text('Report',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black)),
      ),
      body: ReportContent(state: state), // Content separated into widget
    );
  }
}

class ReportContent extends StatelessWidget {
  final ReportState state;

  const ReportContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Card(child: _todayReportCard()),
          const SizedBox(height: 12),
          Card(child: _dashboardCard()),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Check History",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: () {},
              ),
            ],
          ),
          _daySelector(),
          const SizedBox(height: 16),
          const Text("Morning 08:00 am",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _medicineCard("Calpol 500mg Tablet", "Before Breakfast", "Day 01",
              "Taken", Colors.green, Icons.notifications_active),
          const SizedBox(height: 8),
          _medicineCard("Calpol 500mg Tablet", "Before Breakfast", "Day 27",
              "Missed", Colors.red, Icons.notifications_off),
          const SizedBox(height: 16),
          const Text("Afternoon 02:00 pm",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _medicineCard("Calpol 500mg Tablet", "After Food", "Day 01",
              "Snoozed", Colors.orange, Icons.notifications_paused),
        ],
      ),
    );
  }

  Widget _todayReportCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Today's Report",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _reportItem("5", "Total"),
              _reportItem("3", "Taken"),
              _reportItem("1", "Missed"),
              _reportItem("1", "Snoozed"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dashboardCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Check Dashboard",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(
                  "Here you will find everything related to your active and past medicines.",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            height: 50,
            width: 50,
            child: CustomPaint(
              painter: MultiColorProgressPainter(progress: 1.0),
            ),
          )
        ],
      ),
    );
  }

  Widget _daySelector() {
    final days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return Column(
          children: [
            CircleAvatar(
              backgroundColor: index == 1 ? Colors.blue : Colors.grey.shade300,
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                    color: index == 1 ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 4),
            Text(days[index], style: const TextStyle(fontSize: 12)),
          ],
        );
      }),
    );
  }

  Widget _medicineCard(String name, String timing, String day, String status,
      Color statusColor, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.purple.shade100,
            child: const Icon(Icons.water_drop, color: Colors.purple),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("$timing   |   $day",
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Column(
            children: [
              Icon(icon, color: statusColor),
              Text(status, style: TextStyle(color: statusColor)),
            ],
          )
        ],
      ),
    );
  }

  Widget _reportItem(String count, String label) => Column(children: [
        Text(
          count,
          style:const TextStyle(color: Colors.blueAccent, fontSize: 23),
        ),
        Text(label)
      ]);

  BoxDecoration _cardDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)
        ],
      );
}
