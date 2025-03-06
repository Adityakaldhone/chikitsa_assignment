import 'package:chikitsa_assign/presentation/screens/profile_screen/bloc.dart';
import 'package:chikitsa_assign/presentation/screens/profile_screen/event.dart';
import 'package:chikitsa_assign/presentation/screens/profile_screen/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(LoadProfileEvent()),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _buildPage(context, state);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, ProfileState state) {
    switch (state.status) {
      case ProfileStatus.initial:
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      case ProfileStatus.loading:
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      case ProfileStatus.loaded:
        return const Page();
      case ProfileStatus.error:
        return const Scaffold(
          body: Center(child: Text("Failed to load profile")),
        );
    }
  }
}




class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(160), // Adjust height for profile section
        child: Card(
          elevation: 3,
          shadowColor: Colors.white60,
          child: AppBar(
            backgroundColor: Colors.white,
            flexibleSpace:const Padding(
              padding:  EdgeInsets.only(
                top: 90,
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/women/45.jpg'),
                    ),
                     SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text(
                          "Take Care!",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          "Richa Bose",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            leading: IconButton(
              icon:const Icon(Icons.chevron_left, color: Colors.black, size: 40),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Settings Section
            const Text("Settings",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSettingItem(Icons.notifications_none, "Notification",
                "Check your medicine notification"),
            _buildSettingItem(
                Icons.volume_up_outlined, "Sound", "Ring, Silent, Vibrate"),
            _buildSettingItem(Icons.person_outline, "Manage Your Account",
                "Password, Email ID, Phone Number"),
            _buildSettingItem(Icons.notifications_none, "Notification",
                "Check your medicine notification"),
            _buildSettingItem(Icons.notifications_none, "Notification",
                "Check your medicine notification"),

            const SizedBox(height: 20),

            // Device Section
            const Text("Device", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildDeviceItem(
                      Icons.volume_up_outlined, "Connect", "Bluetooth, Wi-Fi"),
                  Divider(height: 1, color: Colors.blue.shade100),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Card(
                        elevation: 0,
                        color: Colors.white,
                        child: _buildDeviceItem(Icons.volume_up_outlined,
                            "Sound Option", "Ring, Silent, Vibrate"),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Caretakers Section
            const Text("Caretakers: 03",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _caretakerAvatar("Dipa Luna"),
                  _caretakerAvatar("Roz Sod.."),
                  _caretakerAvatar("Sunny Tu.."),
                  _addCaretakerButton(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Doctor Section
            const Text("Doctor", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Icon(Icons.add_circle, size: 70, color: Colors.purple[100]!),
                  const SizedBox(height: 8),
                  const Text("Add Your Doctor",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text.rich(
                    TextSpan(
                      text: "Or use ",
                      children: [
                        TextSpan(
                          text: "invite link",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Other Options
            _buildOption("Privacy Policy"),
            _buildOption("Terms of Use"),
            _buildOption("Rate Us"),
            _buildOption("Share"),

            const SizedBox(height: 20),

            // Logout Button
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.purple[100]!),
                ),
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Log Out",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.grey),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      onTap: () {},
    );
  }

  Widget _buildDeviceItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      onTap: () {},
    );
  }

  Widget _caretakerAvatar(String name) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ClipOval(
              child: Image.network(
                  'https://randomuser.me/api/portraits/women/45.jpg'),
            ),
          ),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _addCaretakerButton() {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey.shade300,
          child: const Icon(Icons.add, color: Colors.black),
        ),
        const SizedBox(height: 4),
        const Text("Add", style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildOption(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserret',
              fontSize: 16)),
    );
  }
}
