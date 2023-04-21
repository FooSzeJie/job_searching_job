class Job {
  int jobId;
  String company;
  String logoUrl;
  String title;
  String location;
  String time;
  List <String> req;

  // Constructor
  Job(this.jobId ,this.company, this.logoUrl, this.title, this.location, this.time, this.req);

}

// Job List
List<Job> allJobs = [
  Job(
    0,
    'Google LLC,',
    'assets/images/google_logo.png',
    'Principle Product Design',
    '417 Marion, New York\nUnited States',
    'Full Time',
    [
      "Creative with an eye for shape and colour",
      'Understand different materials and production methods',
      'How technical, practical and scientific knowledge and ability',
      'Interested in the way people choose and use products'
    ],
  ),

  Job(
    1,
    'Airbnb inc.',
    'assets/images/airbnb_logo.png',
    'VP Business Intelegence',
    '50 Herminia Stravenue,\nCanada',
    'Full Time',
    [
      "Creative with an eye for shape and colour",
      'Understand different materials and production method',
      'How technical, practical and scientific knowledge',
      'Interested in the way people choose and use product'
    ],
  ),

  Job(
    2,
    'Linkedin corp,',
    'assets/images/linkedin_logo.png',
    'Talent Acqusition Lead',
    '566 Eleamore Square,\nFrance',
    'Part Time',
    [
      "Creative with an eye for shape and colour",
      'Understand different materials and production methods',
      'How technical, practical and scientific knowledge and ability',
      'Interested in the way people choose and use products'
    ],
  ),

  Job(
    3,
    'Meta Platforms, Inc.',
    'assets/images/meta_logo.png',
    'Principle Product Design',
    '4 Marion, New York\nUnited States',
    'Full Time',
    [
      "Creative with an eye for shape and colour",
      'Understand different materials and production methods',
      'How technical, practical and scientific knowledge and ability',
      'Interested in the way people choose and use products'
    ],
  ),

  Job(
    4,
    'Tencent Holdings Ltd.',
    'assets/images/tencent_logo.png',
    'Principle Product Design',
    '417 Marion, Bei Jing\nChina',
    'Full Time',
    [
      "Creative with an eye for shape and colour",
      'Understand different materials and production methods',
      'How technical, practical and scientific knowledge and ability',
      'Interested in the way people choose and use products'
    ],
  ),

  Job(
    5,
    'Shell plc',
    'assets/images/shell_logo.png',
    'VP Business Intelegence',
    '50 Herminia Stravenue,\nCanada',
    'Full Time',
    [
      "Creative with an eye for shape and colour",
      'Understand different materials and production method',
      'How technical, practical and scientific knowledge',
      'Interested in the way people choose and use product'
    ],
  ),

  Job(
    6,
    'Toyota',
    'assets/images/toyota_logo.png',
    'Talent Acqusition Lead',
    '566 Eleamore Square,\nFrance',
    'Part Time',
    [
      "Creative with an eye for shape and colour",
      'Understand different materials and production methods',
      'How technical, practical and scientific knowledge and ability',
      'Interested in the way people choose and use products'
    ],
  ),

  Job(
    7,
    'Alibaba',
    'assets/images/alibaba_logo.png',
    'Principle Product Design',
    '466 Shun An, bei Jing\nChina',
    'Full Time',
    [
      "Creative with an eye for shape and colour",
      'Understand different materials and production methods',
      'How technical, practical and scientific knowledge and ability',
      'Interested in the way people choose and use products'
    ],
  ),

  Job(
    8,
    'Microsoft Corporation',
    'assets/images/microsoft_logo.png',
    'Principle Product Design',
    '466 Shun An, bei Jing\nChina',
    'Full Time',
    [
      "Creative with an eye for shape and colour",
      'Understand different materials and production methods',
      'How technical, practical and scientific knowledge and ability',
      'Interested in the way people choose and use products'
    ],
  ),
  Job(
    9,
    'Apple Inc',
    'assets/images/apple_logo.png',
    'Principle Product Design',
    '466 Shun An, bei Jing\nChina',
    'Full Time',
    [
      "Creative with an eye for shape and colour",
      'Understand different materials and production methods',
      'How technical, practical and scientific knowledge and ability',
      'Interested in the way people choose and use products'
    ],
  ),
];