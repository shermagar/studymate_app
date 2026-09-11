import 'package:flutter/material.dart';
import 'main_scaffold.dart';
import 'adjust_plan_screen.dart';

class RescuePlanScreen extends StatefulWidget {
  const RescuePlanScreen({super.key});

  @override
  State<RescuePlanScreen> createState() => _RescuePlanScreenState();
}

class _RescuePlanScreenState extends State<RescuePlanScreen> {
  final int _currentNavIndex = 1;

  // Dynamic state for task schedules
  TimeOfDay _task1Start = const TimeOfDay(hour: 18, minute: 0); // 6:00 PM
  int _task1Duration = 40; // 40m

  TimeOfDay _task2Start = const TimeOfDay(hour: 18, minute: 50); // 6:50 PM
  int _task2Duration = 30; // 30m

  // Formats start and end times into "6:00 - 6:40 PM"
  String _formatTimeRange(TimeOfDay start, int durationMinutes) {
    final startTotalMinutes = start.hour * 60 + start.minute;
    final endTotalMinutes = (startTotalMinutes + durationMinutes) % (24 * 60);

    final endHour24 = endTotalMinutes ~/ 60;
    final endMinute = endTotalMinutes % 60;

    String formatSingle(int h24, int m) {
      final period = h24 >= 12 ? 'PM' : 'AM';
      var h12 = h24 % 12;
      if (h12 == 0) h12 = 12;
      final mStr = m.toString().padLeft(2, '0');
      return '$h12:$mStr $period';
    }

    final startStr = formatSingle(start.hour, start.minute).replaceAll(' AM', '').replaceAll(' PM', '');
    final endStr = formatSingle(endHour24, endMinute);
    return '$startStr - $endStr';
  }

  Future<bool> _confirmLeave() async {
    final shouldLeave = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Color(0xFFFF5C00)),
            SizedBox(width: 8),
            Text('Leave this plan?', style: TextStyle(fontSize: 18)),
          ],
        ),
        content: const Text(
          'Are you sure you want to leave this page? Any unsaved plan adjustments will be lost.',
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
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final confirmed = await _confirmLeave();
        if (confirmed && mounted) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FBFC),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () async {
              final confirmed = await _confirmLeave();
              if (confirmed && mounted) {
                Navigator.pop(context);
              }
            },
          ),
          centerTitle: true,
          title: const Text(
            'Rescue Plan',
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
        body: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 110),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5F9F3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                          width: 5,
                          decoration: const BoxDecoration(
                            color: Color(0xFF00B686),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Icon(Icons.check_circle_outline, color: Color(0xFF00B686), size: 22),
                        const SizedBox(width: 12),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'Your new study plan',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'TODAY',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 12),
                Divider(height: 1, color: Colors.grey.shade300),
                const SizedBox(height: 20),

                // 1. First Task (Updated Dynamically)
                _buildTimelineRow(
                  timeText: _formatTimeRange(_task1Start, _task1Duration),
                  title: 'ICT725 Assessment',
                  duration: '${_task1Duration}m',
                  priorityTag: 'High Priority',
                  dotColor: const Color(0xFFA5531B),
                  borderColor: const Color(0xFFFFCCB3),
                  isFirst: true,
                  isLast: false,
                ),

                // 2. Second Task (Updated Dynamically)
                _buildTimelineRow(
                  timeText: _formatTimeRange(_task2Start, _task2Duration),
                  title: 'Database Report',
                  duration: '${_task2Duration}m',
                  dotColor: Colors.grey.shade400,
                  borderColor: Colors.transparent,
                  backgroundColor: const Color(0xFFF3F7FA),
                  isFirst: false,
                  isLast: true,
                ),
              ],
            ),

            // Pinned Bottom Actions
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      // Adjust Plan Button (Receives updated times)
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            final result = await Navigator.push<Map<String, dynamic>>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdjustPlanScreen(
                                  initialTask1StartTime: _task1Start,
                                  initialTask1Duration: _task1Duration,
                                  initialTask2StartTime: _task2Start,
                                  initialTask2Duration: _task2Duration,
                                ),
                              ),
                            );

                            if (result != null && mounted) {
                              setState(() {
                                _task1Start = result['task1Start'] as TimeOfDay;
                                _task1Duration = result['task1Duration'] as int;
                                _task2Start = result['task2Start'] as TimeOfDay;
                                _task2Duration = result['task2Duration'] as int;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Row(
                                    children: [
                                      Icon(Icons.check_circle, color: Colors.white, size: 20),
                                      SizedBox(width: 10),
                                      Text(
                                        'Plan updated with new schedule!',
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
                            }
                          },
                          icon: const Icon(Icons.tune, size: 16, color: Color(0xFF334155)),
                          label: const Text(
                            'Adjust Plan',
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF334155),
                              fontSize: 13,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: const BorderSide(color: Color(0xFF475569), width: 1.2),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Plan accepted successfully!')),
                            );
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.bolt, size: 18, color: Colors.white),
                          label: const Text(
                            'Accept Plan',
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF5C00),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          ),
                        ),
                      ),
                    ],
                  ),
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
          selectedItemColor: const Color(0xFFB84D0B),
          unselectedItemColor: Colors.grey.shade500,
          selectedFontSize: 11,
          unselectedFontSize: 11,
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

  Widget _buildTimelineRow({
    required String timeText,
    required String title,
    required String duration,
    String? priorityTag,
    required Color dotColor,
    required Color borderColor,
    Color backgroundColor = Colors.white,
    required bool isFirst,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            child: Column(
              children: [
                Container(
                  width: 1.5,
                  height: 12,
                  color: isFirst ? Colors.transparent : Colors.grey.shade300,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
                ),
                Expanded(
                  child: Container(
                    width: 1.5,
                    color: isLast ? Colors.transparent : Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor, width: 1.5),
                boxShadow: [
                  if (backgroundColor == Colors.white)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        timeText,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          color: Color(0xFFA5531B),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          letterSpacing: 1.1,
                        ),
                      ),
                      const Icon(Icons.more_horiz, color: Colors.grey, size: 18),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.timer_outlined, size: 13, color: Colors.grey.shade700),
                            const SizedBox(width: 4),
                            Text(
                              duration,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (priorityTag != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEAEA),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            priorityTag,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFD32F2F),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}