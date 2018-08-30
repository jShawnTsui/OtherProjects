from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from urllib import request
import csv
"""
Description:
    1. Read users' ID from a csv file
    2. Use Selenium and PhantomeJS to get the html of user's info page
    3. Use Selenium to extract the useful info: age, follow#, follower#, post#, relationship status, profile photo
    4. Write users' info to a new csv file, 'usr_info_02.csv', in utf-8
    5. Save users' profile photos in ./profile_photos folder
Prerequistes:
    1. Make sure you installed Selenium using pip
    2. Download PhantomJS from http://phantomjs.org and unzip it
    3. Changed path of csv files and phantomjs executable file
    4. Build a profile_photos folder in the same folder of this python file
Modification When Use:
    1. Line 32: Path of phantomjs executable file, windows OS may call phantomjs.exe
    2. Line 33: You may changed the file where you store extracted data
    3. Line 40: Path of userid_15m_755k.csv or other csv file has uid
    4. Line 49: This code only grabs 10 users' info, grab more by changing this part
    5. Line 96: Show how many users we have crawled so far
Author:
    Xiangyang (Shawn) Cui
Date:
    Oct 3, 2017
"""
def main():
    driver = webdriver.PhantomJS('./phantomjs-2.1.1-macosx/bin/phantomjs')
    csvfile = open('usr_info.csv', 'w', newline='', encoding='utf-8')
    fieldnames = ['uid', 'age', 'relationship_status', 'follow_num', 'follower_num', 'post_num', 'has_img']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()

    relationship_status = {'单身': 1, '求交往': 2, '暗恋中': 3, '暧昧中': 4, '恋爱中': 5, '订婚': 6, '已婚': 7, '分居': 8, '离异': 9, '丧偶':10}

    with open('userid_15m_755k.csv', 'r') as f:
        reader = csv.reader(f)      # Skip the header
        next(reader)

        i = 0                       # i is for the number of uid
        for row in reader:
            uid = row[1]
            i += 1
            # Change this part to control how many users' info to grab
            if i > 10:
                break
            # This is data we wre going to save
            line = dict([(key, '') for key in fieldnames])
            line['uid'] = uid
            line['has_img'] = 0

            url = 'http://weibo.com/p/100505' + uid + '/info?mod=pedit'
            driver.get(url)
            # Wait for the page loading 
            try:
                element = WebDriverWait(driver, 2, 0.1).until(
                    EC.presence_of_element_located((By.XPATH, '//*[@id="Pl_Official_PersonalInfo__58"]/div[1]/div/div[2]/div/ul/li[span[1]/text()=\'注册时间：\']/span[2]'))
                )
            except TimeoutException:
                pass

            birthdays = driver.find_elements_by_xpath('//*[@id="Pl_Official_PersonalInfo__58"]/div[1]/div/div[2]/div/ul/li[span[1]/text()=\'生日：\']/span[2]')
            if birthdays:
                birthday = birthdays[0].text.strip()
                if len(birthday) > 7:
                    line['age'] = 2014 - int(birthday[:4])

            relations = driver.find_elements_by_xpath('//*[@id="Pl_Official_PersonalInfo__58"]/div[1]/div/div[2]/div/ul/li[span[1]/text()=\'感情状况：\']/span[2]')
            if relations:
                line['relationship_status'] = relationship_status[relations[0].text.strip()]

            img = driver.find_elements_by_xpath('//*[@id="Pl_Official_Headerv6__1"]/div/div/div[2]/div[1]/p/img')
            if img:
                src = img[0].get_attribute('src')
                if 'default' not in src:
                    line['has_img'] = 1
                    request.urlretrieve(src,'./profile_photos/' + uid + '.jpg')

            follows = driver.find_elements_by_xpath('//*[@id="Pl_Core_T8CustomTriColumn__54"]/div/div/div/table/tbody/tr/td[1]/a/strong')
            if follows:
                line['follow_num'] = follows[0].get_attribute('textContent')

            followers = driver.find_elements_by_xpath('//*[@id="Pl_Core_T8CustomTriColumn__54"]/div/div/div/table/tbody/tr/td[2]/a/strong')
            if followers:
                line['follower_num'] = followers[0].get_attribute('textContent')

            posts = driver.find_elements_by_xpath('//*[@id="Pl_Core_T8CustomTriColumn__54"]/div/div/div/table/tbody/tr/td[3]/a/strong')
            if posts:
                line['post_num'] = posts[0].get_attribute('textContent')

            writer.writerow(line)
            # If you want to save it to disk immediately, write the following command:
            # csvfile.flush()
            print('Finished Users Number: ', i)

    driver.quit()
    csvfile.close()

if __name__ == '__main__':
    main()
