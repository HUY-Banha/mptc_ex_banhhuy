import 'package:flutter/material.dart';
import 'package:mptc_exercise_banhahuy/core/constants/app_colors.dart';
import 'package:mptc_exercise_banhahuy/core/l10n/l10n.dart';

class SecondarySearchField extends StatefulWidget {
  const SecondarySearchField({
    super.key,
    required this.controller,
    this.focusNode,
    this.onSearch,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final VoidCallback? onSearch;

  @override
  State<SecondarySearchField> createState() => _SecondarySearchFieldState();
}

class _SecondarySearchFieldState extends State<SecondarySearchField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    if (mounted) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      radius: 10,
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context).search,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 3),
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: widget.onSearch,
            child: Container(
              width: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _isFocused ? AppColors.primaryColor : AppColors.greyColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                AppLocalizations.of(context).search,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;

  const PrimaryContainer({
    super.key,
    this.radius,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: color ?? const Color(0x1A1E1E1E),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
          const BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 1,
            color: Colors.grey,
          ),
        ],
      ),
      child: child,
    );
  }
}
