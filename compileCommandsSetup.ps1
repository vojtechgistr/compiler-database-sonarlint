Param (
    [string]$entryPointFile = "main",
    [string]$extraPath = ""
)

$pathREPLACE = (Get-Location).Path + "\" + $extraPath
$commandREPLACE = "g++ " + $entryPointFile + ".cpp -o " + $entryPointFile
$fileREPLACE = $entryPointFile + ".cpp"

Write-Output "Invoking request to generate compile_commands.json file..."

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/DaRealAdalbertBro/compiler-database-sonarlint/main/files/compile_commands.json" -OutFile "./compile_commands.json"

Write-Output "Replacing data in compile_commands.json file..."

(Get-Content -path "./compile_commands.json" -Raw) -replace 'REPLACE_PATH', $pathREPLACE -replace "REPLACE_COMMAND", $commandREPLACE -replace "REPLACE_FILE", $fileREPLACE -replace "\\", "/" | Set-Content -Path "./compile_commands.json"



# check if visual studio code is installed
if (Get-Command code -ErrorAction SilentlyContinue) {
    Write-Output "Setting up Visual Studio Code..."
    code .
    
    Write-Output "Setting up SonarLint extension..."

    # check if sonarlint extension is installed
    if (Get-Command code -ErrorAction SilentlyContinue) {

        # check if sonarlint extension is installed
        if (Get-Command code -ErrorAction SilentlyContinue) {
            code --install-extension SonarSource.sonarlint-vscode
            Write-Output "SonarLint extension installed."
        }
        
        Write-Output "Done! You can now use SonarLint to analyze your code."
    }
}
