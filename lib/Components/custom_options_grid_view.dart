import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final List list;
  CustomGridView(this.list);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[200]!,
                  spreadRadius: 0.3,
                  blurRadius: 0.3,
                  offset: Offset.fromDirection(0.75, 2.0)),
            ]),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        margin: EdgeInsets.symmetric(vertical: 12),
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(),
            shrinkWrap: true,
            itemCount: list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 12, crossAxisCount: 4),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: list[index].onTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FadedScaleAnimation(
                        child: Image.asset(
                          list[index].image,
                          scale: 2.7,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      list[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              );
            }));
  }
}
