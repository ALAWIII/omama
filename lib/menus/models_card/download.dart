import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omama/menus/models_card/model_detalis.dart';

class StoreModelCard extends ConsumerStatefulWidget {
  final String name;
  final String category;
  final String summary;
  final String readme;
  final List<(String, String)> varients;

  const StoreModelCard({
    super.key,
    required this.name,
    required this.category,
    required this.summary,
    required this.readme,
    required this.varients,
  });

  @override
  ConsumerState<StoreModelCard> createState() => _StoreModelCard();
}

class _StoreModelCard extends ConsumerState<StoreModelCard> {
  @override
  Widget build(BuildContext context) {
    var mdetails = ref.read(modelDetails.notifier);

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
          Text(widget.name),

          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              mdetails.state = ModelDetalis(
                name: widget.name,
                summary: widget.summary,
                readme: widget.readme,
              );
            },
            child: Text(widget.summary, style: TextStyle(color: Colors.white)),
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
                  widget.category,
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
                  onPressed: () {},
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
                  initialSelection: widget.varients.firstOrNull?.$1,
                  onSelected: (v) {
                    print(v);
                  },

                  dropdownMenuEntries:
                      widget.varients.map((v) {
                        var variant = "${v.$1}:${v.$2}";
                        return DropdownMenuEntry(
                          value: v.$1,
                          label: v.$1,
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
