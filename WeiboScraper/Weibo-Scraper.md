# Weibo Scraper

## Description:  
1. Read users' ID from a csv file
2. Use Selenium and PhantomeJS to get the html of user's info page
3. Use Selenium to extract the useful info: age, follow#, follower#, post#, relationship status, profile photo
4. Write users' info to a new csv file, 'usr_info.csv', in utf-8
5. Save users' profile photos in ./profile_photos folder

## Difficulties:
* Since Weibo web pages use JavaScript functions to load content, the traditional request module doesn't work. But Selenium won't scrap a web page until the condition you set becomes true.
* It's time-consuming, so next time, I properly use Java thread pool to implement this program.

## Notice:  
* I did this project when I was a volunteer in World Well-Being Project at the University of Pennsylvania.  
* I only scrapped users' public information.
* All data I received and scrapped was used only for academic purpose. 