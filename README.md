# bs_assignment

A new Flutter project.

## Build With

### Built With
- [Flutter 3.16.4 (channel stable)](https://docs.flutter.dev/get-started/install)
- [Java 11.0.17 2022-10-18 LTS](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)
- [Kotlin 1.7.21](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)
- [Swift-driver version 5.9](https://www.swift.org/download/)
    
Additional Package Used
- [GETX](https://pub.dev/packages/get)

## Getting Started
This project is a starting point for a Flutter application.
[Repository link](https://gitlab.com/rizvyahamed91221/bs_assignment.git)
<br>
To get a local copy up and running follow these steps.
#### Prerequisites
-   Flutter Sdk version: >=3.2.3 <4.0.0 ,recommended  3.16.4
-   Java version: >=11.0.1 <21.0.1 , recommended 11.0.17
-   Kotlin version: 1.7.21
-   Swift version: 5.9

#### Installation

1. Clone the repo
    ```sh
    ssh: git clone https://gitlab.com/rizvyahamed91221/bs_assignment.git
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

