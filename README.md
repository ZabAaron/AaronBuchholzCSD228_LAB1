# Mobile Programming With Flutter

#### TL;DR
This course is intended to be a hands on experience for novice developers. From design guidelines to hands on testing to feature development and documentation; it will attempt to provide comprehensive coverage of the mobile landscape along with best practices with regards to Flutter development. 

Within `Lectures` you will find a series of `packages` each representing core concepts. The order in which they are to be exercised can be found within the root [`pubspec`](./pubspeck.yaml). Contained within each are tests in which the student / developer are to either implement functionality for, correct bugs, and provide a way to earn feedback automatically in the form of CI (GitHub Actions).

> [!Warning]
> This project makes some assumptions on things like CI/CD. Since this is built to be personal teaching material and GitHub is the hosting source it made sense to leverage GitHub actions. It has been targeted at leveraging the cheapest costs for the students / developer by leveraging linux runners. For those looking to leverage macOS runners can do so but there is a cost associated with it and a runner has not been provided as my personal device is a macbook. 

# Introduction

This course is structured to given students at the Canadian College level a hands on experience at mobile software development. The project has been structured to leverage Dart's workspace functionality to help give students a real world example of what a complex project could be, while still breaking down a foundational (and potentially complex) concept. To provide a consistent learning experience the students are provided with a predefined flutter `devcontainer` and `dockerfile` image. This will allow the students to hit the ground running and only requiring docker (or podman) and an IDE that supports it (both VS Code & Jetbrains IDEs / Intellij support this OOB).
