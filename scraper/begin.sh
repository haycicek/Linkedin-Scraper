#!/bin/bash

# Dosyaya kendine çalıştırma yetkisi ver
chmod +x "$0"

# Paket listesini güncelle
sudo apt-get update

# Chrome için gerekli bağımlılıkları yükle
sudo apt-get install -y wget unzip

# Google Chrome'u indir ve kur
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb

# ChromeDriver'ı indir ve kur
CHROME_DRIVER_VERSION=$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE)
wget -N https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo mv chromedriver /usr/local/bin/

# Gereksiz dosyaları temizle
rm google-chrome-stable_current_amd64.deb
rm chromedriver_linux64.zip

# ChromeDriver'a çalıştırma izni ver
sudo chmod +x /usr/local/bin/chromedriver

echo "Chrome ve ChromeDriver kurulumu tamamlandı!"
