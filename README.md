# My Flutter Project Structure

a project structure for a flutter app that use riverpod for state-management, auto-route for navigation and dio for api request
this structure is suitable for api based project , if we have also a local db create a folder for database and i prefer to use drift as it provide a good type-safety & auto-completion

## Getting Started

all the code is writted inside /lib/src
we have /localization for a 'arb' file
and /gen for a assest and font auto generate files

#### inside src we have

- main : any things that belongs to the complete app like route , material app and other
- shared: shared across the app
- screen: described below
- model folder: json model for the data
- dto folder: data transfer object for communacite with the api or other place (this a object used for sent/receive data not a real model)
- service: service for working with a plugin like image_picker or onesignal
- api: api client connection and also any api service

each service/api class must has a provider define in top of it

## presentation

in the folder we represent every screen or feature from the app we have as a folder
each folder could have 4 part (state,controller,page,widget) and we may also have other file if needed
any other code that is only related to this screen should be putted here too

- our state should be define using freezed package as a union type or single type

- our controller may be StateNotifier/StorageNotifier or any other class with a riverpod provider
  see setting_controller for example

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

we use flutter_gen to generate a static strong type interface for our assets and fonts

```dart
Assets.images.flutterLogo.image()
```

## Localization

This project generates localized messages based on arb files found in
the `lib/localization` directory.
read this article to learn more about this
https://lokalise.com/blog/flutter-i18n/

## Hydrated

we use StorageNotifier/StorageNotifierMixin to save any state data that we need it to be saved when the app closed like language and theme mode , see setting_controller for more info.
the code is writted inside /src/service/storage_service we implements hive and secure-storage , you could use any other package if you need

## routing

we use auto_route as it provide a strong type generator route and help parsing the argument too
see home_page, main/route.dart for example of using it

## ScriptRunner

we use script_runner for mange our script

so insted of writeing

`flutter packages pub run build_runner build  --delete-conflicting-outputs`

we write

`scr buildd`

see script_runner.yaml and https://pub.dev/packages/script_runner for more info
