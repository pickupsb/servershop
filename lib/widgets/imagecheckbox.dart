import 'package:flutter/cupertino.dart';

class Imagecheckbox extends StatefulWidget {
  String checktimg;
  String uncheckimg;
  bool check ;
  double width;
  double height;
  Function(bool) onchange;
    Imagecheckbox({required this.check,required this.checktimg,required this.uncheckimg,required this.width,required this.height,required this.onchange,super.key});

  @override
  State<Imagecheckbox> createState() => _ImagecheckboxState();
}

class _ImagecheckboxState extends State<Imagecheckbox> {
  late bool check;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check = widget.check;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        setState(() {
          check = !check;
        });
        widget.onchange(check);
      },
      child: Image.asset(check?widget.checktimg:widget.uncheckimg,width: widget.width,height: widget.height,),
    );
  }
}
