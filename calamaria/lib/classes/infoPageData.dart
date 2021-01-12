import '../pages/common.dart';

class InfoPageData {
  String pageDescription, pageHeading, icon;
  List<String> images = List<String>();

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
        this.pageDescription = 'Blabla';
        this.images.add("assets/labialscales.svg");
        this.icon = 'assets/icons/tombstone.svg';
        break;
      case 3:
        this.pageHeading = 'Glossary and scale terminology';
        this.pageDescription = 'Blabla';
        this.images.add("assets/labialscales.svg");
        this.icon = 'assets/icons/book-bookmarked.svg';
        break;
      case 4:
        this.pageHeading = 'Is it really a <i>Calamaria</i>?';
        this.pageDescription =
            """If the snake you’re trying to identify is not a <i>Calamaria</i>, you are obviously not going to find its name with this app. What other snakes in Borneo are at most risk of being mistaken for <i>Calamaria</i> spp.? First of all, most <i>Calamaria</i> never grow to a length exceeding 50 cm, and the majority of them are rarely >35 cm. But all snakes are born small, so how to tell them apart?
              <br><br>
                All <i>Calamaria</i> share two scale characters that are rare among snakes and, when occurring together, are unique among Bornean snakes:
              <br><br>
              <ul>
                <li>They have only 13 rows of dorsal scales around the body</li>
                <li>They lack internasal scales, which (in most snakes) sit between the rostral and the prefrontal scales.</li>
              </ul>

              <br><br>
                The above separates them from the similar-looking snakes of the genus <i>Pseudorabdion</i>. We will look closer at <i>Pseudorabdion</i> soon, but we start with something more urgent.
              <br><br>
              
              <h3>DANGEROUS LOOKALIKES</h3>
              
              <br><br>
                Snakes of the family Elapidae usually possess a neurotoxic venom. Never try to handle them – a bite may kill you. Indeed; never handle ANY snake unless you are ABSOLUTELY sure it is harmless! (While a bite from a <i>Calamaria</i> often draws blood and can be painful, it is not really harmful unless the wound gets infected.)
              <br><br>
                Perhaps most obscure and therefore easiest to mistake for a harmless snake is the Banded Coral Snake (<i>Calliophis intestinalis</i>) and its recently (in late 2020) resurrected sister taxon <i>Calliophis nigrotaeniata</i>. They are slender and usually less than 50 cm long. Like in <i>Calamaria</i> spp. the head is not very distinct from the neck. Their coloration varies much, but essentially the dorsal side (i.e., the back) of the snake is striped. There may be a red mid-dorsal stripe, but other specimens have just brownish, greyish or black stripes on the back. The head is sometimes reddish, sometimes not. The belly is distinctly barred with black on either a cream-colored or a red background. The belly may therefore be very similar to that of <i>Calamaria lumbricoidea</i>, which has a cream-colored belly with black crossbars. Both may have a reddish head. When harassed, <i>Calliophis</i> spp. often raise the tail in an arch, showing the underside of the tail. No <i>Calamaria</i> does that. Although the venom of <i>Calliophis intestinalis</i> seems not as deadly as <a href="https://pubmed.ncbi.nlm.nih.gov/30243938/">previously suspected</a><img src=""" +
                externalUrlIcon +
                """>, very few people have tested this new assumption and a bite should be avoided at all cost. 
              <br><br>
              <img src="asset:assets/infoimages/isitreally1warning1.jpg" alt="Belly comparison between <i>Calamaria lumbricoidea</i> and <i>Calliophis intestinalis</i>">
              <figcaption>Bellies of <i>Calamaria lumbricoidea</i> (left) and the cream-colored belly morph of <i>Calliophis intestinalis</i> (right).
              <br><br>
                Photo © Björn Lardner
              </figcaption>
              <br><br>
                Two deadlier elapid snakes have red heads and red tails, and could potentially be mistaken for red-headed specimens of <i>Calamaria schlegeli</i> and possibly <i>Calamaria lumbricoidea</i>.
              <br><br>
                The Bornean subspecies of the Blue Coral Snake (<i>Calliophis bivirgatus tetrataenia</i>) is not blue, but black with four thin, white stripes on the back and sides of the body. Its head, tail, and belly are bright red. Although it can reach a length of 1.8 m, juveniles are about the size of a <i>Calamaria</i>.
              <br><br>
              <img src="asset:assets/infoimages/isitreally2warning2.jpg" alt="<i>Calliophis bivirgatus tetrataenia</i> (below) and <i>Calamaria schlegeli</i>">
              <figcaption>The dangerously venomous <i>Calliophis bivirgatus tetrataenia</i> (bottom) and the red-headed color form of the harmless <i>Calamaria schlegeli</i> top).
              <br><br>
                Photo (top) © Sam Howard, photo (bottom) © Björn Lardner
              </figcaption>
              

              <br><br>
                There are two different subspecies of the Red-headed Krait (<i>Bungarus flaviceps</i>). The nominate form (<i>Bungarus flaviceps flaviceps</i>) looks very similar to the Blue Coral Snake, but it has a grey (not red) belly and it has three (not four) light stripes on the body – one of them along the center of the back. Those three stripes may, however, be very faint, and there may also be white skin visible between the black scales that gives the snake an almost white-reticulated pattern. The subspecies known as the Kinabalu Krait (<i>Bungarus flaviceps baluensis</i>) is similar, but on the rear of the body as well as on the tail it is red with white and black rings, and the light stripe along the center of the back may be peach rather than white. Its head is golden or yellowish rather than red.
              <br><br>
                The Sunda Spitting Cobra (<i>Naja sumatrana</i>) is almost uniformly black when adult, but juveniles have light rings around the body — as do juveniles of <i>Calamaria lumbricoidea</i>. A baby King Cobra (<i>Ophiophagus hannah</i>) also has light crossbands on a black body, but they are >35 cm long already when they hatch, and therefore larger than a similarly cross-banded juvenile of <i>Calamaria lumbricoidea</i>.
              <br><br>
                All Bornean pitvipers (in the family Viperidae) have a head that is wider than the neck and often a bit triangular when seen from above. That should make them immediately recognizable, and not mistaken for a <i>Calamaria</i>.
              <br><br>

              <h2><i>Pseudorabdion</i> or <i>Calamaria</i>?</h2>
              
              <br><br>
                Once you have confirmed beyond doubt that you are not dealing with a deadly snake, the trickiest part is to say if it is a <i>Calamaria</i> or a <i>Pseudorabdion</i>. There are four species of <i>Pseudorabdion</i> known from Borneo. They have 15 rows of dorsal scales (not 13), which can be very difficult to count in a tiny snake that constantly moves. Look instead for two internasals sitting between the rostral and the prefrontals (image below) – internasals are present in <i>Pseudorabdion</i> and in most other snakes, but absent in <i>Calamaria</i>. You may need a good magnifier to see such small scales! With some experience, the shape of the head can also be a clue: all <i>Pseudorabdion</i> have a rather narrow and pointed, almost wedge-shaped, head, but only a few <i>Calamaria</i> spp. (e.g. <i>Calamaria leucogaster</i>) have such a pointed head. All <i>Pseudorabdion</i> have tails that taper gradually; that is true also for some, but not all, <i>Calamaria</i>.
              <br><br>

              <img src="asset:assets/infoimages/isitreally3.jpg" alt="<i>Pseudorabdion</i> internasal scales">
              <figcaption><i>Pseudorabdion</i> spp. have two internasal scales between the rostral (R) and the prefrontals (PF).
                (In <i>Calamaria</i> spp. the prefrontals are seamlessly fused with the internasals, and called prefrontals.)
              </figcaption>
              <br><br>

              <img src="asset:assets/infoimages/isitreally4.jpg" alt="<i>Pseudorabdion collaris</i>">
              <figcaption><i>Pseudorabdion collaris</i> has a scalation reminiscent of <i>Calamaria</i> spp. It is common around the Mount Kinabalu park headquarters, where it lives side by side with the similarly colored <i>Calamaria schmidti</i>. The latter has a shorter and blunter tail, a somewhat broader head, and lacks internasals.
              <br><br>
                Photo © Björn Lardner
              </figcaption>
              <br><br>

              <img src="asset:assets/infoimages/isitreally5.jpg" alt="<i>Pseudorabdion albonuchalis</i>">
              <figcaption><i>Pseudorabdion albonuchalis</i> may have a red, yellow, or white collar. It is common at low altitudes. Its tail is long and gradually tapering; similar to the tail of <i>Calamaria schlegeli</i>.
              <br><br>
                Photo © Björn Lardner
              </figcaption>
              <br><br>

              Of course, a small snake can be something else than <i>Calamaria</i> or <i>Pseudorabdion</i> (or a dangerous elapid such as the Banded Coral Snake). Most snakes have internasals, so start there. If the snake lacks internasals, then look for smooth dorsal scales in 13 rows, and a head that is hardly distinct from the neck. Don’t mistake blind snakes (family Typhlopidae) for <i>Calamaria</i> – they have eyes that sit under a glossy head shield; at least 20 rows of scales around the body; and they do not have broad ventral scales like most other snakes (including <i>Calamaria</i> spp.) do.
              <br><br>

              <img src="asset:assets/infoimages/isitreally6.jpg" alt="<i>Rhamphotyphlops olivaceus</i>">
              <figcaption><i>Rhamphotyphlops olivaceus</i> is one of several blind snakes in Borneo. Notice the very large rostral scale that reaches far up on the snout.
              <br><br>
                Photo © Björn Lardner
              </figcaption>
              <br><br>
              
              Links to photos showing some of the dangerous lookalikes:<br><br>

              <a href="https://www.inaturalist.org/observations/45130029"><i>Calliophis intestinalis</i></a>
              <img src=""" +
                externalUrlIcon +
                """>
              <br>

              <a href="https://www.inaturalist.org/observations/28028904"><i>Calliophis cf. intestinalis</i></a>
              <img src=""" +
                externalUrlIcon +
                """>
              <br>

              <a href="https://www.inaturalist.org/observations/38791669"><i>Calliophis nigrotaeniata</i></a>
              <img src=""" +
                externalUrlIcon +
                """>
              <br>

              <a href="https://www.inaturalist.org/observations/24220534"><i>Calliophis bivirgatus tetrataenia</i></a>
              <img src=""" +
                externalUrlIcon +
                """>
              <br>

              <a href="https://www.inaturalist.org/observations/35041914"><i>Bungarus flaviceps flaviceps</i></a>
              <img src=""" +
                externalUrlIcon +
                """>
              <br>
              
              <a href="https://www.inaturalist.org/observations/38791697"><i>Bungarus flaviceps baluensis</i></a>
              <img src=""" +
                externalUrlIcon +
                """>
              <br><br>
              <img src="asset:assets/infoimages/isitreally7.jpg" alt="<i>Calliophis intestinalis</i>">
              <figcaption>Calliophis intestinalis from Poring Hot Springs (ca 500 m ASL) in Kinabalu Park, Sabah, featuring a red mid-dorsal stripe.
              <br><br>
                Photo © Björn Lardner
              </figcaption>
              """;

