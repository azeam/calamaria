class FormPageOptions {
  String mainImg, pageDescription, pageTitle, pageHeading;
  List<String> questions = List<String>();
  List<String> radioOp = List<String>();
  List<String> checkOp = List<String>();

  void setData(int page) {
    switch (page) {
      case 1:
        questions.add('Number of upper labials:');
        questions.add('Number of lower labials:');
        questions.add('Which upper labials touch the eye?');
        radioOp.add("4");
        radioOp.add("5");
        radioOp.add("6");
        checkOp.add("2nd");
        checkOp.add("3rd");
        checkOp.add("4th");
        mainImg = 'assets/labialscales.svg';
        pageDescription =
            'Bornean Calamaria have either 4 or 5 (in one species sometimes 6) upper labials (UL), and 4 or 5 lower labials (LL). The tricky part is to judge what are the most posterior of those scales (and not scales named differently). \n\nHere you provide those counts, and enter which of the upper labials are in contact with the eye. Usually two upper labials touch the eye; either the 3rd and 4th, or the 2nd and 3rd. In one species, sometimes only the 3rd UL touches the eye.';
        pageHeading = 'Upper and lower labials (lip scales)';
        pageTitle = "Page " + page.toString() + " of 8";
        break;
      case 2:
        questions.add('Mental touching the anterior chin shields?');
        radioOp.add("Yes");
        radioOp.add("No");
        mainImg = 'assets/labialscales.svg';
        pageDescription =
            'The mental is the scale at the front of the lower jaw, just below where the tongue comes out. In some Calamaria it touches the anterior pair of chin shields; in others the first lower labials on the left and right side of the head meet behind the mental, and thereby separate the mental from the anterior chin shields. \n\nSpecify here which of those alternatives your snake exhibits.';
        pageHeading = 'Mental scale vs. chin shields';
        pageTitle = "Page " + page.toString() + " of 8";
        break;
      case 3:
        questions.add('Preocular present?');
        questions.add('Postocular present?');
        questions.add('Postocular fused with supraocular?');
        radioOp.add("Yes");
        radioOp.add("No");
        mainImg = 'assets/ocularscales.svg';
        pageDescription =
            'All Bornean Calamaria have a supraocular scale sitting above the eye. Most also have a postocular (a small scale just behind the eye). However, in some the postocular may be seamlessly fused with the supralabial – if so, that single, merged scale is called supraocular (and the postocular is considered absent). \n\nHere you focus on these scales plus the presence/absence of a preocular (a small scale sitting in front of the eye). \n\nThe pre- and postoculars can be very small, so make sure you use a good hand lens – or even better, a very good macro lens on your camera – to document their presence/absence!';
        pageHeading = 'Scales around the eye';
        pageTitle = "Page " + page.toString() + " of 8";
        break;
      case 4:
        questions.add('Number of scales touching the paraparietal?');
        radioOp.add("4");
        radioOp.add("5");
        radioOp.add("6");
        mainImg = 'assets/paraparietalscales.svg';
        pageDescription =
            'The paraparietal (PP) sits behind/below the parietal on the rear side of the head. Calamaria species differ in how many scales may surround (and touch) the paraparietal – it may be 4, 5 or 6 scales.\n\nIn the example shown below, there are 5 scales around the paraparietal. (The scale marked ”1” is the parietal, and number ”5” is the last upper labial.)';
        pageHeading = 'Scales around the paraparietal';
        pageTitle = "Page " + page.toString() + " of 8";
        break;
      case 5:
        questions.add('Relative eye size');
        radioOp.add("Smaller");
        radioOp.add("Equal");
        radioOp.add("Larger");
        mainImg = 'assets/paraparietalscales.svg';
        pageDescription =
            'The size of the eye varies among Calamaria spp. Here you compare the eye diameter with the height of the upper lip below the eye. Is the eye diameter smaller than, more or less equal to, or larger than that the height of the upper lip?\n\nBelow are three illustrations showing what it might look like. ”Larger” is just a little larger.\n\nBeware that baby snakes often have eyes that, relatively speaking, are larger than in the adults; this character works best for adults.';
        pageHeading = 'Relative size of the eye';
        pageTitle = "Page " + page.toString() + " of 8";
        break;
      case 6:
        questions.add('Hemipenes seen?');
        radioOp.add("Yes");
        radioOp.add("No");
        mainImg = 'assets/paraparietalscales.svg';
        pageDescription =
            'Knowing the sex of the snake can help narrowing down the number of candidate species. But sexing a small snake is difficult unless you are an expert. [See link under Main Menu.]\n\nHere we ask you to say if – or if not – you observed one or two hemipenes stick out from the snake’s cloaca. This sometimes happens if a male snake coils tightly around your finger and gives it a squeeze.\n\nIf you answer ”NO”, the algorithm will consider both sexes’ ventral and subcaudal counts (which you will be given a chance to enter soon).';
        pageHeading = 'Hemipenes seen?';
        pageTitle = "Page " + page.toString() + " of 8";
        break;
      case 7:
        questions.add('Tail tapering...');
        radioOp.add("Gradually");
        radioOp.add("Intermediately");
        radioOp.add("Abruptly");
        mainImg = 'assets/paraparietalscales.svg';
        pageDescription =
            'This is not about the tail length – it is about where on the tail it starts to get narrower, and how abruptly (steeply) it then narrows down. We say that the tail tapers gradually for much of the tail’s length, or abruptly near the end, or something inbetween those states.\n\nThis is a subjective character which can be difficult to score correctly. If this character results in a mis-match for an otherwise good species agreement, revisit the character state.';
        pageHeading = 'Shape of the tail / tail tip';
        pageTitle = "Page " + page.toString() + " of 8";
        break;
      case 8:
        questions.add('Enter the number of ventrals:');
        questions.add('Enter the number of subcaudals:');
        mainImg = 'assets/paraparietalscales.svg';
        pageDescription =
            'It is virtually impossible to count how many ventral scales a living Calamaria specimen has – they move too much! It is easier with road-killed specimens unless they are too damaged. Best is to photograph the snake from below (see advice on how to do that under the Main Menu) and count scales from the photo.\n\nCounting subcaudals (they are paired in Calamaria, so only count those on one side of the tail) is also best done from photos.\n\nIt is important to start counting on the right scale; to not count the anal scale; and to not count the tail tip scute. The photo advice page gives more info on this.';
        pageHeading = 'Number of ventrals & subcaudals';
        pageTitle = "Page " + page.toString() + " of 8";
        break;
    }
  }
}
