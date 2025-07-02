import 'package:flutter/material.dart';
import 'package:pokidex/pages/pokeymonList_page.dart';
// Make sure this path matches your file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      // Option 1: Direct navigation to Pokemon list
      home: const PokemonListPage(),

      // Option 2: Or use a home page with navigation
      // home: const HomePage(),
    );
  }
}

// // Option 2: Home page with navigation button
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pokemon App'),
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         foregroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.catching_pokemon,
//               size: 100,
//               color: Theme.of(context).colorScheme.primary,
//             ),
//             const SizedBox(height: 32),
//             const Text(
//               'Welcome to Pokemon App!',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Discover amazing Pokemon',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 32),
//             ElevatedButton.icon(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const PokemonListPage(),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.list),
//               label: const Text('View Pokemon List'),
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 16,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Option 3: Using Bottom Navigation Bar
// class MainAppWithBottomNav extends StatefulWidget {
//   const MainAppWithBottomNav({super.key});
//
//   @override
//   State<MainAppWithBottomNav> createState() => _MainAppWithBottomNavState();
// }
//
// class _MainAppWithBottomNavState extends State<MainAppWithBottomNav> {
//   int _selectedIndex = 0;
//
//   final List<Widget> _pages = [
//     const HomePage(),
//     const PokemonListPage(),
//     const SettingsPage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.catching_pokemon),
//             label: 'Pokemon',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Simple settings page for the bottom nav example
// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         foregroundColor: Colors.white,
//       ),
//       body: const Center(
//         child: Text(
//           'Settings Page',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }