![](https://img.shields.io/badge/Microverse-blueviolet)

# RUBY CAPSTONE PROJECT: BASKETBALL REFERENCE SCRAPER

A scraper was built to get information from current NBA players recent performances from the most popular basketball database out there, https://www.basketball-reference.com/

### Main Objective

In this project, I built a scraper for a sports page database, the goal is check if I have gained mastery over the concepts learned throughout the Ruby block in Microverse, in particular, one of the requirements was to use a scraping library like Nokogiri.

## Scraper Instructions

To run the scraper run the following command in the terminal "ruby bin/main.rb", then follow the next steps:

1. Type the name of the current basketball player that you wish to get information from
2. If the name is not found (name should be as precise as possible since we are using the Watir gem for a automated browser experience), the program will ask you to type the name again (Or in case player is not found, you should type the name of another player)
3. From here you should let the automated browser do its work, it should take about 5 to 10 seconds to complete its extraction of information
4. After the Watir automated browser is done, you should get a report on your console of the player averages throughout the season, and his most recent performance
5. Afterwhich, you will get a final message describing the player recent performance (e.g if Stephen Curry is averaging 30 ppg throughout the season, and over the last 10 games he is averaging 35, the end report should tell you that he is playing very well right now)

## Built With

- Ruby
- Git workflow best practice
- Gem Rubocop
- Gem Nokogiri
- Gem Watir
- Github workflow practices to fix linter errors
- Rspec TDD

## Getting Started

To get a local copy of the repository please follow the next steps (Examples are shown using git bash, to install git bash go to https://git-scm.com/downloads and install according to the version of your computer):

- Go to the GitHub page where the repository is (Link example: https://github.com/mariordgez/Ruby_Scraper)

- On the repository page, click on the green code button

![](images\readmepic1.JPG)

- Then click on the paste icon to copy the clone link

![](images\readmepic2.JPG)

- If you have git bash installed, simply navigate to the folder where you want to copy the repository

- Once in the folder, right-click on the folder and select git bash here

- It should open a terminal window, to check that you are in the right place run the following command

```
$ ls
```

It should show the files that are in that folder

- After you verified that you are at the right place, run this command to clone the repository in your local machine

```
$ git clone https://github.com/mariordgez/Ruby_Scraper.git
```

This should create a clone of the repository in your desired folder, from there, just open the folder from your desired code editor to check, modify or test the code

#### Installing gems and webdriver

In order to run the scraper, there are some gems that need to be installed as well, to install gems you need to have ruby installed on your computer, to do that just go to https://www.ruby-lang.org/en/documentation/installation/ and download a version that suits your machine.

Once we have Ruby in our system, to install the gems you just have to execute "gem install 'gem_name'" in your command line e.g :

```
$ gem install 'nokogiri'
```

then

```
$ gem install 'watir'
```

and finally in case you dont have it

```
$ gem install 'rubocop'
```

Alternatively, you can install the gem bundler, and with the Gemfile in the project you can run the next lines of code to install the required gems

```
$ gem install 'bundler'
$ bundle install
```


Once you have your gems installed, you should check the webdriver for Watir, for this project we use google chrome so you should install the google chrome driver, you can find it here https://sites.google.com/a/chromium.org/chromedriver/downloads
Ensure that you are using the proper driver.
Once you have downloaded the proper driver, just put it somewhere in your $PATH (e.g /usr/local/bin/)

#### Run code

To run code and start the game, run "ruby bin/main.rb" from your terminal.

```
$ ruby bin/main.rb
```

#### Testing With Rspec

- Test cases have been written carefully to make sure the public methods works as expected
- From the Terminal run the command

```
$ rspec
```

And see all test pass.

## Authors

👤 **Mario Rodriguez**

- GitHub: [@mariordgez](https://github.com/mariordgez)
- Twitter: [@MarioRo75396624](https://twitter.com/MarioRo75396624)
- LinkedIn: [Mario](https://www.linkedin.com/in/mario-alberto-rodriguez-cota-a2860a205/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/DanSam5K/OOP-Tic-Tac-Toe-Game/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Project inspired by Microverse Program

## 📝 License

This project is [MIT](https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt) licensed.
