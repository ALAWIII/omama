import 'dart:io';
import 'package:dart_eval/dart_eval.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:convert';

import 'package:omama/cli_commands/data_model.dart';
import 'package:path/path.dart' as p;

final executableDir = p.dirname(Platform.resolvedExecutable);

T parseStringToJson<T>(String text) {
  //print(text);
  return json.decode(text);
}

class OmamaCli {
  final String executable = p.join(executableDir, 'omama_cli', 'omama_cli');

  OmamaCli();

  Future<String?> _run<T>(List<String> args) async {
    try {
      final result = await Process.run(executable, args, runInShell: true);
      if (result.exitCode == 0) {
        return result.stdout;
      } else {
        stderr.write(result.stderr);
        print("Exit code: ${result.exitCode}");
      }
    } catch (e) {
      print("Command failed: $e");
    }
  }

  // --- Root-level options ---
  Future<OChat> createChat(StateController<List<OChat>?> chats) async {
    final result = await _run(["--create-chat"]);
    var chat = OChat.fromJson(parseStringToJson(result!));
    chats.state = [...chats.state!, chat];
    return chat;
  } // Chat

  Future<List<OChat>> getAllChats(
    StateController<List<OChat>?> chatsController,
  ) async {
    chatsController.state = [];
    final result = await _run(["--get-all-chats"]);
    final List<OChat> chats = OChat.fromListJson(parseStringToJson(result!));
    chatsController.state = chats;
    return chats;
  } // List<Chat> : Chat<id:int , name:String, summary:String >

  Future<List<OMessage>> getAllMessages(
    int id,
    StateController<List<OMessage>> globalMessagesController,
    StateController<bool> dbLock,
  ) async {
    dbLock.state = false;
    var messages = OMessage.fromListJson(
      parseStringToJson((await _run(["--get-all-messages", "$id"]))!),
    );

    globalMessagesController.state = messages;
    dbLock.state = true;
    return messages;
  }

  Future<String> getSummaryOfChat(int id) async {
    return (await _run(["--get-summary-of-chat", "$id"]))!;
  }

  Future<OChat> getChatById(int id) async {
    return OChat.fromJson(
      parseStringToJson((await _run(["--get-chat-by-id", "$id"]))!),
    );
  }

  Future<OMessage> createMessage(
    TextEditingController message,
    int cId,
    String modelName,
    StateController<bool> dbLock,
    StateController<List<OMessage>> allMessagesList,
  ) async {
    dbLock.state = false;
    var chatMessage = OMessage.fromJson(
      parseStringToJson(
        (await _run([
          "create_message",
          "-m",
          message.text,
          "--chat-id",
          cId.toString(),
          "--model-name",
          modelName,
        ]))!,
      ),
    );
    message.clear();
    dbLock.state = true;
    allMessagesList.state = [...allMessagesList.state, chatMessage];

    return chatMessage;
  }

  // ------------ service_utils subcommand --------------
  Future<void> downloadModelStream(
    String modelNameWithTokenSize,
    StateController controller,
  ) async {
    await _run([
      "service_utils",
      "--download-model-stream",
      modelNameWithTokenSize,
    ]);
    controller.state = true;
  }

  Future<void> downloadModel(String modelNameWithTokenSize) async {
    await _run(["service_utils", "--download-model", modelNameWithTokenSize]);
  }

  Future<void> deleteModel(String modelName) async {
    await _run(["service_utils", "--delete-model", modelName]);
  }

  Future<Model> fetchModelByName(String name) async {
    return Model.fromJson(
      parseStringToJson(
        (await _run(["service_utils", "--fetch-model-by-name", name]))!,
      ),
    );
  }

  Future<List<Model>> fetchModelsFromDb() async {
    var models = Model.fromListJson(
      parseStringToJson(
        (await _run(["service_utils", "--fetch-models-from-db"]))!,
      ),
    );
    if (models.isEmpty) {
      await fetchModelsFromWebToDb();
    }
    return models;
  }

  Future<void> installTool(String sudoPassword) async {
    await _run(["service_utils", "--install-tool", sudoPassword]);
  }

  Future<void> fetchModelsFromWebToDb() async {
    await _run(["service_utils", "--fetch-models-from-web-to-db"]);
  }

  Future<List<Model>> getLocalModelsInfo() async {
    return Model.fromListJson(
      parseStringToJson(
        (await _run(["service_utils", "--get-local-models-info"]))!,
      ),
    );
  }

  Future<bool?> isInstalledGlobally() async {
    return eval((await _run(["service_utils", "--is-installed-globally"]))!);
  }

  Future<bool?> isInstalledLocally() async {
    return eval((await _run(["service_utils", "--is-installed-locally"]))!);
  }

  Future<bool> isOllamaRunning() async {
    var isRunning = await _run(["service_utils", "--is-ollama-running"]);
    return eval(isRunning!);
  }

  Future<void> loadModelsFromJsonFile() =>
      _run(["service_utils", "--load-models-from-json-file"]);

  Future<void> loadModelsFromWebToJson() =>
      _run(["service_utils", "--load-models-from-web-to-json"]);

  Future startOllamaService() async {
    return await _run(["service_utils", "--start-ollama-service"]);
  }
}
