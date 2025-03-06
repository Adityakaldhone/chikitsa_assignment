import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Report', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Today's Report Card
            _todayReportCard(),

            const SizedBox(height: 12),

            // Dashboard Card
            _dashboardCard(),

            const SizedBox(height: 16),

            // Check History Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Check History", style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 16),
                  onPressed: () {},
                ),
              ],
            ),

            // Day Selector
            _daySelector(),

            const SizedBox(height: 16),

            // Morning Reminder
            const Text("Morning 08:00 am", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _medicineCard("Calpol 500mg Tablet", "Before Breakfast", "Day 01", "Taken", Colors.green, Icons.notifications_active),

            const SizedBox(height: 8),
            _medicineCard("Calpol 500mg Tablet", "Before Breakfast", "Day 27", "Missed", Colors.red, Icons.notifications_off),

            const SizedBox(height: 16),

            // Afternoon Reminder
            const Text("Afternoon 02:00 pm", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _medicineCard("Calpol 500mg Tablet", "After Food", "Day 01", "Snoozed", Colors.orange, Icons.notifications_paused),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, size: 32),
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _todayReportCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Today's Report", style: TextStyle(fontWeight: FontWeight.bold)),
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
                Text("Check Dashboard", style: TextStyle(fontWeight: FontWeight.bold)),
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
            child: CircularProgressIndicator(
              value: 0.7,
              strokeWidth: 6,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
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

  Widget _medicineCard(String name, String timing, String day, String status, Color statusColor, IconData icon) {
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
                Text("$timing   |   $day", style: const TextStyle(color: Colors.grey)),
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

  Widget _reportItem(String count, String label) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          spreadRadius: 1,
          offset: const Offset(0, 2),
        )
      ],
    );
  }

  Widget _bottomNavBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: const Icon(Icons.home), onPressed: () {}),
          const SizedBox(width: 48),  // Space for FAB
          IconButton(icon: const Icon(Icons.bar_chart), onPressed: () {}),
        ],
      ),
    );
  }
}
