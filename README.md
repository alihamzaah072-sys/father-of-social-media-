# Father of Social Media — Flutter starter

This is the first UI prototype for the Android app.

## What works in this starter
- Demo sign-in entry (no real account is created)
- Bottom navigation between Home, Explore, Create, Messages and Profile
- Sample social posts and story bubbles
- Like toggle on sample posts
- Demo creator dashboard

## What is not connected yet
- Real login / registration
- Database or cloud storage
- Real photo/video uploads or playback
- Private messaging
- Push notifications
- Payments or marketing orders

## Run on a computer with Flutter installed
1. Install Flutter and Android Studio.
2. Extract this project.
3. In this folder run `flutter pub get`.
4. Connect an Android phone with USB debugging enabled or start an emulator.
5. Run `flutter run`.

## Beginner note
This starter is source code, not an installable APK. A Flutter build environment is required to compile it.


## Build an installable Android APK using GitHub Actions

This starter includes a GitHub Actions workflow at
`.github/workflows/build-apk.yml`. After the project files are uploaded to
the `main` branch of your GitHub repository, GitHub Actions will generate
a release APK in the workflow run.

On GitHub mobile/web:
1. Open your repository and choose the **Actions** tab.
2. Open **Build Android APK** and wait for the run to finish.
3. Open the successful run, find **Artifacts**, and download
   `father-of-social-media-apk`.
4. Extract the downloaded ZIP to get `app-release.apk`.

This workflow compiles the current demo app. It does not add real accounts,
cloud database, video hosting, private messaging, payments, or an SMM backend.
Those features require separate implementation and service configuration.
