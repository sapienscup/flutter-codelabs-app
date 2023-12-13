import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final bool Function() validate;
  final Function() onPressed;
  final bool isLoading;
  final bool isSuccess;
  final String text;

  AnimatedButton(
      {Key? key,
      required this.validate,
      required this.onPressed,
      required this.isLoading,
      required this.isSuccess,
      required this.text})
      : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
        width: widget.isLoading || widget.isSuccess
            ? 55
            : MediaQuery.of(context).size.width,
        height: widget.isLoading || widget.isSuccess ? 55 : 50,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: widget.isSuccess
                    ? MaterialStateProperty.all(Colors.green)
                    : MaterialStateProperty.all(Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      widget.isLoading || widget.isSuccess ? 50 : 14),
                ))),
            onPressed: () {
              if (widget.isLoading || widget.isSuccess) return;
              widget.onPressed.call();
            },
            child: widget.isSuccess
                ? const Icon(
                    Icons.check,
                    size: 25,
                    color: Colors.white,
                  )
                : widget.isLoading
                    ? const SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                    : const Text(
                        "Enviar",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
      ),
    );
  }
}
