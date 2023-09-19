// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/location.dart';

class SearchBar extends StatefulWidget {
  final bool? shwoLocation;
  final void Function()? goBackCallback;
  final String? inputValue;
  final String? defaultInputValue;
  final void Function()? onCancel;
  final bool? showMap;
  final void Function()? onSearch;
  final ValueChanged<String>? onSearchSubmit;

  const SearchBar(
      {Key? key,
      this.shwoLocation,
      this.goBackCallback,
      this.inputValue = '',
      this.defaultInputValue = 'search where to travel',
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  late TextEditingController _controller;
  late FocusNode _focus;
  Function? _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
  }

  @override
  void initState() {
    _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      child: Row(
        children: <Widget>[
          if (widget.shwoLocation != null)
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.room,
                        color: Colors.green,
                        size: 16,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ShowLocation(
                                  title: 'Location',
                                )));
                      },
                    ),
                    Text('Bui',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ],
                ),
              ),
            ),
          if (widget.goBackCallback != null)
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                  onTap: widget.goBackCallback,
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.black87,
                  )),
            ),
          Expanded(
            child: Container(
              height: 34,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(17.0)),
              padding: EdgeInsets.only(right: 10.0),
              child: TextField(
                focusNode: _focus,
                onTap: () {
                  if (null == widget.onSearchSubmit) {
                    _focus.unfocus();
                  }

                  widget.onSearch!();
                },
                onSubmitted: widget.onSearchSubmit,
                textInputAction: TextInputAction.search,
                controller: _controller,
                style: TextStyle(fontSize: 14),
                onChanged: (String value) {
                  setState(() {
                    _searchWord = value;
                  });
                },
                decoration: InputDecoration(
                  //pre image prefix, after image surfix

                  border: InputBorder.none,
                  hintText: 'seacrh where to travel',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  contentPadding: EdgeInsets.only(top: 1),

                  suffixIcon: GestureDetector(
                    onTap: () {
                      _onClean();
                    },
                    child: Icon(
                      Icons.clear,
                      size: 18,
                      color: _searchWord == '' ? Colors.grey[200] : Colors.grey,
                    ),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 1.0, left: 10),
                    child: Icon(Icons.search, size: 18.0, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          if (widget.onCancel != null)
            Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: widget.onCancel,
                  child: Text('cancel',
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                )),
          if (widget.showMap != null)
            Image.asset('static/icon/widget_search_bar_map.png')
        ],
      ),
    );
  }
}
