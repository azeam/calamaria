class InfoPageData {
  final String pageTitle = "Calamaria of Borneo";
  String pageDescription, pageHeading;
  List<String> images = List<String>();

  void setData(String page) {
    switch (page) {
      case "about":
        this.pageDescription = 'Blabla';
        this.pageHeading = 'About this app';
        break;
      case "sure":
        this.pageDescription = 'Blabla';
        this.pageHeading = 'Sure it is a Calamaria?';
        break;
      case "photos":
        this.pageDescription = 'Blabla';
        this.pageHeading = 'How to take photos for ID';
        this.images.add("assets/labialscales.svg");
        break;
      case "sexing":
        this.pageDescription = 'Blabla';
        this.pageHeading = 'How to sex a snake';
        this.images.add("assets/labialscales.svg");
        break;
      case "share":
        this.pageDescription = 'Blabla';
        this.pageHeading = 'Share your novel records';
        break;
      case "bugs":
        this.pageDescription = 'Blabla';
        this.pageHeading = 'Report bugs & inconsistencies';
        break;
      case "version":
        this.pageDescription = 'Blabla';
        this.pageHeading = 'Version and update info';
        break;
      case "copyright":
        this.pageDescription = 'Copyright info';
        this.pageHeading = 'Copyright info';
        break;
      case "reading":
        this.pageDescription = 'Blabla';
        this.pageHeading = 'Further reading';
        this.images.add("assets/labialscales.svg");
        break;
    }
  }
}
