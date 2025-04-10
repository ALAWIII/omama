import 'package:omama/cli_commands/data_model.dart';
import 'package:omama/cli_commands/proc_execution.dart';
import 'package:riverpod/riverpod.dart';

final omamaCli = OmamaCli();

final chatId = StateProvider((ref) {
  return 0;
});
//------------------------------------
final dbLock = StateProvider((ref) {
  return true;
});

//----------------------------------------for setting the global messages to display
final allMessagesProvider = StateProvider<List<OMessage>>((ref) {
  return [];
});

//------------------------------------download button for store cards to disable when busy------------------------------
final lockDownloadAvailable = StateProvider((ref) {
  return true;
});
//------------------------------------to filter and search model names based on user queries----------------------------
final modelSearchQueryProvider = StateProvider<String>((ref) => '');

final allModelsProvider = FutureProvider<List<Model>>((ref) async {
  return (await omamaCli.fetchModelsFromDb())
      .where((m) => m.category != "Embedding")
      .toList();
});

final filterStoreModelProvider = StateProvider((ref) {
  final query = ref.watch(modelSearchQueryProvider);
  final modelsAsync = ref.watch(allModelsProvider);
  return modelsAsync.when(
    data: (models) {
      if (query.isEmpty) return models;
      return models
          .where((m) => m.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    },
    loading: () => [],
    error: (_, __) => [],
  );
});
//------------------------------------------------------ to fetch all downloaded models--------------------------

final localModelsProvider = FutureProvider<List<Model>>((ref) async {
  return await omamaCli.getLocalModelsInfo();
});
//------------------------------------------------
final chatsProvider = StateProvider<List<OChat>?>((ref) => null);

//---------------

//home Screen loaded model .
final StateProvider<String?> loadedModel = StateProvider((ref) {
  return null;
});
