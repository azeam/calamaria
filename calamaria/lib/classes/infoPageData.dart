import 'infoPages/bugs.dart';
import 'infoPages/copyright.dart';
import 'infoPages/ecology.dart';
import 'infoPages/ethics.dart';
import 'infoPages/glossary.dart';
import 'infoPages/isItReally.dart';
import 'infoPages/photos.dart';
import 'infoPages/reading.dart';
import 'infoPages/sex.dart';
import 'infoPages/share.dart';
import 'infoPages/warning.dart';
import 'infoPages/welcome.dart';

class InfoPageData {
  String pageDescription, pageHeading, icon;

  void setData(int index) {
    switch (index) {
      case 0:
        this.icon = 'assets/icons/loupe.svg';
        this.pageHeading = """Identify your <i>Calamaria</i>""";
        break;
      case 1:
        this.icon = 'assets/icons/clipboard-list.svg';
        this.pageHeading = """Species list and species accounts""";
        break;
      case 2:
        this.pageHeading = 'Warning!';
        this.pageDescription = infoWarning;
        this.icon = 'assets/icons/tombstone.svg';
        break;
      case 3:
        this.pageHeading = 'Ethics & regulations';
        this.pageDescription = infoEthics;
        this.icon = 'assets/icons/balance.svg';
        break;
      case 4:
        this.pageHeading = 'Glossary and scale terminology';
        this.pageDescription = infoGlossary;
        this.icon = 'assets/icons/book-bookmarked.svg';
        break;
      case 5:
        this.pageHeading = 'Is it really a <i>Calamaria</i>?';
        this.pageDescription = infoIsItReally;
        this.icon = 'assets/icons/head-question.svg';
        break;
      case 6:
        this.pageHeading = '<i>Calamaria</i> ecology';
        this.pageDescription = infoEcology;
        this.icon = 'assets/icons/recycle2.svg';
        break;
      case 7:
        this.pageHeading = 'How to take photos for ID';
        this.pageDescription = infoPhotos;
        this.icon = 'assets/icons/camera-time2.svg';
        break;
      case 8:
        this.pageHeading = 'How to sex a snake';
        this.pageDescription = infoSex;
        this.icon = 'assets/icons/gender.svg';
        break;
      case 9:
        this.pageHeading = 'Share your novel records';
        this.pageDescription = infoShare;
        this.icon = 'assets/icons/share2.svg';
        break;
      case 10:
        this.pageHeading = 'Report bugs & errors';
        this.pageDescription = infoBugs;
        this.icon = 'assets/icons/bug2.svg';
        break;
      case 11:
        this.pageHeading = 'Version & update info';
        this.icon = 'assets/icons/drawer-sync.svg';
        break;
      case 12:
        this.pageHeading = 'Acknowledgments & photo credits';
        this.pageDescription = infoCopyright;
        this.icon = 'assets/icons/copyright.svg';
        break;
      case 13:
        this.pageHeading = 'Further reading';
        this.pageDescription = infoReading;
        this.icon = 'assets/icons/read.svg';
        break;
      case 14:
        this.pageHeading = 'Welcome to the app';
        this.pageDescription = infoWelcome;
        this.icon = 'assets/icons/info-square.svg';
        break;
    }
  }

  String getHeading() {
    return this.pageHeading;
  }

  String getIcon() {
    return this.icon;
  }
}
