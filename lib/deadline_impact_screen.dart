// import 'package:flutter/material.dart';

// class DeadlineImpactScreen extends StatefulWidget {
//   const DeadlineImpactScreen({super.key});

//   @override
//   State<DeadlineImpactScreen> createState() => _DeadlineImpactScreenState();
// }

// class _DeadlineImpactScreenState extends State<DeadlineImpactScreen> {
//   int _currentNavIndex = 2; // "DEADLINE" is selected (index 2)
//   int _selectedOption = 0; // 0: Move to Tomorrow, 1: Move to Another Date, 2: Complete Part Today

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8FAFC),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black87),
//           onPressed: () => Navigator.pop(context),
//         ),
//         centerTitle: true,
//         title: const Text(
//           'Deadline Impact',
//           style: TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(1.0),
//           child: Container(color: Colors.grey.shade200, height: 1.0),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               children: [
//                 // 1. "SELECTED TASK" Header
//                 const Text(
//                   'SELECTED TASK',
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontFamily: 'monospace',
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1.2,
//                     color: Color(0xFF64748B),
//                   ),
//                 ),
//                 const SizedBox(height: 10),

//                 // 2. Selected Task Card
//                 _buildSelectedTaskCard(),
//                 const SizedBox(height: 28),

//                 // 3. "WHAT DO YOU WANT TO DO?" Header
//                 const Text(
//                   'WHAT DO YOU WANT TO DO?',
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontFamily: 'monospace',
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1.1,
//                     color: Color(0xFF64748B),
//                   ),
//                 ),
//                 const SizedBox(height: 12),

//                 // 4. Option 1: Move to Tomorrow
//                 _buildOptionCard(
//                   index: 0,
//                   title: 'Move to Tomorrow',
//                 ),

//                 // 5. Option 2: Move to Another Date
//                 _buildOptionCard(
//                   index: 1,
//                   title: 'Move to Another Date',
//                   subtitle: 'Select a specific future date',
//                 ),

//                 // 6. Option 3: Complete Part Today
//                 _buildOptionCard(
//                   index: 2,
//                   title: 'Complete Part Today',
//                   subtitle: 'Split task and do a portion now',
//                 ),
//               ],
//             ),
//           ),

//           // 7. Pinned "Check Impact" Button Container
//           Container(
//             padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border(
//                 top: BorderSide(color: Colors.grey.shade200, width: 1.0),
//               ),
//             ),
//             child: SafeArea(
//               top: false,
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Analyzing deadline impact...')),
//                   );
//                 },
//                 icon: const Icon(Icons.auto_graph, color: Colors.white, size: 20),
//                 label: const Text(
//                   'Check Impact',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFFFF5C00),
//                   minimumSize: const Size.fromHeight(52),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   elevation: 0,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentNavIndex,
//         onTap: (index) => setState(() => _currentNavIndex = index),
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         selectedItemColor: const Color(0xFFFF5C00),
//         unselectedItemColor: Colors.grey.shade500,
//         selectedFontSize: 10,
//         unselectedFontSize: 10,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'HOME'),
//           BottomNavigationBarItem(icon: Icon(Icons.bolt), label: 'RESCUE'),
//           BottomNavigationBarItem(icon: Icon(Icons.speed), label: 'DEADLINE'),
//           BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'PROFILE'),
//         ],
//       ),
//     );
//   }

