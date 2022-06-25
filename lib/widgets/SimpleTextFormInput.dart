import 'package:flutter/material.dart';

class SimpleTextFormInput extends StatelessWidget {
  const SimpleTextFormInput({
    Key? key,
    required TextEditingController controllerUserId,
    this.textInputType, 
    this.onChanged, 
    this.suffixIcon, 
    this.prefixIcon, 
    this.onSubmitted, 
    this.obscureText, 
    this.hintTex, 
    this.press, 
  }) : _controllerUserId = controllerUserId, super(key: key);

  final TextEditingController _controllerUserId;
  final TextInputType ? textInputType;
  final Function(String)? onChanged;
  final IconData ? suffixIcon;
  final IconData ? prefixIcon;
  final String? hintTex;
  final bool? obscureText;
  final Function(String)? onSubmitted;
  final VoidCallback? press;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xAAE6E6E6),
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        controller: _controllerUserId,
        keyboardType: textInputType,   
        onChanged:onChanged,
        onSubmitted: onSubmitted,  
        obscureText: obscureText??false,                       
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder:InputBorder.none ,
          errorBorder: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 20,top: 10,right: 10),
          hintText: hintTex,
          suffixIcon: GestureDetector(
            onTap: press,
            child: Icon(suffixIcon,color: Colors.black,size: 20,)),
          // prefix: Icon(prefixIcon,color: Colors.black,size: 20,),
          // suffixIcon:suffixIcon==null ?const Icon(Icons.abc,size: 0,): Icon(suffixIcon),
          // prefixIcon: prefixIcon==null ?const  Icon(Icons.abc,size: 0,):Icon(prefixIcon),
          
          ),
      ),
    );
  }
}
