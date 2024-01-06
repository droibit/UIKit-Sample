# UIKit Sample App Template
Template repository for UIKit sample app with SPM generated by [XcodeGen](https://github.com/yonaskolb/XcodeGen).

### Requirements
- Xcode 15+.
- [Mint](https://github.com/yonaskolb/Mint#installing) installed.

### Generate a sample app

First, update the project name in the `Makefile`.

```diff
-PROJECT_NAME := SampleApp
+PROJECT_NAME := YOUR_PROJECT_NAME
```

Next, run the following commands to generate the project for the sample app.

```bash
make bootstrap
make gen-project
make open-project
```