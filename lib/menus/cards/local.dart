// local card to represent the already downloaded llm models.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omama/cli_commands/data_model.dart';
import 'package:omama/global_states.dart';
import 'package:omama/menus/cards/mod.dart';

class LocalModelCard extends ConsumerStatefulWidget {
  final Model model;

  const LocalModelCard({super.key, required this.model});

  @override
  ConsumerState<LocalModelCard> createState() => _LocalCard();
}

class _LocalCard extends ConsumerState<LocalModelCard> {
  var selectedTag = "";
  @override
  Widget build(BuildContext context) {
    var mdetails = ref.read(modelDetails.notifier);
    var loadedModelText = ref.read(loadedModel.notifier);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(widget.model.name),
              Spacer(),
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
            ],
          ),
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
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    omamaCli.deleteModel("${widget.model.name}:$selectedTag");
                  },
                  child: Text("remove", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.lightBlue),
                  ),
                  onPressed: () {
                    loadedModelText.state = "${widget.model.name}:$selectedTag";
                  },
                  child: Text("load", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: DropdownMenu(
                  textAlign: TextAlign.center,
                  requestFocusOnTap: false,
                  textStyle: TextStyle(color: Colors.white, fontSize: 10),
                  initialSelection: widget.model.varients.first.toString(),
                  onSelected: (v) {
                    selectedTag = v.toString();
                  },

                  dropdownMenuEntries:
                      widget.model.varients.map((v) {
                        //var variant = "${v.tokenSize}:${v.size}";
                        return DropdownMenuEntry(
                          value: v.tokenSize,
                          label: v.size,
                          labelWidget: Text(v.toString()),
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
