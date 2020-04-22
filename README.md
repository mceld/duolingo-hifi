# duolingo-hifi

This project is part of an RIT design project and analysis for ISTE 264 
(Prototyping and Usability Testing) hosted at this 
[site.](https://people.rit.edu/~lwm2120/ISTE264/projectSite)  More 
information on the premises and technologies developed prior to this 
prototype can be found there.

## Installing and running this app

1. Install [NodeJS](https://nodejs.org/en/download/)
2. Install [Git](https://git-scm.com/)
3. Install `gulp` (`npm install -g gulp-cli`)
3. Download or clone the [framer boilerplate](https://github.com/joetheday/framer-boilerplate)
4. Download or clone this repository
5. Replace the contents of the `app` folder in the framer boilerplate with the contents of this project
6. Replace the contents of the `images` folder in the framer boilerplate with the contents of the images folder found in this project
7. Move `npm-shrinkwrap.json` into the root of the framer boilerplate and run `npm install` in this directory
8. Run `gulp` in the same directory and navigate to `localhost:3000` in your browser, the app should be running.

#### Notes from the boilerplate for additional reference

This project was developed using FramerJS.  You can use the 
[boilerplate](https://github.com/joetheday/framer-boilerplate) to run this app by replacing the contents of the `app` directory with the contents of this project, and replacing the `images` directory with the one in this project. The documentation for running the Framer boilerplate with `npm` and `gulp` 
can be found below and the documentation for each 
framer module can be found under `modules/documentation.md`


#### framer-boilerplate
A boilerplate FramerJS project that uses Gulp for live reload and CoffeScript transpilation + Browserify to include modules.

This project uses the boiler plate from [joetheday/framer-boilerplate](https://github.com/joetheday/framer-boilerplate)

#### Before starting

1. Install [NodeJS](https://nodejs.org/en/download/)
2. Install [Git](https://git-scm.com/)

#### Get started

- Run `npm install` from the project folder. This will install all the required dependencies
- Run `gulp`. If you have not installed it: `npm install -g gulp-cli`
- Open `http://localhost:3000` in a browser (Edge, Chrome, Firefox, etc...)
- Start working in `app/app.coffee`. Any changes on the Framer code will refresh the browser

#### Additional Information

Documentation for the boilerplate can be found in the README at [https://github.com/joetheday/framer-boilerplate](https://github.com/joetheday/framer-boilerplate) if the above information does not help with your installation.  Additional information on creating submodules and using CoffeeScript with Framer Studio can also be found in the same README.

