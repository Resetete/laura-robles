# README

This is the development code of website of Musician Laura Robles. The website will go live under laura-robles.com.

The development version of the website: https://laura-robles-rails-7-app.herokuapp.com/
The production version: [https://lauraroblesmusic.com](https://www.lauraroblesmusic.com/)

## Functionality

For the user, enjoy the content :) It is a website multi-language page, where you can switch between English, Spanish and German (partly done with `I18n`, partly stored in db.

For the admin, AKA musician Laura,
she is able to log into an admin area where she can modify the content of the texts. She can store several text versions and decide which one should be active. Validations ensure that there is always exactly one active text in the db. The different language versions are stored in a json field in the table.

![About section with admin actions](https://github.com/Resetete/laura-robles/blob/1d3c9fb37f2fe43ef9b830a99ae17862da297387/app/assets/images/readme/about-content.png?raw=true "About section with admin actions")
![Create new content](https://github.com/Resetete/laura-robles/blob/1d3c9fb37f2fe43ef9b830a99ae17862da297387/app/assets/images/readme/create-new-about-content.png?raw=true "Create new content")


The admin area allows to upload, edit and view:
- videos that are displayed in the video player
- news section to create and manage news articles (kind of a blog), with embedded social media
- create and manage project descriptions; the admin can change the project image and add a sample audio

For the file storage, I use ActiveStorage and Dropbox. For such a small project, I didn't want to create an AWS account and I decided to go with a smaller scale service. I use an updated version of the [activestorage-dropbox gem](https://github.com/Resetete/activestorage-dropbox).

## Design
I designed the website from scratch. The illustrations are exclusively drawn by [Rodrigo La Hoz](https://rodrigolahoz.tumblr.com/) form Peru (Copyright! Do not download/copy those images and use somewhere else, Thanks!).

Laura, wanted a black and white website, which is not clean, but chaotic. She also wants to connect the art by Rodrigo La Hoz with her music and each of her projects. For this reason, most of the elements and objects are overlapping (of course I aim on maintaining readability ;) ), crooked and bent.
I am using [parallax.js](http://matthew.wagerfield.com/parallax/) for some moving images to create a some playful effect. For mobile phones, the effect wasn't working trustfully correct enough and thus I use a fallback with CSS animations.

The website is responsive for mobile phones and desktops. Due to lack of time, I didn't (yet) implement responsiveness for medium sized devices like tablets.