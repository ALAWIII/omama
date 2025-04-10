// download card to represent the llm model in the model store.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omama/cli_commands/data_model.dart';
import 'package:omama/global_states.dart';
import 'package:omama/menus/mod.dart';

class StoreModelCard extends ConsumerStatefulWidget {
  final Model model;

  const StoreModelCard({super.key, required this.model});

  @override
  ConsumerState<StoreModelCard> createState() => _StoreModelCard();
}

class _StoreModelCard extends ConsumerState<StoreModelCard> {
  @override
  Widget build(BuildContext context) {
    var _selectedTag = "";
    var mdetails = ref.read(modelDetails.notifier);
    var lockDownloadButton = ref.watch(lockDownloadAvailable);
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.lightBlueAccent),
      ),

      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.model.name),

          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              mdetails.state = ModelDetalis(model: widget.model);
            },
            child: Text(
              widget.model.summaryContent,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green,
                ),
                child: Text(
                  widget.model.category,
                  style: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(width: 10),
              Flexible(
                flex: 2,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.lightBlue),
                  ),
                  onPressed:
                      lockDownloadButton
                          ? () {
                            var notifyLockController = ref.read(
                              lockDownloadAvailable.notifier,
                            );
                            notifyLockController.state = false;
                            omamaCli.downloadModelStream(
                              "${widget.model.name}:$_selectedTag",
                              notifyLockController,
                            );
                          }
                          : null,
                  child: Text(
                    "download",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: DropdownMenu(
                  textAlign: TextAlign.center,
                  requestFocusOnTap: false,
                  textStyle: TextStyle(color: Colors.white, fontSize: 10),
                  initialSelection: widget.model.varients.first.toString(),
                  onSelected: (v) => _selectedTag = v!,

                  dropdownMenuEntries:
                      widget.model.varients.map((v) {
                        var variant = "${v.tokenSize}:${v.size}";
                        return DropdownMenuEntry(
                          value: v.tokenSize,
                          label: v.size,
                          labelWidget: Text(variant),
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