//   Widget _buildSelectedTaskCard() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(6),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(6),
//         child: Container(
//           decoration: const BoxDecoration(
//             border: Border(
//               left: BorderSide(color: Color(0xFFFF5C00), width: 4),
//             ),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'ICT725 Assessment',
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Wrap(
//                 spacing: 8,
//                 runSpacing: 6,
//                 children: [
//                   // Badge 1: Due Tomorrow
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFFEAEA),
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     child: const Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(Icons.calendar_today_outlined, size: 12, color: Color(0xFFD32F2F)),
//                         SizedBox(width: 5),
//                         Text(
//                           'Due Tomorrow',
//                           style: TextStyle(
//                             fontFamily: 'monospace',
//                             fontSize: 11,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xFFD32F2F),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Badge 2: HIGH Priority
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFFF3E0),
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     child: const Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(Icons.warning_amber_rounded, size: 13, color: Color(0xFFE65100)),
//                         SizedBox(width: 5),
//                         Text(
//                           'HIGH Priority',
//                           style: TextStyle(
//                             fontFamily: 'monospace',
//                             fontSize: 11,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xFFE65100),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildOptionCard({
//     required int index,
//     required String title,
//     String? subtitle,
//   }) {
//     final bool isSelected = _selectedOption == index;

//     return GestureDetector(
//       onTap: () => setState(() => _selectedOption = index),
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 12),
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(6),
//           border: Border.all(
//             color: isSelected ? const Color(0xFFFF5C00) : Colors.grey.shade300,
//             width: isSelected ? 1.5 : 1.0,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.02),
//               blurRadius: 4,
//               offset: const Offset(0, 1),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             // Custom Radio Circle
//             Container(
//               width: 22,
//               height: 22,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: isSelected ? const Color(0xFFFF5C00) : Colors.grey.shade400,
//                   width: 2,
//                 ),
//               ),
//               child: isSelected
//                   ? Center(
//                       child: Container(
//                         width: 10,
//                         height: 10,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Color(0xFFFF5C00),
//                         ),
//                       ),
//                     )
//                   : null,
//             ),
//             const SizedBox(width: 14),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   if (subtitle != null) ...[
//                     const SizedBox(height: 4),
//                     Text(
//                       subtitle,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'impact_result_screen.dart';

class DeadlineImpactScreen extends StatefulWidget {
  const DeadlineImpactScreen({super.key});

  @override
  State<DeadlineImpactScreen> createState() => _DeadlineImpactScreenState();
}

class _DeadlineImpactScreenState extends State<DeadlineImpactScreen> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
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
          'Deadline Impact',
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
                // 1. "SELECTED TASK" Header
                const Text(
                  'SELECTED TASK',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 10),

                // 2. Selected Task Card
                _buildSelectedTaskCard(),
                const SizedBox(height: 28),

                // 3. "WHAT DO YOU WANT TO DO?" Header
                const Text(
                  'WHAT DO YOU WANT TO DO?',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 12),

                // 4. Option 1: Move to Tomorrow
                _buildOptionCard(
                  index: 0,
                  title: 'Move to Tomorrow',
                ),

                // 5. Option 2: Move to Another Date
                _buildOptionCard(
                  index: 1,
                  title: 'Move to Another Date',
                  subtitle: 'Select a specific future date',
                ),

                // 6. Option 3: Complete Part Today
                _buildOptionCard(
                  index: 2,
                  title: 'Complete Part Today',
                  subtitle: 'Split task and do a portion now',
                ),
              ],
            ),
          ),

          // 7. Pinned "Check Impact" Button Container
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.shade200, width: 1.0),
              ),
            ),
            child: SafeArea(
              top: false,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ImpactResultScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.auto_graph, color: Colors.white, size: 20),
                label: const Text(
                  'Check Impact',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5C00),
                  minimumSize: const Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedTaskCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Color(0xFFFF5C00), width: 4),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ICT725 Assessment',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEAEA),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 12, color: Color(0xFFD32F2F)),
                        SizedBox(width: 5),
                        Text(
                          'Due Tomorrow',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFD32F2F),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3E0),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.warning_amber_rounded, size: 13, color: Color(0xFFE65100)),
                        SizedBox(width: 5),
                        Text(
                          'HIGH Priority',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFE65100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required int index,
    required String title,
    String? subtitle,
  }) {
    final bool isSelected = _selectedOption == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedOption = index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected ? const Color(0xFFFF5C00) : Colors.grey.shade300,
            width: isSelected ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFFFF5C00) : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFF5C00),
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 14),
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
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}