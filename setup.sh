#!/bin/bash
echo "🚀 Quick setup for Roblox AI NPC Village"
sudo apt update && sudo apt install -y xfce4 xfce4-session xrdp flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub org.vinegarhq.Vinegar
echo "remoteuser:password123" | sudo chpasswd
echo "xfce4-session" > /home/remoteuser/.xsession
sudo chown remoteuser:remoteuser /home/remoteuser/.xsession
sudo systemctl restart xrdp
echo "✅ Ready! Connect with remoteuser / password123"
