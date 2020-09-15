class InfoPageData {
  final String pageTitle = "Calamaria of Borneo";
  String pageDescription, pageHeading, icon;
  List<String> images = List<String>();

  void setData(int index) {
    switch (index) {
      case 2:
        this.pageHeading = 'About this app';
        this.pageDescription =
            'This app is meant to help you identify Calamaria spp. (that is, Reed Snakes) you might come across on Borneo.\n\nThese small and obscure snakes are often very difficult to identify just from their ’looks’. For several of them, no color photographs seem to exist, and no photographs exist of living specimens. Some are only known from one or a handful specimens, often collected more than a century ago. Some look different when young from when fully grown, and adults of the same species may come in different patterns.\n\nBecause we still have limited knowledge of what these snakes may look like, the only way to properly identify many of them is to look at details in their scalation. The multi-character identification algorithm we use in this app looks primarily at their scales, and ignores the snake’s color and pattern. Once you get a suggestion of likely candidate species, based on the characters you have entered, you can go to the relevant species account and read what is known of the species’ color and pattern, its known geographical and altitudinal range, and other tidbits. For many species we also show photos contributed by friends of ours.\n\ṇThere are two types of pages within this app. Some just contain the info in the page you see, and do not link to other pages in the app. You can access all those pages via the Main Menu in the upper right corner of the screen. Other pages are interconnected and linked; these have to do with data you enter in the app when you try to identify a Calamaria-specimen. You start that identification process via the main menu link to Identify your Calamaria. On the relevant pages you can erase all entered data by clicking the red button saying RESTART ID, and start from scratch again.';

        this.icon = 'assets/icons/info-square.svg';
        break;
      case 3:
        this.pageHeading = 'Sure it is a Calamaria?';
        this.pageDescription = 'Blabla';
        this.icon = 'assets/icons/head-question.svg';
        break;
      case 4:
        this.pageHeading = 'How to take photos for ID';
        this.pageDescription = 'Blabla';
        this.images.add("assets/labialscales.svg");
        this.icon = 'assets/icons/camera-time2.svg';
        break;
      case 5:
        this.pageHeading = 'How to sex a snake';
        this.pageDescription = 'Blabla';
        this.images.add("assets/labialscales.svg");
        this.icon = 'assets/icons/gender.svg';
        break;
      case 6:
        this.pageHeading = 'Share your novel records';
        this.pageDescription = 'Blabla';
        this.icon = 'assets/icons/share2.svg';
        break;
      case 7:
        this.pageHeading = 'Report bugs & inconsistencies';
        this.pageDescription = 'Blabla';
        this.icon = 'assets/icons/bug2.svg';
        break;
      case 8:
        this.pageHeading = 'Version and update info';
        this.pageDescription = 'Blabla';
        this.icon = 'assets/icons/drawer-sync.svg';
        break;
      case 9:
        this.pageHeading = 'Copyright info';
        this.pageDescription = 'Copyright info';
        this.icon = 'assets/icons/copyright.svg';
        break;
      case 10:
        this.pageHeading = 'Further reading';
        this.pageDescription = 'Blabla';
        this.images.add("assets/labialscales.svg");
        this.icon = 'assets/icons/read.svg';
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
