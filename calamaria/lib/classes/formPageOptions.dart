class FormPageOptions {
  String mainImg, pageDescription, pageHeading;
  List<String> questions = List<String>();
  List<String> radioOp = List<String>();
  List<String> checkOp = List<String>();

  void setData(int page) {
    switch (page) {
      case 1:
        this.questions.add('Number of upper labials:');
        this.questions.add('Number of lower labials:');
        this.questions.add('Which upper labials touch the eye?');
        this.radioOp.add("4");
        this.radioOp.add("5");
        this.radioOp.add("6");
        this.checkOp.add("2nd");
        this.checkOp.add("3rd");
        this.checkOp.add("4th");
        this.mainImg = 'assets/formimages/labialscales.svg';
        this.pageDescription =
            """Bornean <i>Calamaria</i> have either 4 or 5 (in one species sometimes 6) upper labials (UL), and 4 or 5 
            lower labials (LL). The tricky part is to judge what are the most posterior of those scales (and not scales 
            named differently).
            <br>
            <br>Here you provide those counts, and enter which of the upper labials are in contact 
            with the eye. Usually two upper labials touch the eye; either the 3rd and 4th, or the 2nd and 3rd. 
            In one species, sometimes only the 3rd UL touches the eye.""";
        this.pageHeading = 'Upper and lower labials';
        break;
      case 2:
        this.questions.add('Mental touching the anterior chin shields?');
        this.radioOp.add("Yes");
        this.radioOp.add("No");
        this.mainImg = 'assets/formimages/mental.svg';
        this.pageDescription =
            """The mental is the scale at the front of the lower jaw, just below where the tongue comes out. 
            In some <i>Calamaria</i> it touches the anterior pair of chin shields; in others the first lower 
            labials on the left and right side of the head meet behind the mental, 
            and thereby separate the mental from the anterior chin shields. 
            <br><br>
            Specify here which of those alternatives your snake exhibits.""";
        this.pageHeading = 'Mental scale vs. chin shields';
        break;
      case 3:
        this.questions.add('Preocular present?');
        this.questions.add('Postocular present?');
        this.radioOp.add("Yes");
        this.radioOp.add("No");
        this.mainImg = 'assets/formimages/ocularscales.svg';
        this.pageDescription =
            """All Bornean <i>Calamaria</i> have a supraocular scale sitting above the eye. 
            Most also have a postocular (a small scale just behind the eye). 
            However, in some the postocular may be seamlessly fused with the supralabial – 
            if so, that single, merged scale is called supraocular (and the postocular is considered absent). 
            <br><br>
            Here you focus on these scales plus the presence/absence of a preocular (a small scale 
            sitting in front of the eye). 
            <br><br>
            The pre- and postoculars can be very small, so make sure you use a good hand lens – 
            or even better, a very good macro lens on your camera – to document their presence/absence!""";
        this.pageHeading = 'Scales around the eye';
        break;
      case 4:
        this.questions.add('Number of scales touching the paraparietal?');
        this.radioOp.add("4");
        this.radioOp.add("5");
        this.radioOp.add("6");
        this.mainImg = 'assets/formimages/paraparietalscales.svg';
        this.pageDescription =
            """The paraparietal (PP) sits behind/below the parietal on the rear side of the head. 
            <i>Calamaria</i> species differ in how many scales may surround (and touch) the paraparietal – 
            it may be 4, 5 or 6 scales.
            <br><br>
            In the example shown below, there are 5 scales around the paraparietal. 
            (The scale marked ”1” is the parietal, and number ”5” is the last upper labial.)""";
        this.pageHeading = 'Scales around the paraparietal';
        break;
      case 5:
        this.questions.add('Relative eye size');
        this.radioOp.add("Smaller");
        this.radioOp.add("Equal");
        this.radioOp.add("Larger");
        this.mainImg = 'assets/formimages/eyesize.png';
        this.pageDescription =
            """The size of the eye varies among <i>Calamaria</i> spp. Here you compare the eye diameter with 
            the height of the upper lip below the eye. Is the eye diameter smaller than, more or less 
            equal to, or larger than that the height of the upper lip?
            <br><br>
            Below are three illustrations showing what it might look like. ”Larger” is just a little larger.
            <br><br>
            Beware that baby snakes often have eyes that, relatively speaking, are larger than in the adults; 
            this character works best for adults.""";
        this.pageHeading = 'Relative size of the eye';
        break;
      case 6:
        this.questions.add('Hemipenes seen?');
        this.radioOp.add("Yes");
        this.radioOp.add("No");
        this.mainImg = 'assets/formimages/hemipenis.jpg';
        this.pageDescription =
            """Knowing the sex of the snake can help narrowing down the number of candidate species. 
            But sexing a small snake is difficult unless you are an expert. [See link under Main Menu.]
            <br><br>
            Here we ask you to say if – or if not – you observed one or two hemipenes stick out from the snake’s cloaca. 
            This sometimes happens if a male snake coils tightly around your finger and gives it a squeeze.
            <br><br>
            If you answer ”NO”, the algorithm will consider both sexes’ ventral and subcaudal counts 
            (which you will be given a chance to enter soon).""";
        this.pageHeading = 'Hemipenes seen?';
        break;
      case 7:
        this.questions.add('Tail tapering?');
        this.radioOp.add("Gradual");
        this.radioOp.add("Intermediate");
        this.radioOp.add("Abrupt");
        this.mainImg = 'assets/formimages/tailshape.svg';
        this.pageDescription =
            """This is not about the tail length – it is about where on the tail it starts to get 
            narrower, and how abruptly (steeply) it then narrows down. We say that the tail tapers 
            gradually for much of the tail’s length, or abruptly near the end, or something 
            inbetween those states.
            <br><br>
            This is a subjective character which can be difficult to score correctly. 
            If this character results in a mis-match for an otherwise good species agreement, 
            revisit the character state.""";
        this.pageHeading = 'Shape of the tail / tail tip';
        break;
      case 8:
        this.questions.add('Enter the number of ventrals:');
        this.questions.add('Enter the number of subcaudals:');
        this.mainImg = 'assets/formimages/paraparietalscales.svg';
        this.pageDescription =
            """It is virtually impossible to count how many ventral scales a living <i>Calamaria</i> 
            specimen has – they move too much! It is easier with road-killed specimens unless they are 
            too damaged. Best is to photograph the snake from below (see advice on how to do that 
            under the Main Menu) and count scales from the photo.
            <br><br>
            Counting subcaudals (they are paired in <i>Calamaria</i>, so only count those on one side of 
            the tail) is also best done from photos.
            <br><br>
            It is important to start counting on the right scale; to not count the anal scale; 
            and to not count the tail tip scute. The photo advice page gives more info on this.""";
        this.pageHeading = 'Ventrals & subcaudals';
        break;
    }
  }
}
