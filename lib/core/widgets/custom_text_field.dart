import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hint;
  bool securedPassword;
  TextInputType keyboardType;
  CustomTextField({
        super.key,required this.title,
        required this.hint,
        this.keyboardType = TextInputType.text,
        this.securedPassword = false
      });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisableText = false;
  @override
  
  void initState() {
    super.initState();
    isVisableText = widget.securedPassword;
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 12,),
          TextFormField(
            obscureText: isVisableText,
            keyboardType: widget.keyboardType,
            style: const TextStyle(
              color: Colors.black
            ),
            decoration: InputDecoration(
              suffixIcon: widget.securedPassword
                  ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisableText = !isVisableText;
                  });
                },
                icon: isVisableText
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off_outlined)
              )
                  : null,
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
