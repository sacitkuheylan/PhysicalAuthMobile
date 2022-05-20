# Welcome to PhysicalAuth Mobile Application Repo!
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)  ![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white) ![IOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white) 
<p align="center">
  <img width="250" height="250" src="https://i.ibb.co/3zzNH99/Physical-Auth-Logo50.png"  title="PhysicalAuth Logo">
</p>


Hi! :wave: Thank you for your interest in **PhysicalAuth**. This page contains information about how to set up and use Mobile Application for **PhysicalAuth**

:hourglass:Expected Setup Time :  **10 Minutes**


:warning:**Disclaimer**: This project is still in development and in alpha phase, not all features are available at the moment. General information about **PhysicalAuth** project is available at [PhysicalAuth Main Repository](https://www.github.com/sacitkuheylan/PhysicalAuth)

**Expected beta relase date: :date: 20.05.2022**

# Table of Contents

 - [About Mobile Application](#about-mobile-application)
 - [Requirements](#requirements)
 - [Getting Ready](#getting-ready)
 - [Gallery](#gallery)
 - [Contribution](#contribution)
 - [LICENSE](#license)



# About Mobile Application
This mobile application is required to connect **PhysicalAuth** hardware. With this application, you can;

 - **List** saved secretKeys to your device
 - **Add** new secretKey to your device
 - **Update** secretKey details from your device
 - **Delete** your old and not used secretKeys

This application only works when you are connected to same network with your device. As your device is set to be isolated in Local Area Network (LAN) remote access is not possible.

This application is basically a communication device between you and your hardware and it acts like a **REST** Client.

# Requirements
The requirements are much more less than hardware side :smile:
All you need is an Android or iOS device that can connect to internet.

Mobile application is developed using **Flutter** to provide cross-platform support.

# Getting Ready
Currently the application is at development phase and it is not available through Google Play Store or App Store. It is planned to be live on Google Play Store initially. If you don't want to wait, you can clone this project and build project. With this way you will have access to version alpha.


# Gallery
<p align="center" href="https://ibb.co/Vj2DCGX"><img width="290" height="633" src="https://i.ibb.co/WxgFzXS/s2.png" alt="s2" border="0"></p>

> Welcome screen, you need to enter the IP Address located on OLED Screen of device. After writing IP Address you can press button on device to start operation

<p align="center" href="https://ibb.co/fQSpk4b"><img width="290" height="633" src="https://i.ibb.co/54bTH0Q/Simulator-Screen-Shot-i-Phone-13-2022-05-20-at-11-06-02.png" alt="s3" border="0"></p>

> This is the Main Menu screen, from here you can select options to operate your device. These options are;
	 - List Your Registered Tokens
	 - Add New Token
	 - Delete Previously Registered Tokens
	 
<p align="center" href="https://ibb.co/fQSpk4b"><img width="290" height="633" src="https://i.ibb.co/QXcNPrZ/s3.png" alt="s3" border="0"></p>

> List of all registered tokens on device

<p align="center" href="https://ibb.co/fQSpk4b"><img width="290" height="633" src="https://i.ibb.co/QXcNPrZ/s3.png" alt="s3" border="0"></p>

> List of all registered tokens on device

<p align="center" href="https://ibb.co/fQSpk4b"><img width="290" height="633" src="https://i.ibb.co/R0xfw76/Simulator-Screen-Shot-i-Phone-13-2022-05-20-at-11-06-10.png" alt="s3" border="0"></p>

> From this page, you can add new tokens to your device. There are 3 fields has to be filled. They are;
	 - Name: The name you want to give your token
	 - Secret Key: Base64 Encoded Secret Key given by application or website
	 - Digit Count: This is generally 6 by default but some applications or websites require 8 digits.

<p align="center" href="https://ibb.co/fQSpk4b"><img width="290" height="633" src="https://i.ibb.co/ZSVHmJX/Simulator-Screen-Shot-i-Phone-13-2022-05-20-at-11-06-20.png" alt="s3" border="0"></p>

>From this page, you can enter the id of the token to remove from your device

# Contribution
Everybody who is passionate about developing information security and also software is welcome to make contributions. You can open a pull request and write a summary about your contribution.

# LICENSE
[Mobile Application MIT License](https://github.com/sacitkuheylan/PhysicalAuthMobile/blob/master/LICENSE)
