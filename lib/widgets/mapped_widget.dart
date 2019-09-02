import 'package:atlan_demo/core/services/utility_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:intl/intl.dart';

class MappedWidget extends StatefulWidget {
  final Map<String, dynamic> _mapData;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool isField;

  MappedWidget.fromMap(
    Map<String, dynamic> mapData, {
    Key key,
    this.onTap,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.all(8),
    this.isField = true,
  })  : this._mapData = mapData,
        super(key: key);

  @override
  MappedWidgetState createState() => MappedWidgetState();
}

class MappedWidgetState extends State<MappedWidget> {
  String id;
  dynamic selectedValue;
  Type type;

  @override
  Widget build(BuildContext context) {
    this.id = widget._mapData.containsKey('id') ? widget._mapData['id'] : '';
    Map<String, dynamic> propertiesMap =
        widget._mapData.containsKey('properties')
            ? widget._mapData['properties']
            : null;
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.white,
          shadows: [
            BoxShadow(
              color: Colors.black.withAlpha(8),
              blurRadius: 16,
              offset: Offset(0, 3),
              spreadRadius: 9,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget._mapData.containsKey('title'))
            getTitle(context, widget._mapData['title']),
          if (propertiesMap != null && propertiesMap.containsKey('description'))
            getDescription(context, propertiesMap['description']),
          if (propertiesMap != null && propertiesMap.containsKey('show_button'))
            getButton(
              context,
              propertiesMap.containsKey('button_text')
                  ? propertiesMap['button_text']
                  : 'CLick',
              widget.onTap,
            ),
          if (widget._mapData.containsKey('type'))
            getField(widget._mapData['type']),
        ],
      ),
    );
  }

  Widget getTitle(BuildContext context, String title) {
    return Text(
      title ?? 'Title',
      style: Theme.of(context).textTheme.title,
    );
  }

  Widget getDescription(BuildContext context, String description) {
    return Text(
      description ?? 'Description',
      style: Theme.of(context).textTheme.subtitle,
    );
  }

  Widget getButton(
    BuildContext context,
    String buttonText,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: RaisedButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(buttonText.toUpperCase())],
        ),
      ),
    );
  }

  Widget getField(String type) {
    Map<String, dynamic> propertiesMap =
        widget._mapData.containsKey('properties')
            ? widget._mapData['properties']
            : null;
    switch (type) {
      case 'short_text':
        this.type = String;
        return TextFormField(
          validator: (value) {
            if (value.isEmpty) return 'Cannot be empty';
            return null;
          },
          onSaved: onSaved,
        );
        break;
      case 'dropdown':
        this.type = String;
        return DropdownButtonFormField<String>(
          items: propertiesMap != null && propertiesMap.containsKey('choices')
              ? () {
                  List<Map<String, dynamic>> choiceMapList =
                      List.castFrom(propertiesMap['choices']);
                  List<String> choiceList = choiceMapList.map((choice) {
                    if (choice.containsKey('label'))
                      return choice['label'].toString();
                    return '';
                  }).toList();
                  print(choiceList.toString());
                  choiceList.removeWhere(
                      (choice) => choice == null || choice.isEmpty);
                  return choiceList.map((choice) {
                    return DropdownMenuItem<String>(
                      child: Text(choice),
                      value: choice ?? '',
                    );
                  }).toList();
                }()
              : [],
          validator: (value) {
            if (value.isEmpty) return 'Select a value';
            return null;
          },
          onChanged: onSaved,
          value: selectedValue,
        );
        break;
      case 'number':
        this.type = int;
        return TextFormField(
          validator: (value) {
            if (value.isEmpty) return 'Cannot be empty';
            int age = int.tryParse(value);
            if (age == null) return 'Enter a valid age';
            return null;
          },
          onSaved: (value) => this.selectedValue = int.tryParse(value),
          keyboardType: TextInputType.number,
        );
        break;
      case 'email':
        this.type = String;
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value.isEmpty) return 'Cannot be empty';
            if (UtilityServices().isValidEmail(value))
              return 'Enter a valid Email';
            return null;
          },
          onSaved: onSaved,
        );
        break;
      case 'phone_number':
        this.type = String;
        return TextFormField(
          keyboardType: TextInputType.phone,
          onSaved: onSaved,
        );
        break;
      case 'rating':
        this.type = int;
        return RatingBar(
          onRatingUpdate: (value) {
            selectedValue = value.floor();
          },
          allowHalfRating: false,
          itemCount: 7,
          glow: true,
          itemBuilder: (context, index) {
            return Icon(
              Icons.star,
              color: Theme.of(context).accentColor,
            );
          },
        );
        break;
      case 'date':
        this.type = DateTime;
        return RaisedButton(
          child: () {
            if (this.selectedValue == null) {
              return Text('Select date');
            }
            DateTime dateTime = this.selectedValue as DateTime;
            DateFormat format = DateFormat('dd MMM yyyy');
            return Text(format.format(dateTime));
          }(),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2017, 12, 31),
              lastDate: DateTime.now(),
            ).then((date) {
              setState(() {
                this.selectedValue = date;
              });
            });
          },
        );
        break;
      case 'yes_no':
        this.type = String;
        return RadioButtonGroup(
          labels: ['Yes', 'No'],
          onSelected: onSaved,
        );
        break;
      default:
        return Offstage();
    }
  }

  void onSaved(String value) => setState(() => this.selectedValue = value);
}
