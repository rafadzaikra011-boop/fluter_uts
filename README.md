# Food Order App

Flutter mobile app for the UTS onboarding and food order list tasks.

## Features

- Onboarding page with the title “All your favorites”, food illustration,
  description, NEXT button, and Skip link.
- Food order page displaying all four `dummyOrders` using `ListView.builder`.
- Done and Cancel actions update each order's status.

Food images load from Unsplash and show an icon placeholder if the device
cannot load an image.

## Run

```shell
flutter pub get
flutter run
```

Tap NEXT or Skip to open the order list.

## Test

```shell
flutter test
```
