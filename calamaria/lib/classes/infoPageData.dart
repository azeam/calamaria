import "infoPages/bugs.dart";
import "infoPages/copyright.dart";
import "infoPages/ecology.dart";
import "infoPages/ethics.dart";
import "infoPages/glossary.dart";
import "infoPages/isItReally.dart";
import "infoPages/photos.dart";
import "infoPages/reading.dart";
import "infoPages/sex.dart";
import "infoPages/share.dart";
import "infoPages/warning.dart";
import "infoPages/welcome.dart";

class InfoPageData {
  String pageDescription, pageHeading, icon;

  /* 
    very messy data... workaround to be able to make links using the heading as href
    instead of index in order to prevent breaking links if the menu changes 
    (while keeping the index to set active menu element color etc.)
    headings, icons and data index must be kept in the correct order though
  */
  List<String> headings = [
    "Identify your <i>Calamaria</i>",
    "Species list and species accounts",
    "Warning!",
    "Ethics and regulations",
    "Glossary and scale terminology",
    "Is it really a <i>Calamaria</i>?",
    "<i>Calamaria</i> ecology",
    "How to take photos for ID",
    "How to sex a snake",
    "Share your novel records",
    "Report bugs and errors",
    "Version and update info",
    "Acknowledgments and photo credits",
    "Further reading",
    "Welcome to the app"
  ];

  List<String> icons = [
    "loupe.svg",
    "clipboard-list.svg",
    "tombstone.svg",
    "balance.svg",
    "book-bookmarked.svg",
    "head-question.svg",
    "recycle2.svg",
    "camera-time2.svg",
    "gender.svg",
    "share2.svg",
    "bug2.svg",
    "drawer-sync.svg",
    "copyright.svg",
    "read.svg",
    "info-square.svg"
  ];

  String getData(index) {
    switch (index) {
      case 2:
        return infoWarning;
      case 3:
        return infoEthics;
      case 4:
        return infoGlossary;
      case 5:
        return infoIsItReally;
      case 6:
        return infoEcology;
      case 7:
        return infoPhotos;
      case 8:
        return infoSex;
      case 9:
        return infoShare;
      case 10:
        return infoBugs;
      case 12:
        return infoCopyright;
      case 13:
        return infoReading;
      case 14:
        return infoWelcome;
    }
    return "Not found";
  }

  void setData(int index) {
    this.pageHeading = headings[index];
    this.icon = "assets/icons/" + icons[index];
  }

  String getHeading() {
    return this.pageHeading;
  }

  String getIcon() {
    return this.icon;
  }
}
