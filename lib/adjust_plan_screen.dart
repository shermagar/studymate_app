import 'package:flutter/material.dart';

class AdjustPlanScreen extends StatefulWidget {
  final TimeOfDay initialTask1StartTime;
  final int initialTask1Duration;
  final TimeOfDay initialTask2StartTime;
  final int initialTask2Duration;

  const AdjustPlanScreen({
    super.key,
    this.initialTask1StartTime = const TimeOfDay(hour: 18, minute: 0),
    this.initialTask1Duration = 40,
    this.initialTask2StartTime = const TimeOfDay(hour: 18, minute: 50),
    this.initialTask2Duration = 30,
  });

  @override
  State<AdjustPlanScreen> createState() => _AdjustPlanScreenState();
}

class _AdjustPlanScreenState extends State<AdjustPlanScreen> {
  late TimeOfDay _task1StartTime;
  late int _task1Duration;
  late TimeOfDay _task2StartTime;
  late int _task2Duration;

  @override
  void initState() {
    super.initState();
    _task1StartTime = widget.initialTask1StartTime;
    _task1Duration = widget.initialTask1Duration;
    _task2StartTime = widget.initialTask2StartTime;
    _task2Duration = widget.initialTask2Duration;
  }

  Future<void> _selectTime(bool isTask1) async {
    final initial = isTask1 ? _task1StartTime : _task2StartTime;
    final picked = await showTimePicker(
      context: context,
      initialTime: initial,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFFF5C00),
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isTask1) {
          _task1StartTime = picked;
        } else {
          _task2StartTime = picked;
        }
      });
    }
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Adjust Plan',
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFFFE0B2)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.tune, size: 20, color: Color(0xFFE65100)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Modify start times or duration blocks to balance your study workload.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFE65100),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'TODAY\'S TIME BLOCKS',
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 14),

                // Card 1
                _buildAdjustCard(
                  title: 'ICT725 Assessment',
                  tag: 'High Priority',
                  tagColor: const Color(0xFFD32F2F),
                  tagBgColor: const Color(0xFFFFEAEA),
                  accentColor: const Color(0xFFFF5C00),
                  startTime: _formatTimeOfDay(_task1StartTime),
                  currentDuration: _task1Duration,
                  onTimeTap: () => _selectTime(true),
                  onDurationChanged: (val) => setState(() => _task1Duration = val),
                ),
                const SizedBox(height: 16),

                // Card 2
                _buildAdjustCard(
                  title: 'Database Report',
                  tag: 'Medium Priority',
                  tagColor: const Color(0xFF64748B),
                  tagBgColor: const Color(0xFFF1F5F9),
                  accentColor: Colors.grey.shade400,
                  startTime: _formatTimeOfDay(_task2StartTime),
                  currentDuration: _task2Duration,
                  onTimeTap: () => _selectTime(false),
                  onDurationChanged: (val) => setState(() => _task2Duration = val),
                ),
              ],
            ),
          ),

          // Pinned Bottom Actions
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Color(0xFF64748B), width: 1.2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF334155),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Return updated data map back to RescuePlanScreen
                        Navigator.pop(context, {
                          'task1Start': _task1StartTime,
                          'task1Duration': _task1Duration,
                          'task2Start': _task2StartTime,
                          'task2Duration': _task2Duration,
                        });
                      },
                      icon: const Icon(Icons.check, size: 18, color: Colors.white),
                      label: const Text(
                        'Save Adjustments',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
        ],
      ),
    );
  }

  Widget _buildAdjustCard({
    required String title,
    required String tag,
    required Color tagColor,
    required Color tagBgColor,
    required Color accentColor,
    required String startTime,
    required int currentDuration,
    required VoidCallback onTimeTap,
    required ValueChanged<int> onDurationChanged,
  }) {
    final durations = [20, 30, 40, 60];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: accentColor, width: 4)),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: tagBgColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: tagColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Start Time',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  InkWell(
                    onTap: onTimeTap,
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.access_time, size: 14, color: Color(0xFFFF5C00)),
                          const SizedBox(width: 8),
                          Text(
                            startTime,
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Duration',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: durations.map((minutes) {
                  final isSelected = currentDuration == minutes;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text('${minutes}m'),
                      selected: isSelected,
                      selectedColor: const Color(0xFFFF5C00),
                      backgroundColor: const Color(0xFFF1F5F9),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF334155),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide(
                          color: isSelected ? const Color(0xFFFF5C00) : Colors.transparent,
                        ),
                      ),
                      onSelected: (_) => onDurationChanged(minutes),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}