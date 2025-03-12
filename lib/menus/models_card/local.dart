import 'package:flutter/material.dart';

class LocalModelCard extends StatefulWidget {
  final String title;
  final String category;
  final String summary;
  final String readme;
  final List<(String, String)> varients;

  const LocalModelCard({
    super.key,
    required this.title,
    required this.category,
    required this.summary,
    required this.readme,
    required this.varients,
  });

  @override
  State<LocalModelCard> createState() => _LocalCard();
}

class _LocalCard extends State<LocalModelCard> {
  @override
  Widget build(BuildContext context) {
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
              Text(widget.title),
              Spacer(),
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
            ],
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            child: Text(widget.summary, style: TextStyle(color: Colors.white)),
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
                  onPressed: () {},
                  child: Text("remove", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.lightBlue),
                  ),
                  onPressed: () {},
                  child: Text("load", style: TextStyle(color: Colors.white)),
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
