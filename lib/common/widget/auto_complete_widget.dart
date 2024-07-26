import 'package:flutter/material.dart';
import 'package:flutter_async_autocomplete/flutter_async_autocomplete.dart';

class AutoCompleteWidget<T> extends StatefulWidget {
  final Future<List<T>> Function(String) getSuggestData;
  final Widget Function(T)? suggestionBuilder;
  final dynamic Function(T)? onTapItem;
  final void Function(String)? onSubmitted;
  final TextStyle? style;
  final String? label;
  final TextStyle? hintStyle;
  final String? hintText;
  const AutoCompleteWidget({
    super.key,
    required this.getSuggestData,
    this.suggestionBuilder,
    this.onTapItem,
    this.onSubmitted,
    this.style,
    this.label,
    this.hintText,
    this.hintStyle,
  });

  @override
  State<AutoCompleteWidget<T>> createState() => _AutoCompleteWidgetState<T>();
}

class _AutoCompleteWidgetState<T> extends State<AutoCompleteWidget<T>> {
  final _controller = TextEditingController();
  InputBorder get _inputBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              widget.label ?? '',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        ),
        AsyncAutocomplete<T>(
          controller: _controller,
          asyncSuggestions: widget.getSuggestData,
          inputTextStyle: widget.style ?? const TextStyle(),
          decoration: InputDecoration(
            border: _inputBorder,
            enabledBorder: _inputBorder,
            focusedBorder: _inputBorder,
            focusedErrorBorder: _inputBorder,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
          ),
          onTapItem: (data) {
            _controller.text = data.toString();
            widget.onTapItem?.call(data);
          },
          onSubmitted: (value) {
            widget.onSubmitted?.call(value);
          },
          suggestionBuilder: widget.suggestionBuilder ??
              (T data) => ListTile(
                    title: Text(
                      data.toString(),
                    ),
                  ),
        ),
      ],
    );
  }
}