        this.icon = 'assets/icons/head-question.svg';
        break;
      case 5:
        this.pageHeading = 'How to take photos for ID';
        this.pageDescription = 'Blabla';
        this.images.add("assets/labialscales.svg");
        this.icon = 'assets/icons/camera-time2.svg';
        break;
      case 6:
        this.pageHeading = 'How to sex a snake';
        this.pageDescription = 'Blabla';
        this.images.add("assets/labialscales.svg");
        this.icon = 'assets/icons/gender.svg';
        break;
      case 7:
        this.pageHeading = 'Share your novel records';
        this.pageDescription = 'Blabla';
        this.icon = 'assets/icons/share2.svg';
        break;
      case 8:
        this.pageHeading = 'Report bugs & errors';
        this.pageDescription = 'Blabla';
        this.icon = 'assets/icons/bug2.svg';
        break;
      case 9:
        this.pageHeading = 'Version and update info';
        this.pageDescription = 'Blabla';
        this.icon = 'assets/icons/drawer-sync.svg';
        break;
      case 10:
        this.pageHeading = 'Acknowledgments & photo credits';
        this.pageDescription = 'Copyright info';
        this.icon = 'assets/icons/copyright.svg';
        break;
      case 11:
        this.pageHeading = 'Further reading';
        this.pageDescription = 'Blabla';
        this.images.add("assets/labialscales.svg");
        this.icon = 'assets/icons/read.svg';
        break;
      case 12:
        this.pageHeading = 'Ethics and regulations';
        this.pageDescription = 'Blabla';
        this.images.add("assets/labialscales.svg");
        this.icon = 'assets/icons/balance.svg';
        break;
      case 13:
        this.pageHeading = '<i>Calamaria</i> ecology';
        this.pageDescription = 'Blabla';
        this.images.add("assets/labialscales.svg");
        this.icon = 'assets/icons/recycle2.svg';
        break;
      case 14:
        this.pageHeading = 'Welcome to the app';
        this.pageDescription =
            // don't indent or first char will have whitespace before
            """This app is meant to help you identify Calamaria spp. (that is, Reed Snakes) you might come across on Borneo.
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
              """;
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
