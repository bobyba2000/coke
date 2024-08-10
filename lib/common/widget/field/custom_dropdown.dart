import 'package:coke_platform/generated/l10n.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? value;
  final void Function(T?) onSelect;
  final TextStyle? style;
  final String? label;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool required;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  final List<T> Function()? getItems;
  final double maxHeight;
  const CustomDropdown({
    super.key,
    required this.items,
    this.value,
    required this.onSelect,
    this.style,
    this.label,
    this.hintStyle,
    this.hintText,
    required this.required,
    this.validator,
    this.helperText,
    this.getItems,  this.maxHeight = 300,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  bool _hasOpenedOverlay = false;
  late TextEditingController _controller;
  late FocusNode _focusNode;
  OverlayEntry? _overlayEntry;
  T? selectedValue;
  final LayerLink _layerLink = LayerLink();
  List<T> items = [];

  InputBorder get _inputBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).dividerColor,
        ),
        borderRadius: BorderRadius.circular(12),
      );

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    selectedValue = widget.value;
    items = widget.items;
    selectedValue = widget.items.where((element) => element == widget.value).firstOrNull;
    _controller = TextEditingController(
      text: selectedValue?.toString() ?? '',
    );
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) openOverlay();
      if (!_focusNode.hasFocus) closeOverlay();
    });
  }

  @override
  void didUpdateWidget(covariant CustomDropdown<T> oldWidget) {
    Function eq = const DeepCollectionEquality().equals;
    if (!eq(widget.items, oldWidget.items) || (oldWidget.value != widget.value && selectedValue != widget.value)) {
      items = widget.items;
      selectedValue = widget.items.where((element) => element == widget.value).firstOrNull;
      _controller.text = selectedValue?.toString() ?? '';
      widget.onSelect.call(selectedValue);
      closeOverlay();
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  void closeOverlay() {
    Future.delayed(const Duration(milliseconds: 300)).then(
      (value) {
        if (_hasOpenedOverlay) {
          _overlayEntry!.remove();
          _overlayEntry = null;
          setState(() {
            _hasOpenedOverlay = false;
          });
        }
      },
    );
  }

  void openOverlay() {
    if (_overlayEntry == null) {
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var size = renderBox.size;
      var offset = renderBox.localToGlobal(Offset.zero);
      final ThemeData theme = Theme.of(context);
      final ScaffoldState? scaffold = Scaffold.maybeOf(context);

      Color suggestionBackgroundColor = scaffold?.widget.backgroundColor ?? theme.scaffoldBackgroundColor;
      final displayItems = widget.getItems?.call() ?? items;
      _overlayEntry ??= OverlayEntry(
        builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy + size.height - (widget.label != null ? 20 : -5),
          width: size.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, size.height - (widget.label != null ? 20 : -5)),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(5),
              color: suggestionBackgroundColor,
              child: Container(
                constraints:  BoxConstraints(maxHeight: widget.maxHeight),
                child: Visibility(
                  child: Scrollbar(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final item = displayItems[index];
                        final isSelected = item == selectedValue;
                        return ListTile(
                          onTap: () {
                            _controller.text = item.toString();
                            widget.onSelect.call(item);
                          },
                          title: Text(
                            item.toString(),
                          ),
                          selected: isSelected,
                        );
                      },
                      itemCount: displayItems.length,
                      shrinkWrap: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    if (!_hasOpenedOverlay) {
      Overlay.of(context).insert(_overlayEntry!);
      setState(() => _hasOpenedOverlay = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.label != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Text(
                  widget.label ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Visibility(
                  visible: widget.required,
                  child: Text(
                    "*",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
        CompositedTransformTarget(
          link: _layerLink,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  border: _inputBorder,
                  enabledBorder: _inputBorder,
                  focusedBorder: _inputBorder,
                  focusedErrorBorder: _inputBorder,
                  hintText: widget.hintText ?? S.current.pleaseSelect,
                  hintStyle: widget.hintStyle ??
                      Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.grey,
                          ),
                  helperText: widget.helperText,
                ),
                controller: _controller,
                onTap: openOverlay,
                focusNode: _focusNode,
                onEditingComplete: () => closeOverlay(),
                validator: widget.validator,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
