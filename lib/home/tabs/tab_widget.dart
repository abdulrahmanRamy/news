import 'package:flutter/material.dart';
import 'package:news/home/tabs/tab_item.dart';
import 'package:news/models/SourceResponse.dart';

import '../../news/news_widget.dart';

class TabWidget extends StatefulWidget {
  List<Sources> sourcesList ;

   TabWidget({required this.sourcesList,super.key});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                selectedIndex = index;
                setState(() {});

              },
              indicatorColor: Colors.transparent,

              labelPadding: EdgeInsets.all(4),
              isScrollable: true,
                tabs: widget.sourcesList.map((source) => TabItem(
                    isSelected: selectedIndex == widget.sourcesList.indexOf(source),
                    source: source
                )).toList(),

            ),
            Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex] ))
          ],
        ));
  }
}
