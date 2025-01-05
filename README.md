## APK DOWNLOAD

[APK](https://github.com/RIZVY91221/easy_course/blob/main/file/app-release.apk?raw=true)

## SCREEN
[SCREEN1](https://github.com/RIZVY91221/easy_course/blob/main/file/image/Screen1.jpeg?raw=true)
[SCREEN2](https://github.com/RIZVY91221/easy_course/blob/main/file/image/Screen2.jpeg?raw=true)
[SCREEN3](https://github.com/RIZVY91221/easy_course/blob/main/file/image/Screen3.jpeg?raw=true)
[SCREEN4](https://github.com/RIZVY91221/easy_course/blob/main/file/image/Screen4.jpeg?raw=true)
[SCREEN5](https://github.com/RIZVY91221/easy_course/blob/main/file/image/Screen5.jpeg?raw=true)

<table>
  <tr>
    <td>Splace</td>
     <td>Login</td>
     <td>Home</td>
     <td>Create Post</td>
     <td>Comment</td>
  </tr>
  <tr>
    <td><img src="https://github.com/RIZVY91221/easy_course/blob/main/file/image/Screen1.jpeg?raw=true" width=270 height=480></td>
    <td><img src="https://github.com/RIZVY91221/easy_course/blob/main/file/image/Screen2.jpeg?raw=true" width=270 height=480></td>
    <td><img src="https://github.com/RIZVY91221/easy_course/blob/main/file/image/Screen3.jpeg?raw=true" width=270 height=480></td>
    <td><img src="https://github.com/RIZVY91221/easy_course/blob/main/file/image/Screen4.jpeg?raw=true" width=270 height=480></td>
    <td><img src="https://github.com/RIZVY91221/easy_course/blob/main/file/image/Screen5.jpeg?raw=true" width=270 height=480></td>
  </tr>
 </table>


[![Watch the video](https://asciinema.org/a/113463.png)](https://drive.google.com/file/d/1R8VPGffDRQQZCzpRejxM4OU2ak9Ygw8j/view)


# EASY COURSE

A new Flutter project.

## Build With

### System
- [Flutter 3.24.5 (channel stable)](https://docs.flutter.dev/get-started/install)
- [Java 11.0.17 2022-10-18 LTS](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)
- [Kotlin 2.0.0](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)
- [Swift-driver version 5.9](https://www.swift.org/download/)
    
Additional Package Used
- [GETX](https://pub.dev/packages/get)

## Getting Started
This project is a starting point for a Flutter application.
[Repository link](https://github.com/RIZVY91221/easy_course.git)
<br>
To get a local copy up and running follow these steps.
#### Prerequisites
-   Flutter Sdk version: >=3.5.4 <4.0.0 ,recommended  3.24.5
-   Java version: >=11.0.1 <21.0.1 , recommended 11.0.17
-   Kotlin version: 2.0.0
-   Swift version: 5.9

#### Installation

1. Clone the repo
    ```sh
    ssh: git clone https://github.com/RIZVY91221/easy_course.git
    ```
2. Environment Setup
    - Create `.env` file cp `.env.example` to `.env `
    - Can update flavor `DEV`,`PROD`,`STAGING`

3. Install dependencies
     ```sh
    ssh: flutter pub get
    ```
4. Run
    - Connect emulator or real device
    - `flutter run`

5. Start development!


#### Available Scripts
- In the project directory, you can run with using flavor:

  `flutter build apk --dart-define=FLAVOR=PROD`

- In project uses `inject` library, If face any conflict run this cmd :

  `flutter packages pub run build_runner build --delete-conflicting-outputs`

- or watch command in order to keep the source code synced automatically:

  `flutter packages pub run build_runner watch`

- In project create data model using terminal:

  `flutter packages pub run build_runner build ` or if face any conflict run `flutter packages pub run build_runner build --delete-conflicting-outputs`

