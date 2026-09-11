import 'package:flutter/material.dart';
import 'main_scaffold.dart';
import 'study_session_screen.dart';

class ImpactResultScreen extends StatefulWidget {
  const ImpactResultScreen({super.key});

  @override
  State<ImpactResultScreen> createState() => _ImpactResultScreenState();
}

class _ImpactResultScreenState extends State<ImpactResultScreen> {
  final int _currentNavIndex = 2;
  bool _allowDirectPop = false; // Flag to bypass dialog on completed action

  Future<bool> _confirmLeave() async {
    final shouldLeave = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Color(0xFFFF5C00)),
            SizedBox(width: 8),
            Text('Leave this page?', style: TextStyle(fontSize: 18)),
          ],
        ),
        content: const Text(
          'Are you sure you want to leave this page? Any deadline simulation will not be saved.',
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Stay', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF5C00),
              elevation: 0,
            ),
            child: const Text('Leave', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
    return shouldLeave ?? false;
  }

  void _handleTabTap(int targetIndex) async {
    final confirmed = await _confirmLeave();
    if (confirmed && mounted) {
      mainScaffoldKey.currentState?.switchTab(targetIndex);
      _allowDirectPop = true;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop || _allowDirectPop) return;
        final confirmed = await _confirmLeave();
        if (confirmed && mounted) {
          _allowDirectPop = true;
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () async {
              final confirmed = await _confirmLeave();
              if (confirmed && mounted) {
                _allowDirectPop = true;
                Navigator.pop(context);
              }
            },
          ),
          title: const Text(
            'Impact Result',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(color: Colors.grey.shade200, height: 1.0),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD9D9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.warning, color: Color(0xFFB3261E), size: 22),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Moving this task will increase tomorrow's work.",
                      style: TextStyle(
                        color: Color(0xFFB3261E),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            _buildWorkloadCard(),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF1F1),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFFFFE0E0)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.calendar_today_outlined, size: 14, color: Color(0xFFD32F2F)),
                  SizedBox(width: 8),
                  Text(
                    'Database Report also due soon.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFD32F2F),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF0D1B2A),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(Icons.lightbulb, color: Color(0xFFFF7A00), size: 26),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Recommendation',
                          style: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 11,
                            fontFamily: 'monospace',
                            letterSpacing: 0.8,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Study ICT725 for at least 30 minutes today.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            ElevatedButton.icon(
              onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StudySessionScreen(
          taskTitle: 'ICT725 Assessment',
          initialMinutes: 30, // Matches the 30-min recommendation card
        ),
      ),
    );
  },
  icon: const Icon(Icons.local_fire_department, color: Colors.white, size: 20),
  label: const Text(
    'Study Now',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
  ),
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFFFF5C00),
    minimumSize: const Size.fromHeight(50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 0,
  ),
            ),
            const SizedBox(height: 12),

            // Move Anyway Button
            OutlinedButton(
              onPressed: () {
                // 1. Bypass confirm-leave guard
                _allowDirectPop = true;

                // 2. Return to the Deadline Impact screen
                Navigator.pop(context);

                // 3. Show success notification
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.white, size: 20),
                        SizedBox(width: 10),
                        Text(
                          'Successfully moved!',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    backgroundColor: const Color(0xFF00B686),
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                side: const BorderSide(color: Color(0xFF0F172A), width: 1.4),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                'Move Anyway',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentNavIndex,
          onTap: _handleTabTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFFFF5C00),
          unselectedItemColor: Colors.grey.shade500,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'HOME'),
            BottomNavigationBarItem(icon: Icon(Icons.bolt), label: 'RESCUE'),
            BottomNavigationBarItem(icon: Icon(Icons.speed), label: 'DEADLINE'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'PROFILE'),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkloadCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
            const Color(0xFFFFF6EE).withOpacity(0.8),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "TOMORROW'S WORKLOAD",
            style: TextStyle(
              fontSize: 11,
              fontFamily: 'monospace',
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '2.5 hrs',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '4 hrs',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                    height: 8,
                    child: Row(
                      children: [
                        Expanded(flex: 3, child: Container(color: Colors.black87)),
                        Expanded(flex: 4, child: Container(color: const Color(0xFFD35555))),
                        Expanded(flex: 2, child: Container(color: Colors.grey.shade300)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              const Icon(
                Icons.trending_up,
                color: Color(0xFFD32F2F),
                size: 26,
              ),
            ],
          ),
        ],
      ),
    );
  }
}