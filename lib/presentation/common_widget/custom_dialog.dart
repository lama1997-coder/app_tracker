part of 'import.dart';

class CustomDialogBox extends StatefulWidget {
  final String? title, descriptions, text;
  final Image? img;
  final  Function()? onTap;

  const CustomDialogBox({ this.title, this.descriptions, this.text, this.img, this.onTap});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: PaddingConstants.screenPadding,

          // margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DefaultText(title:widget.title??"",size: 12,color: ThemeDataProvider.red,),
              SizedBox(height: 15,),
              DefaultText(title: widget.descriptions??"",size: 14,align:TextAlign.center),
              SizedBox(height: 22,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap:widget.onTap?? (){
                        Navigator.of(context).pop();
                      },
                      child: DefaultText(title:widget.text??"Ok",color: ThemeDataProvider.textRightColor,)),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: DefaultText(title:widget.text??"Cancel",color:ThemeDataProvider.textWrongColor)),
                ],
              ),
            ],
          ),
        ),

      ],
    );
  }
}