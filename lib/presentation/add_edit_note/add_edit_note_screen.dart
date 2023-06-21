import 'package:flutter/material.dart';

import '../../ui/colors.dart';

class AddEditNoteScreen extends StatefulWidget {
  AddEditNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyblue,
    illusion,
  ];
  Color _color = roseBud;

  @override
  void dispost() {
    // 화면이 닫힐 때 controller를 해제해줌
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
      body: AnimatedContainer(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 48),
        color: _color,
        duration: Duration(milliseconds: 500),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // 색깔 간 간격 줌
              children: noteColors
                  .map(
                    (color) => InkWell(
                      onTap: () {
                        setState(() {
                          _color = color;
                        });
                      },
                      child: _buildBackgroundColor(
                          color: color, selected: _color == color),
                    ),
                  )
                  .toList(),
            ),
            TextField(
              controller: _titleController,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: darkGray),
              decoration: const InputDecoration(
                hintText: "제목을 입력하세요",
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: _contentController,
              maxLines: null, // nullable, null이면 내려감
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: darkGray),
              decoration: const InputDecoration(
                hintText: "내용을 입력하세요",
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundColor({
    required Color color,
    required bool selected,
  }) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6.0,
            spreadRadius: 1.0,
          )
        ],
        border: selected
            ? Border.all(
                color: Colors.black,
                width: 3.0,
              )
            : null,
      ),
    );
  }
}
