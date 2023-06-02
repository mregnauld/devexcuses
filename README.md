# Dev Excuses

Excuses de développeur

# Installation

Afin de pouvoir tester l'application sur Android comme sur iOS, les étapes suivantes devront se faire sur Mac.

## Mettre en place l'environnement

1. Installer le [SDK Flutter](https://docs.flutter.dev/get-started/install/macos#get-sdk)
2. Installer [Android Studio](https://developer.android.com/studio)
3. Installer Xcode depuis le store d'application de MacOS
4. Lancer Android Studio, puis aller dans le menu `Android Studio > Settings > Plugins`
5. Installer les plugins Dart, Flutter et Flutter Intl

## Lancer l'application

1. Depuis le terminal, lancer : `git clone https://github.com/mregnauld/devexcuses.git`
2. Lancer Android Studio et ouvrir le projet Dev Excuses
3. Brancher un appareil Android et / ou iOS
4. Choisir l'appareil sur lequel lancer l'application en haut de l'interface, dans la liste déroulante
5. Lancer le projet :
    - en cliquant sur la flèche verte pour un test en mode debug
    - en allant dans le menu `Run > Flutter Run 'main.dart' in Release Mode` pour un test en mode release

## Description et fonctionnement

- La première page de l'application permet d'appeller un back-end qui renvoit une excuse aléatoire.
- La seconde page, accessible via le bouton '+' de l'app bar, permet d'ajouter une nouvelle excuse en appelant une seconde API de ce même back-end.
