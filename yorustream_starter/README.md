# YoruStream starter

Flutter starter for a personal anime catalog and a player that can play authorized video sources.

## Build with GitHub Actions

1. Create a new repository on GitHub.
2. Upload the contents of this ZIP into the repository root, preserving the `.github/workflows/` folder.
3. Commit and push to the `main` branch.
4. Open the repository's **Actions** tab.
5. Run **Build YoruStream APK** manually, or push a change to a watched path.
6. Open the successful workflow run and download the `yorustream-release-apk` artifact.

## Important

- The workflow generates the Android platform folder with `flutter create` before building, so the starter ZIP does not need checked-in generated Android wrapper files.
- Jikan provides anime metadata, not video streams.
- The player screen uses a public sample video solely to test playback.
- Replace the sample with local videos or URLs from providers that permit playback in your app.
- Do not commit API secrets, signing keys, or passwords.
