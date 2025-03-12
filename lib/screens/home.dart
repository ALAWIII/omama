import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omama/side_menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "../menus/mod.dart";
import "../bar.dart";

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var showm = ref.watch(sideMenu);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Omama'),
        backgroundColor: Colors.transparent,

        elevation: 0.5,

        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        iconTheme: IconThemeData(color: Colors.white70),
      ),
      body: Stack(
        children: [
          if (showm != null)
            Positioned(
              left: 80,
              height: MediaQuery.of(context).size.height - 90,
              child: SideMenu(),
            ),
          Row(children: [BarScreenButtons()]),
        ],
      ),
    );
  }
}
