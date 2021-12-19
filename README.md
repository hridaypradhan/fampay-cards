# Fampay Cards

GitHub Externship 2021 Frontend Extern Assignment for Fampay.

## Getting Started

This project was made using Flutter, as approved by the Fampay mentor on Discord.
  Language: Dart
  State management: Provider

## Features

- All tap-to-launch links have been handled
- The API call is made at app launch using the http package.
- When you long-press an HC3 card (this may take a couple attempts depending on the render speed on your device), it slides to the right revealing the menu
  - Press 'remind later' to temporarily remove it from view
  - Press 'dismiss now' to permanently remove it.
- Swipe to refresh brings back all temporarily removed cards
- All the elements used have been divided into smaller widgets in their own files
- constants such as global widgets, colors etc are in their own folder. 
- To change the URL, change the constant url variable in home_screen.dart
- Types of cards:
  - HC1/Small Display Card: Shows Title, Description, Icon 
  - HC3/Big Display Card: Shows Title, bg image, all functional CTAs, description.
  - HC5/Image Card: These fit the image's height and expand to ocuppy maximum width.
  - HC6/Small Card With Arrow: Similar to small display card, but without the description and with a trailing arrow.
  - HC9/Dynamic Width Card: Show the color/gradient provided and are sized according to the image provided.
- Whenever details like text color, background color or gradient are not provided, default values are used.
- Scrollability is checked and implemented according to the value found.
- The app has been made to be able to scroll vertically as well, to suit smaller displays
