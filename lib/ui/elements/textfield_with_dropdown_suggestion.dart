import 'package:flutter/material.dart';

class TextFieldWithDropdownSuggestion extends StatefulWidget {
  final List<String> list;
  final List<String>? subTitleList;
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onSelect;

  const TextFieldWithDropdownSuggestion(
      {super.key,
      required this.list,
      required this.controller,
      required this.hintText,
      this.onSelect,
      this.subTitleList});

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
      builder: (context) => Stack(
        children: [
          // 👇 transparent layer to detect outside tap
          Positioned.fill(
            child: GestureDetector(
              onTap: () => _removeOverlay(),
              behavior: HitTestBehavior.translucent,
              child: Container(color: Colors.transparent),
            ),
          ),

          // 👇 your dropdown box
          Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              offset: Offset(0.0, size.height + 5),
              link: _layerLink,
              showWhenUnlinked: false,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: _filteredCustomers.isNotEmpty
                      ? (_filteredCustomers.length > 5
                          ? 200
                          : _filteredCustomers.length * 50)
                      : 0,
                  child: ListView.builder(
                    itemCount: _filteredCustomers.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var name = _filteredCustomers[index];
                      String? subtitle;
                      if (widget.subTitleList != null &&
                          widget.subTitleList!.length == widget.list.length) {
                        int originalIndex = widget.list.indexOf(name);
                        subtitle = widget.subTitleList![originalIndex];
                      }
                      return ListTile(
                        title: Text(name),
                        subtitle: subtitle != null ? Text(subtitle) : null,
                        onTap: () {
                          widget.controller.text = name;
                          widget.onSelect?.call();
                          _removeOverlay();
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
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
