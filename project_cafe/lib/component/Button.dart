import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {

  final bool isLiked;
  final VoidCallback onLikeChanged;


  LikeButton({super.key, required this.isLiked, required this.onLikeChanged});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {



  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          widget.onLikeChanged();
        },
        icon: Icon(
          widget.isLiked ? Icons.favorite : Icons.favorite_border,
          color: widget.isLiked ? Colors.red : Colors.grey
        )
    );
  }
}

class DeleteButton extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteButton({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onDelete,
        icon: Icon(Icons.close, color: Colors.black)
    );
  }
}


