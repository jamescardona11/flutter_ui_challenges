const moviesJSON = [
  {
    "id": 889737,
    "original_title": "Joker: Folie à Deux",
    "poster_path": "https://image.tmdb.org/t/p/w500/aciP8Km0waTLXEYf5ybFK5CSUxl.jpg",
    "genres": [],
    "overview":
        "While struggling with his dual identity, Arthur Fleck not only stumbles upon true love, but also finds the music that's always been inside him.",
    "release_date": "2024-10-01",
    "original_language": "en",
    "vote_average": 5.8,
    "status": null,
    "popularity": 622.722,
    "isFavorite": false
  },
  {
    "id": 912649,
    "original_title": "Venom: The Last Dance",
    "poster_path": "https://image.tmdb.org/t/p/w500/k42Owka8v91trK1qMYwCQCNwJKr.jpg",
    "genres": [],
    "overview":
        "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.",
    "release_date": "2024-10-22",
    "original_language": "en",
    "vote_average": 7.1,
    "status": null,
    "popularity": 2138.723,
    "isFavorite": false
  },
  {
    "id": 917496,
    "original_title": "Beetlejuice Beetlejuice",
    "poster_path": "https://image.tmdb.org/t/p/w500/kKgQzkUCnQmeTPkyIwHly2t6ZFI.jpg",
    "genres": [],
    "overview":
        "After a family tragedy, three generations of the Deetz family return home to Winter River. Still haunted by Betelgeuse, Lydia's life is turned upside down when her teenage daughter, Astrid, accidentally opens the portal to the Afterlife.",
    "release_date": "2024-09-04",
    "original_language": "en",
    "vote_average": 7.212,
    "status": null,
    "popularity": 1175.487,
    "isFavorite": false
  },
  {
    "id": 933260,
    "original_title": "The Substance",
    "poster_path": "https://image.tmdb.org/t/p/w500/lqoMzCcZYEFK729d6qzt349fB4o.jpg",
    "genres": [],
    "overview":
        "A fading celebrity decides to use a black market drug, a cell-replicating substance that temporarily creates a younger, better version of herself.",
    "release_date": "2024-09-07",
    "original_language": "en",
    "vote_average": 7.3,
    "status": null,
    "popularity": 2847.597,
    "isFavorite": false
  },
  {
    "id": 945961,
    "original_title": "Alien: Romulus",
    "poster_path": "https://image.tmdb.org/t/p/w500/b33nnKl1GSFbao4l3fZDDqsMx0F.jpg",
    "genres": [],
    "overview":
        "While scavenging the deep ends of a derelict space station, a group of young space colonizers come face to face with the most terrifying life form in the universe.",
    "release_date": "2024-08-13",
    "original_language": "en",
    "vote_average": 7.269,
    "status": null,
    "popularity": 3297.462,
    "isFavorite": false
  },
  {
    "id": 957452,
    "original_title": "The Crow",
    "poster_path": "https://image.tmdb.org/t/p/w500/58QT4cPJ2u2TqWZkterDq9q4yxQ.jpg",
    "genres": [],
    "overview":
        "Soulmates Eric and Shelly are brutally murdered when the demons of her dark past catch up with them. Given the chance to save his true love by sacrificing himself, Eric sets out to seek merciless revenge on their killers, traversing the worlds of the living and the dead to put the wrong things right.",
    "release_date": "2024-08-21",
    "original_language": "en",
    "vote_average": 5.8,
    "status": null,
    "popularity": 565.819,
    "isFavorite": false
  },
  {
    "id": 889737,
    "original_title": "Joker: Folie à Deux",
    "poster_path": "https://image.tmdb.org/t/p/w500/aciP8Km0waTLXEYf5ybFK5CSUxl.jpg",
    "genres": [],
    "overview":
        "While struggling with his dual identity, Arthur Fleck not only stumbles upon true love, but also finds the music that's always been inside him.",
    "release_date": "2024-10-01",
    "original_language": "en",
    "vote_average": 5.8,
    "status": null,
    "popularity": 622.722,
    "isFavorite": false
  },
  {
    "id": 912649,
    "original_title": "Venom: The Last Dance",
    "poster_path": "https://image.tmdb.org/t/p/w500/k42Owka8v91trK1qMYwCQCNwJKr.jpg",
    "genres": [],
    "overview":
        "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.",
    "release_date": "2024-10-22",
    "original_language": "en",
    "vote_average": 7.1,
    "status": null,
    "popularity": 2138.723,
    "isFavorite": false
  },
  {
    "id": 917496,
    "original_title": "Beetlejuice Beetlejuice",
    "poster_path": "https://image.tmdb.org/t/p/w500/kKgQzkUCnQmeTPkyIwHly2t6ZFI.jpg",
    "genres": [],
    "overview":
        "After a family tragedy, three generations of the Deetz family return home to Winter River. Still haunted by Betelgeuse, Lydia's life is turned upside down when her teenage daughter, Astrid, accidentally opens the portal to the Afterlife.",
    "release_date": "2024-09-04",
    "original_language": "en",
    "vote_average": 7.212,
    "status": null,
    "popularity": 1175.487,
    "isFavorite": false
  },
  {
    "id": 933260,
    "original_title": "The Substance",
    "poster_path": "https://image.tmdb.org/t/p/w500/lqoMzCcZYEFK729d6qzt349fB4o.jpg",
    "genres": [],
    "overview":
        "A fading celebrity decides to use a black market drug, a cell-replicating substance that temporarily creates a younger, better version of herself.",
    "release_date": "2024-09-07",
    "original_language": "en",
    "vote_average": 7.3,
    "status": null,
    "popularity": 2847.597,
    "isFavorite": false
  },
  {
    "id": 945961,
    "original_title": "Alien: Romulus",
    "poster_path": "https://image.tmdb.org/t/p/w500/b33nnKl1GSFbao4l3fZDDqsMx0F.jpg",
    "genres": [],
    "overview":
        "While scavenging the deep ends of a derelict space station, a group of young space colonizers come face to face with the most terrifying life form in the universe.",
    "release_date": "2024-08-13",
    "original_language": "en",
    "vote_average": 7.269,
    "status": null,
    "popularity": 3297.462,
    "isFavorite": false
  },
  {
    "id": 957452,
    "original_title": "The Crow",
    "poster_path": "https://image.tmdb.org/t/p/w500/58QT4cPJ2u2TqWZkterDq9q4yxQ.jpg",
    "genres": [],
    "overview":
        "Soulmates Eric and Shelly are brutally murdered when the demons of her dark past catch up with them. Given the chance to save his true love by sacrificing himself, Eric sets out to seek merciless revenge on their killers, traversing the worlds of the living and the dead to put the wrong things right.",
    "release_date": "2024-08-21",
    "original_language": "en",
    "vote_average": 5.8,
    "status": null,
    "popularity": 565.819,
    "isFavorite": false
  }
];
