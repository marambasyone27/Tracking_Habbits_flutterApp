import 'package:flutter/material.dart';
import 'package:tracking_habits/CompletedTask.dart';
import 'package:tracking_habits/TaskItem.dart';
import 'package:tracking_habits/Profile.dart'; // تأكد من أن لديك ملف Profile في هذا المسار

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0; // هذا لتتبع التبويب المحدد حاليًا

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  // دالة للتعامل مع النقر على شريط التنقل
  void _onItemTapped(int index) {
    if (index == 3) {
      // إذا كانت الأيقونة هي Account
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } else {
      setState(() {
        _selectedIndex = index; // تحديث الفهرس المحدد
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        leading: const Icon(Icons.checklist),
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          indicator: BoxDecoration(
            color: const Color(0xFFBA68C8),
            borderRadius: BorderRadius.circular(10),
          ),
          controller: _tabController,
          tabs: const [
            Tab(text: '           Today            '),
            Tab(text: '           Weekly            '),
            Tab(text: '           Monthly           '),
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                TaskItem(icon: Icons.track_changes, label: 'Set Small Goals', color: const Color(0xFFEF9A9A)),
                TaskItem(icon: Icons.track_changes, label: 'Work', color: const Color(0xFF9FA8DA)),
                TaskItem(icon: Icons.track_changes, label: 'Meditation', color: const Color(0xFF26C6DA)),
                TaskItem(icon: Icons.track_changes, label: 'Basketball', color: const Color(0xFF8D6E63)),
                const SizedBox(height: 10),
                const Row(
                  children: <Widget>[
                    Text('Completed'),
                    SizedBox(width: 10),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CompletedTask(label: 'Sleep Over 8h', color: Colors.blueAccent),
                CompletedTask(label: 'Playing Games', color: Colors.pinkAccent),
                CompletedTask(label: 'Exercise or Workout', color: Colors.greenAccent),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        currentIndex: _selectedIndex, // تحديث الفهرس المحدد
        onTap: _onItemTapped, // إضافة دالة onTap
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home, color: Colors.purple),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart, color: Colors.purple),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize_outlined, color: Colors.purple),
            label: 'My Habits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.purple),
            label: 'Account',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // يمكنك استخدام هذا الزر لأداء أي مهمة إضافية
        }, // الأيقونة +
        backgroundColor: const Color(0xFFBA68C8),
        shape: const CircleBorder(),
        child: Icon(Icons.add, size: 30),
      ),
    );
  }
}
