# Flutter starter project

A new Flutter template to easily start a new project.

## Getting Started

- main : any things that belongs to the complete app like themeing , route , material app and other
- shared: shared across the app
- localization: localization
- screen: described below
- model folder: json model 
- service: service for connect to a plugin 
- api: api client connection and also any api service

 each service/api class must has a provider define in top of it


## Screen
in the folder we represent every screen we have as a folder
each folder could have 4 part (state,controller,page,widget) and we may also have other file if needed 
any other code that is only related to this screen should be putted here too

- our state should be define using freezed package as a union type or single type

- our controller should be a StateNotifier/HydratedStateNotifier with StateNotifierProvider 
see setting_controller for example

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.


we use flutter_gen to generate a static strong type interface for our assets
```dart
Assets.images.flutterLogo.image()
```

## Localization

This project generates localized messages based on arb files found in
the `lib/localization` directory.
read this article to learn more about this
https://lokalise.com/blog/flutter-i18n/

## Hydrated
we use HydratedStateNotifier to save any state data that we need it to be saved when the app closed like language and theme mode , see setting_controller for more info

## Storage and Caching 
we should try depens on HydratedStateNotifier,dio_cache_interceptor_hive_store for storage/caching if possible
or we use hive if needed

## routing
we use auto_route as it provide a strong type generator route and help parsing the argument too
see home_page, main/route.dart for example of using it

for argument passing we could use the following inside any provider

```dart
  final args = ref.read(appRouterProvider).current.argsAs<DetialsRouteArgs>();
```
see detials_controller for more info

also make sure that this controller used for the first time the current page in the same as the args used , 
or we could pass DetialsRouteArgs with family provider too

## ScriptRunner
we use script_runner for mange our script

so insted of writeing

`flutter packages pub run build_runner build  --delete-conflicting-outputs`

we write 

`scr buildd`

see script_runner.yaml and https://pub.dev/packages/script_runner for more info