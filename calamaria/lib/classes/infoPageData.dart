import 'dart:convert';

import 'infoData.dart';

const data = """{
    "menuItems": [
      {
        "heading": "Identify your <i>Calamaria</i>",
        "icon": "loupe.svg",
        "data": ""
      },
      {
        "heading": "Species list and species accounts",
        "icon": "clipboard-list.svg",
        "data": ""
      },
      {
        "heading": "Warning!",
        "icon": "tombstone.svg",
        "data": "warning"
      },
      {
        "heading": "Ethics and regulations",
        "icon": "balance.svg",
        "data": "ethics"
      },
      {
        "heading": "Glossary and scale terminology",
        "icon": "book-bookmarked.svg",
        "data": "glossary"
      },
      {
        "heading": "Is it really a <i>Calamaria</i>?",
        "icon": "head-question.svg",
        "data": "isItReally"
      },
      {
        "heading": "<i>Calamaria</i> ecology",
        "icon": "recycle2.svg",
        "data": "ecology"
      },
      {
        "heading": "How to take photos for ID",
        "icon": "camera-time2.svg",
        "data": "photos"
      },
      {
        "heading": "How to sex a snake",
        "icon": "gender.svg",
        "data": "sex"
      },
      {
        "heading": "Share your novel records",
        "icon": "share2.svg",
        "data": "share"
      },
      {
        "heading": "Report bugs and errors",
        "icon": "bug2.svg",
        "data": "bugs"
      },
      {
        "heading": "Version and update info",
        "icon": "drawer-sync.svg",
        "data": "version"
      },
      {
        "heading": "Acknowledgments and photo credits",
        "icon": "copyright.svg",
        "data": "copyright"
      },
      {
        "heading": "Further reading",
        "icon": "read.svg",
        "data": "reading"
      },
      {
        "heading": "Welcome to the app",
        "icon": "info-square.svg",
        "data": "welcome"
      }
    ]
  }""";

var jsonData = jsonDecode(data)['menuItems'] as List;

class InfoPageData {
  String pageDescription, pageHeading, icon;

  List<Info> menuItems = jsonData.map((data) => Info.fromJson(data)).toList();

  void setData(int index) {
    this.icon = "assets/icons/" + this.menuItems[index].icon.toString();
    this.pageHeading = this.menuItems[index].heading.toString();
  }

  List<Info> getJsonAsList() {
    return menuItems;
  }

  String getData(int index) {
    return this.menuItems[index].data.toString();
  }
}
