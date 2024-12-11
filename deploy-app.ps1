# Install Chocolatey (package manager) if not already installed
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
  Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Update Chocolatey
choco upgrade chocolatey

# Install Node.js and npm using Chocolatey
choco install nodejs -y

# Create the app directory (if it doesn't exist)
$appDir = "C:\inetpub\freight-app"
if (!(Test-Path -Path $appDir)) {
  mkdir $appDir
}

# Copy the app files to the instance (with overwrite)
Copy-Item -Path * -Destination $appDir -Recurse -Force

# Change to the app directory
cd $appDir

# Install app dependencies
npm install

# Start the Node.js app in the background
Start-Process node -ArgumentList "index.js" -WorkingDirectory $appDir