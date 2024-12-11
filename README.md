Downloading and Installing BCFreightAPP on Windows and macOS
This guide provides step-by-step instructions on how to download and install the BCFreightAPP from GitHub on both Windows and macOS.
GitHub Repository: https://github.com/DemecosChambers/BCFreightAPP

Prerequisites
Windows: PowerShell, Node.js and npm (installed via Chocolatey)
macOS: Terminal, Node.js and npm (installed via Homebrew)
I. Downloading the Files
1. Download the ZIP file:
Go to the GitHub repository: https://github.com/DemecosChambers/BCFreightAPP
Click the "Code" button (green button).
Select "Download ZIP".


2. Extract the ZIP file:
Windows: Right-click the downloaded ZIP file and select "Extract All...". Choose a destination folder for the extracted files (e.g., C:\BCFreightAPP).
macOS: Double-click the downloaded ZIP file. It will automatically extract to a folder with the same name in the same location.
Example:

II. Installing the App
Windows
1. Install Chocolatey (if not already installed):
Open PowerShell as administrator.
Run the following command:

PowerShell


Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))



2. Install Node.js and npm:
In PowerShell, run:

PowerShell


choco install nodejs -y



3. Navigate to the project directory:
In PowerShell, use the cd command to navigate to the directory where you extracted the files.

PowerShell


cd C:\BCFreightAPP 



4. Install dependencies:
Run the following command in PowerShell:

PowerShell


npm install



5. Run the app:
In PowerShell, run:

PowerShell


node index.js



6. Verify the application:
Open a web browser and go to http://localhost:3000. You should see the freight load information form.
Example:

macOS
1. Install Homebrew (if not already installed):
Open Terminal.
Paste the following command and press Enter:

Bash


/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


Example:

2. Install Node.js and npm:
In Terminal, run:

Bash


brew install node


3. Navigate to the project directory:
In Terminal, use the cd command to navigate to the directory where you extracted the files.

Bash


cd /path/to/BCFreightAPP


4. Install dependencies:
Run the following command in Terminal:

Bash


npm install


5. Run the app:
In Terminal, run:

Bash


node index.js


6. Verify the application:
Open a web browser and go to http://localhost:3000. You should see the freight load information form.
Example:

This completes the installation process for BCFreightAPP on both Windows and macOS. You can now start using the application to submit freight load information.
Sources
1. https://github.com/appliedsciencegroup/raspberry-pi-cybersecurity-intro
