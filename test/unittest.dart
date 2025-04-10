import 'package:flutter_test/flutter_test.dart';
import 'package:omama/cli_commands/proc_execution.dart';

Future<void> main() async {
  var ochat = OmamaCli();

  test("chat object", () async {
    var chat = await ochat.createChat();
    print(chat);
  });
  test("all_chats", () async {
    var allChats = await ochat.getAllChats();
    print(allChats);
  });
  test("ollama running", () async {
    var service = await ochat.isOllamaRunning();
    print(service);
  });
  test("installedLocally", () async {
    var service = await ochat.isInstalledLocally();
    print(service);
  });
  test("installedglobally", () async {
    var service = await ochat.isInstalledGlobally();
    print(service);
  });
  //test("start ollama service", () async {
  //  var service = await ochat.startOllamaService();

  //  print(service.stdout);
  //});
  test("all messages", () async {
    var messages = await ochat.getAllMessages(1744190892471);

    print(messages);
  });

  test("getsummary", () async {
    var summary = await ochat.getSummaryOfChat(1744190892471);

    print(summary);
  });
  test("getchatbyid", () async {
    var chat = await ochat.getChatById(1744190892471);

    print(chat);
  });
  //test("create_message", () async {
  //  var message = await ochat.createMessage(
  //    "hi",
  //    1744190892471,
  //    "qwen2.5:1.5b",
  //  );
  //  print(message);
  //  //print(chat);
  //});
  //test("fetchmodelby name", () async {
  //  var model = await ochat.fetchModelByName("qwen2.5");
  //  print(model);
  //  //print(chat);
  //});
  //test("fetch models from db", () async {
  //  var models = await ochat.fetchModelsFromDb();
  //  print(models);
  //  //print(chat);
  //});
  test("get local models", () async {
    var models = await ochat.getLocalModelsInfo();
    print(models);
    //print(chat);
  });
}
