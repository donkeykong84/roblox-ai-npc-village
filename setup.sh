#!/bin/bash
echo "🚀 Roblox AI NPC Village Setup Starting..."

# Update system
sudo apt update && sudo apt upgrade -y

# Install desktop, xrdp, and tools
sudo apt install -y xfce4 xfce4-session xfce4-goodies xfce4-terminal xrdp flatpak

# Setup Flatpak and Vinegar (for Roblox Studio)
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub org.vinegarhq.Vinegar

# Create easy login user
sudo adduser --disabled-password --gecos "" remoteuser
echo "remoteuser:password123" | sudo chpasswd
sudo usermod -a -G sudo remoteuser

# Fix desktop session
echo "xfce4-session" | sudo tee /home/remoteuser/.xsession
sudo chown remoteuser:remoteuser /home/remoteuser/.xsession

# Start xrdp
sudo systemctl enable --now xrdp
sudo systemctl restart xrdp

echo "✅ Setup Complete!"
echo ""
echo "How to connect:"
echo "1. Open Windows Remote Desktop"
echo "2. Computer: YOUR_DROPLET_IP"
echo "3. Username: remoteuser"
echo "4. Password: password123"
echo ""
echo "Once inside, open Terminal and run:"
echo "flatpak run org.vinegarhq.Vinegar"
echo "Then click 'Install Studio'"
