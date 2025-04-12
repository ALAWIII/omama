import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omama/global_states.dart';
import 'package:omama/main_screen_components/mod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        leading: IconButton(
          // adding new chat
          icon: Icon(Icons.add_rounded),
          hoverColor: Colors.green,
          onPressed: () {
            omamaCli.createChat(ref.read(chatsProvider.notifier));
          },
        ),
        actions: [LoadedModelLabel(), SizedBox(width: 20)],
      ),
      body: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BarScreenButtons(),
                SizedBox(width: 10),
                Expanded(child: Chat()),
                SizedBox(width: 10),
              ],
            ),
            if (showm != null)
              Positioned(
                left: 80,
                height: MediaQuery.of(context).size.height - 90,
                child: SideMenu(),
              ),
          ],
        ),
      ),
    );
  }
}

class LoadedModelLabel extends ConsumerStatefulWidget {
  const LoadedModelLabel({super.key});

  @override
  ConsumerState<LoadedModelLabel> createState() => _LoadedModelLabel();
}

class _LoadedModelLabel extends ConsumerState<LoadedModelLabel> {
  @override
  Widget build(BuildContext context) {
    var loadedText = ref.watch(loadedModel);
    return Text(loadedText.toString());
  }
}
