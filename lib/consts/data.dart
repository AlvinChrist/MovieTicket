final List<List<List<int>>> seat = List.generate(
    3,
    (index) => List.generate(
        7, (index) => List.generate(6, (index) => 0, growable: false),
        growable: false));
final List<String> row = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
List<Map<String, dynamic>> tickets = [];
List<Map<String, dynamic>> movieDesc = [
  {
    'img': 'assets/images/uncharted.jpg',
    'title': 'Uncharted',
    'desc':
        'Street-smart Nathan Drake is recruited by seasoned treasure hunter Victor "Sully" Sullivan to recover a fortune amassed by Ferdinan Maggelan, and lost 500 years ago by the House of Moncada',
    'director': ['Ruben Fleischer'],
    'genre': ['Action', 'Adventure'],
    'writer': ['Rafe Judkins'],
    'bookmark': false,
    'starring': [
      {
        'name': 'Tom Holland',
        'characterName': 'Nate',
      },
      {'name': 'Mark Wahlberg', 'characterName': 'Victor Sullivan'},
      {'name': 'Sophia Ali', 'characterName': 'Chloe Frazer'},
      {'name': 'Tati Gabrielle', 'characterName': 'Braddrock'},
      {'name': 'Antonio Banderas', 'characterName': 'Santiago Mocanda'},
    ]
  },
  {
    'img': 'assets/images/fb3.jpg',
    'title': 'Fantastic Beast The Secrets of Dumbledore',
    'desc':
        'Professor Albus Dumbledore knows the powerful, dark wizard Gellert Grindelwald is moving to seize control of the wizarding world. Unable to stop him alone, he entrusts magizoologist Newt Scamander to lead an intrepid team of wizards and witches. They soon encounter an array of old and new beasts as they clash with Grindelwald\'s growing legion of followers.',
    'genre': ['Adventure', 'Family', 'Fantasy'],
    'director': ['David Yates'],
    'writer': ['JK Rowling', 'Steve Kloves'],
    'bookmark': false,
    'starring': [
      {
        'name': 'Eddie Redmayne',
        'characterName': 'Newt Scamander',
      },
      {'name': 'Jude Law', 'characterName': 'Albus Dumbledore'},
      {'name': 'Ezra Miller', 'characterName': 'Credence Barebone'},
      {'name': 'Dan Fogler', 'characterName': 'Jacob Kowalski'},
      {'name': 'Mads Mikkelsen', 'characterName': 'Gellert Grindewald'},
      {'name': 'Katherine Waterston', 'characterName': 'Tina Goldstein'},
      {'name': 'Alison Sudol', 'characterName': 'Queenie Goldstein'}
    ]
  },
  {
    'img': 'assets/images/dr_strange.jpg',
    'title': 'Doctor Strange in the Multiverse of Madness',
    'desc':
        'Dr. Stephen Strange casts a forbidden spell that opens the doorway to the multiverse, including alternate versions of himself, whose threat to humanity is too great for the combined forces of Strange, Wong, and Wanda Maximoff.',
    'genre': ['Action', 'Adventure', 'Fantasy'],
    'director': ['Sam Raimi'],
    'writer': ['Michael Waldron', 'Stan Lee', 'Steve Dikto'],
    'bookmark': false,
    'starring': [
      {
        'name': 'Benedict Cumberbatch',
        'characterName': 'Dr. Stephen Strange',
      },
      {'name': 'Elizabeth Olsen', 'characterName': 'Wanda Maximoff'},
      {'name': 'Chiwetel Ejiofor', 'characterName': 'Karl Mordo'},
      {'name': 'Benedict Wong', 'characterName': 'Wong'},
      {'name': 'Xochitl Gomez', 'characterName': 'America Chavez'},
      {'name': 'Michael Stuhlbarg', 'characterName': 'Nikodemus West'},
      {'name': 'Rachel McAdams', 'characterName': 'Christine Palmer'},
      {'name': 'Patrick Stewart', 'characterName': 'Charles Xavier'},
      {'name': 'Julian Hilliard', 'characterName': 'Billy Maximoff'},
      {'name': 'Jett Klyne', 'characterName': 'Tommy Maximoff'}
    ]
  }
];
Map<String, dynamic> movieCategories = {
  for (var item in movieDesc.expand((d) => d['genre']).toSet())
    item.toString(): false
};
