# CineHub-App

CineHub is the ultimate movies app for film enthusiasts and casual moviegoers alike that uses [The Movies Database (TMDB)](https://www.themoviedb.org/) API. With a world of entertaining at your fingertips, CineHub offers an extensive collection of now playing, popular, and top rated movies, carefully curated to provide you with the best viewing options. You can easily discover new movies to watch and enjoy. With features such as detailed movie information, CineHub makes it easy to find your next favorite movie.

## Contents

- [Preview](#preview)
- [App Structure](#app-structure)
- [Features](#features)
- [Getting Started](#getting-started)

## Preview

<div style="display: flex">
<img style="display: inline-block" src="https://github.com/ahmedghaly15/Social-App/assets/108659381/e99413c9-14dd-4b50-86f4-1efa440eaaca" />

<img style="display: inline-block" src="https://github.com/ahmedghaly15/Social-App/assets/108659381/0e159026-265e-4a56-8276-93d228451ad6" />
</div>

https://github.com/ahmedghaly15/Social-App/assets/108659381/544dbb20-7b19-49aa-9716-7cbdecdd0d25

## App Structure

```
lib
├── core
│   ├── components
│   ├── errors
│   ├── global
│   ├── network
│   ├── usecases
│   └── utils
│
├── movies
│   ├── data
│   │   ├── datasource
│   │   ├── models
│   │   └── repository
│   │
│   ├── domain
│   │   ├── entities
│   │   ├── repository
│   │   └── usecases
│   │
│   ├── presentation
│   │   ├── components
│   │   ├── controllers
│   └───└── screens
│
└── main.dart

```

## Features

- `Now Playing Movies`: Users can view a list of movies that are currently playing in theaters.
- `Popular Movies`: Users can browse a list of popular movies based on recent trends and ratings.
- `Top Rated Movies`: Users can view a list of movies with the highest ratings on the app.
- `Movie Details Screen`: Users can access detailed information about a movie, and some other movies related to this movie.

## Getting Started

This project is an entertaining app, provides movies to enjoy the user.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
