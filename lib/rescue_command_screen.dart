// import 'package:flutter/material.dart';
// import 'rescue_plan_screen.dart';
// class RescueCommandScreen extends StatefulWidget {
//   const RescueCommandScreen({super.key});

//   @override
//   State<RescueCommandScreen> createState() => _RescueCommandScreenState();
// }

// class _RescueCommandScreenState extends State<RescueCommandScreen> {
//   int _currentNavIndex = 1;

//   bool _task1Checked = true;
//   bool _task2Checked = false;
//   bool _task3Checked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F9FB),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black87),
//           onPressed: () => Navigator.pop(context),
//         ),
//         centerTitle: true,
//         title: const Text(
//           'Rescue Command',
//           style: TextStyle(
//             color: Color(0xFFB84D0B),
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.warning_amber_rounded, color: Colors.black87),
//             onPressed: () {},
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(1.0),
//           child: Container(color: Colors.grey.shade300, height: 1.0),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//             decoration: BoxDecoration(
//               color: const Color(0xFFFFD9D9),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Row(
//               children: [
//                 Icon(Icons.warning, color: Color(0xFFB3261E), size: 22),
//                 SizedBox(width: 10),
//                 Text(
//                   'You are behind on 3 tasks',
//                   style: TextStyle(
//                     color: Color(0xFFB3261E),
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 24),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Overdue / Pending',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
//               ),
//               const SizedBox(height: 4),
//               Container(width: 140, height: 2, color: Colors.grey.shade400),
//             ],
//           ),
//           const SizedBox(height: 18),
//           _buildTaskCard(
//             title: 'ICT725 Assessment',
//             subtitle: 'Due Tomorrow • HIGH Priority',
//             icon: Icons.calendar_today_outlined,
//             accentColor: Colors.deepOrange,
//             isChecked: _task1Checked,
//             onTap: () => setState(() => _task1Checked = !_task1Checked),
//           ),
//           _buildTaskCard(
//             title: 'Database Report',
//             subtitle: 'Due in 3 days • HIGH Priority',
//             icon: Icons.calendar_today_outlined,
//             accentColor: Colors.deepOrange,
//             isChecked: _task2Checked,
//             onTap: () => setState(() => _task2Checked = !_task2Checked),
//           ),
//           _buildTaskCard(
//             title: 'Weekly Quiz',
//             subtitle: 'Due Next Week • Med Priority',
//             icon: Icons.access_time,
//             accentColor: Colors.transparent,
//             subtitleColor: Colors.grey.shade600,
//             isChecked: _task3Checked,
//             onTap: () => setState(() => _task3Checked = !_task3Checked),
//           ),
//           const SizedBox(height: 28),
//           ElevatedButton.icon(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const RescuePlanScreen(),
//                 ),
//               );
//             },
//             icon: const Icon(Icons.security, color: Colors.white, size: 20),
//             label: const Text(
//               'Create Rescue Plan',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFFF5C00),
//               minimumSize: const Size.fromHeight(52),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               elevation: 2,
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentNavIndex,
//         onTap: (index) => setState(() => _currentNavIndex = index),
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         selectedItemColor: const Color(0xFFB84D0B),
//         unselectedItemColor: Colors.grey.shade500,
//         selectedFontSize: 11,
//         unselectedFontSize: 11,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.bolt), label: 'Rescue'),
//           BottomNavigationBarItem(icon: Icon(Icons.speed), label: 'DEADLINE'),
//           BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
//         ],
//       ),
//     );
//   }

//   Widget _buildTaskCard({
//     required String title,
//     required String subtitle,
//     required IconData icon,
//     required Color accentColor,
//     Color subtitleColor = const Color(0xFFFF7A00),
//     required bool isChecked,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 6,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border(left: BorderSide(color: accentColor, width: 4)),
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       Row(
//                         children: [
//                           Icon(icon, size: 14, color: subtitleColor),
//                           const SizedBox(width: 5),
//                           Text(
//                             subtitle,
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontFamily: 'monospace',
//                               color: subtitleColor,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: 24,
//                   height: 24,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(4),
//                     border: Border.all(
//                       color: isChecked ? Colors.deepOrange : Colors.grey.shade400,
//                       width: 1.5,
//                     ),
//                   ),
//                   child: isChecked
//                       ? const Icon(Icons.check, size: 18, color: Colors.deepOrange)
//                       : null,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'rescue_plan_screen.dart';

class RescueCommandScreen extends StatefulWidget {
  const RescueCommandScreen({super.key});

  @override
  State<RescueCommandScreen> createState() => _RescueCommandScreenState();
}

class _RescueCommandScreenState extends State<RescueCommandScreen> {
  bool _task1Checked = true;
  bool _task2Checked = false;
  bool _task3Checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        centerTitle: true,
        title: const Text(
          'Rescue Command',
          style: TextStyle(
            color: Color(0xFFB84D0B),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.warning_amber_rounded, color: Colors.black87),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.0),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD9D9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.warning, color: Color(0xFFB3261E), size: 22),
                SizedBox(width: 10),
                Text(
                  'You are behind on 3 tasks',
                  style: TextStyle(
                    color: Color(0xFFB3261E),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Overdue / Pending',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 4),
              Container(width: 140, height: 2, color: Colors.grey.shade400),
            ],
          ),
          const SizedBox(height: 18),
          _buildTaskCard(
            title: 'ICT725 Assessment',
            subtitle: 'Due Tomorrow • HIGH Priority',
            icon: Icons.calendar_today_outlined,
            accentColor: Colors.deepOrange,
            isChecked: _task1Checked,
            onTap: () => setState(() => _task1Checked = !_task1Checked),
          ),
          _buildTaskCard(
            title: 'Database Report',
            subtitle: 'Due in 3 days • HIGH Priority',
            icon: Icons.calendar_today_outlined,
            accentColor: Colors.deepOrange,
            isChecked: _task2Checked,
            onTap: () => setState(() => _task2Checked = !_task2Checked),
          ),
          _buildTaskCard(
            title: 'Weekly Quiz',
            subtitle: 'Due Next Week • Med Priority',
            icon: Icons.access_time,
            accentColor: Colors.transparent,
            subtitleColor: Colors.grey.shade600,
            isChecked: _task3Checked,
            onTap: () => setState(() => _task3Checked = !_task3Checked),
          ),
          const SizedBox(height: 28),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RescuePlanScreen()),
              );
            },
            icon: const Icon(Icons.security, color: Colors.white, size: 20),
            label: const Text(
              'Create Rescue Plan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF5C00),
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color accentColor,
    Color subtitleColor = const Color(0xFFFF7A00),
    required bool isChecked,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(icon, size: 14, color: subtitleColor),
                          const SizedBox(width: 5),
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'monospace',
                              color: subtitleColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: isChecked ? Colors.deepOrange : Colors.grey.shade400,
                      width: 1.5,
                    ),
                  ),
                  child: isChecked
                      ? const Icon(Icons.check, size: 18, color: Colors.deepOrange)
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}