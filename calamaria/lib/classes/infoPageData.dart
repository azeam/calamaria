class InfoPageData {
  final String pageTitle = "Calamaria of Borneo";
  String pageDescription, pageHeading, icon;
  List<String> images = List<String>();

  void setData(int index) {
    switch (index) {
      case 2:
        this.pageHeading = 'About this app';
        this.pageDescription =
            // don't intend or first char will have whitespace before
            """<div><p>This app is meant to help you identify Calamaria spp. (that is, Reed Snakes) you might come across on Borneo.
              <br><br>
                These <a href="test">test</a> small and obscure snakes are often very difficult to identify just from their ’looks’. For several of 
                them, no color photographs seem to exist, and no photographs exist of living specimens. Some are only
                known from one or a handful specimens, often collected more than a century ago. 
                Some look different when young from when fully grown, and adults of the same species may come in 
                different patterns.
              <br><br>
                Because we still have limited knowledge of what these snakes may look like, the only way to 
                properly identify many of them is to look at details in their scalation. The multi-character 
                identification algorithm we use in this app looks primarily at their scales, and ignores the snake’s 
                color and pattern. Once you get a suggestion of likely candidate species, based on the characters 
                you have entered, you can go to the relevant species account and read what is known of the species’ 
                color and pattern, its known geographical and altitudinal range, and other tidbits. For many species we 
                also show photos contributed by friends of ours.\n\ṇThere are two types of pages within this app. 
                Some just contain the info in the page you see, and do not link to other pages in the app. 
                You can access all those pages via the Main Menu in the upper right corner of the screen. 
                Other pages are interconnected and linked; these have to do with data you enter in the app when 
                you try to identify a Calamaria-specimen. You start that identification process via the main menu 
                link to Identify your Calamaria. On the relevant pages you can erase all entered data by clicking 
                the red button saying RESTART ID, and start from scratch again.
              </p>
            </div>
              """;
        this.icon = 'assets/icons/info-square.svg';
        break;
      case 3:
        this.pageHeading = 'Is it really a Calamaria?';
        this.pageDescription =
            """<div><p>If the snake you’re trying to identify is not a <i>Calamaria</i>, you’ll obviously not going to 
                find its name with this app. What other snakes in Borneo are at most risk of being mistaken for 
                <i>Calamaria</i> spp.? First of all, most Calamaria never grow to a length exceeding 50 cm, and most of 
                them are rarely >35 cm. If ‘your’ snake is larger than (say) 60 cm, it is not a Calamaria. 
                But all snakes are born small, so how to tell them apart?
              <br><br>
                All Calamaria share two scale characters that are rare among snakes and, when occurring together, 
                are unique among Bornean snakes:
              </p>
              <ul>
                <li>They have only 13 rows of dorsal scales around the body.</li>
                <li>They lack internasal scales, which (in most snakes) sit between the rostral and 
                the prefrontal scales.</li>
              </ul>
              <p>
                The above separates them from the similar-looking snakes of the genus Pseudorabdion, which have 
                internasal scales and 15 dorsal scale rows. We will look closer at Pseudorabdion soon, but we start 
                with something more urgent.
              </p>
              <h3><span>Deadly lookalikes</span></h3>
              <img src="asset:assets/infoimages/hemipenis_test.jpg" alt="hemipenis">
            </div>
          """;
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
      case 11:
        this.pageHeading = 'Ethics and regulations';
        this.pageDescription = 'Blabla';
        this.images.add("assets/labialscales.svg");
        this.icon = 'assets/icons/balance.svg';
        break;
      case 12:
        this.pageHeading = 'Glossary';
        this.pageDescription = 'Blabla';
        this.images.add("assets/labialscales.svg");
        this.icon = 'assets/icons/book-bookmarked.svg';
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
