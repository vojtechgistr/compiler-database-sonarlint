# compiler-database-sonarlint
If you use MingW for C++ compilation, you can use this script to generate the compile_commands.json file.


## Usage:
``.\compileCommandsSetup.ps1 <FILE NAME> <EXTRA PATH>``

## Example:
1. Place the `compileCommandsSetup.ps1` file in the root folder:

```
Root Folder/
├── .vscode/
│   ├── settings.json
├── src/
│   ├── myCppFileMain.h
│   ├── myCppFileMain.cpp
│   ├── otherCppFiles.cpp
├── **compileCommandsSetup.ps1**
```

<br />

2. Open PowerShell in the root folder and run it:

``.\compileCommandsSetup.ps1 main src/``

- `myCppFileMain` - this is the name of your cpp file, without the cpp file extension
- `src/` -this is another parameter added to the project root path, in this example we need to add `src/` because our cpp file is there.

<br />

3. Now check the root folder!

```
Root Folder/
├── .vscode/
│   ├── settings.json
├── src/
│   ├── myCppFileMain.h
│   ├── myCppFileMain.cpp
│   ├── otherCppFiles.cpp
├── **compile_commands.json**
├── compileCommandsSetup.ps1
```

4. After opening the Visual Studio code, open the command palette using `CTRL+SHIFT+P` and enter the run command `SonarLint: Configure the compilation database for C and C++ analysis`

![image](https://user-images.githubusercontent.com/56306485/205445866-a46064f5-b307-451f-bd54-3890bf7d4a18.png)


Why did I do this? I don't know. You can check the official documentation on [how to create a compilation database](https://github.com/SonarSource/sonarlint-vscode/wiki/C-and-CPP-Analysis#generate-a-compilation-database).
