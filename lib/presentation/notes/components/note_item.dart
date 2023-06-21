import 'package:flutter/material.dart';

import '../../../domain/model/note.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final Function? onDeleteTap;

  const NoteItem({
    Key? key,
    required this.note,
    this.onDeleteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
              // 쓰레기통 배치방법1. container를 스택으로 감싸고 위에 놓는 방법(컬럼으로 wrap후 stack으로 변경)
              // 방법2. content와 동일한 열에 배치하는 방법
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(note.color),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // maxLines 넘어가면 ... 표시
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    note.content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              )),
          Positioned(
            bottom: 8,
            right: 8,
            child: GestureDetector(
              onTap: (){
                onDeleteTap?.call();
              },
              child: Icon(Icons.delete),
            ),
          )
        ],
      ),
    );
  }
}
