import 'package:flutter/material.dart';

class TextFieldWithDropdownSuggestion extends StatefulWidget {
  final List<String> list;
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onSelect;

  const TextFieldWithDropdownSuggestion({
    super.key,
    required this.list,
    required this.controller,
    required this.hintText,
    this.onSelect,
  });

  @override
  State<TextFieldWithDropdownSuggestion> createState() =>
      _TextFieldWithDropdownSuggestionState();
}

class _TextFieldWithDropdownSuggestionState
    extends State<TextFieldWithDropdownSuggestion> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  List<String> _filteredCustomers = [];
  final FocusNode _focusNode = FocusNode();

  void _openDropdown() {
    _filteredCustomers = widget.list;
    _showOverlay();
  }

  void _filterDropdown(String query) {
    _filteredCustomers = widget.list
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    _showOverlay();
  }

  void _showOverlay() {
    _removeOverlay();
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          offset: Offset(0.0, size.height + 5),
          link: _layerLink,
          showWhenUnlinked: false,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: _filteredCustomers
                  .map((name) => ListTile(
                        title: Text(name),
                        onTap: () {
                          widget.controller.text = name;
                          if (widget.onSelect != null) {
                            widget.onSelect!();
                          }
                          _removeOverlay();
                        },
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _openDropdown();
      } else {
        _removeOverlay();
      }
    });

    widget.controller.addListener(() {
      if (_focusNode.hasFocus) {
        _filterDropdown(widget.controller.text);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
