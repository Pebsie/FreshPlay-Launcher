# FreshPlay Launcher
## Introduction
This is an open source software launcher designed to be used for video games. It will be used for all official FreshPlay titles. It is designed to be easily adaptable and changeable.
## Licensing
This software is available open source under a CC 4.0 license. You may reuse this code in any manner you wish (even commercially) provided you do not alter the FreshPlay watermark within the software.
## Usage
The only things that you need to edit are ui.lua and settings.lua, everything else need only be altered in special circumstances.
### UI
ui.lua is used for changing the way that the launcher looks. You can make any modifications you wish here without impacting how the launcher runs, with the exception of the attributeFP() function which must remain untouched.
### Settings
The options in settings.lua have comments that explain their function. You must have a webserver set up that is accessible to the public, and a folder for the launcher to download contents from. The product.logo setting is an image that is downloaded and displayed on the launcher, the product.version file is what is used to determine when an update is available and product.news is what is displayed as text "news" on the launcher.
