import time
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from bs4 import BeautifulSoup
import csv

"""
Description:
	1. Read users' ID from a csv file
	2. Use Selenium and PhantomeJS to get the html of user's info page
	3. Use BeautifulSoup to extract the useful info
	4. Write users' info to a new csv file in utf-8-sig
Tips:
	1. Make sure you installed selenium and bs4 using pip
	2. Download PhantomJS from http://phantomjs.org and unzip it
	3. PhantomJS is only for imitate a browser
	4. For each page we have to wait for 2 seconds for loading
Modification When Use:
	1. Line 21: Path of phantomjs executable file, windows OS may call phantomjs.exe
	2. Line 30: You may changed the file where you store extracted data
	3. Line 33: Path of userid_15m_755k.csv
	4. Line 44: This code only grabs 10 users' info, grab more by changing this part
	5. Line 57, 79: Only for test, you can delete it
	6. Line 30, 91: See the running time, you can delete it
Author:
	Xiangyang (Shawn) Cui
Date:
	Oct 3, 2017
"""
def main():
	time_start = time.time()
	driver = webdriver.PhantomJS('./phantomjs-2.1.1-macosx/bin/phantomjs')
	driver.wait = WebDriverWait(driver, timeout=2)

	# This is the url of user's profile
	url1 = 'https://m.weibo.cn/p/index?containerid=230283'
	url2 = '_-_INFO&title=%25E5%259F%25BA%25E6%259C%25AC%25E4%25BF%25A1%25E6%2581%25AF&luicode=10000011&lfid=2302831752948260'
	
	# Prepare the csv file which stores data
	csvfile = open('usr_info.csv', 'w', newline='', encoding='utf-8-sig')
	# fieldnames = ['number', 'uid', 'nickname', 'gender', 'location', 'sex_orientation', 'relationship_status', ' birth_date', 'intro', 'register_date', 'company', 'school', 'weibo_level', 'credit']
	fieldnames = ['序号', '用户ID', '昵称', '性别', '所在地', '性取向', '感情状况', '生日', '简介', '注册时间', '公司', '学校', '等级', '阳光信用']
	writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
	writer.writeheader()

	# Open the userid_15m_755k.csv
	with open('userid_15m_755k.csv', 'r') as f:
		reader = csv.reader(f)		# Skip the header
		next(reader)
		
		i = 0						# i is for the number of uid
		for row in reader:
			uid = row[1]
			i += 1
			# Change this part to control how many users' info to grab
			if i > 10:
				break

			print(uid) 				### TEST ###

			row = dict([(key, '') for key in fieldnames]) # Initialize the dictionary to write
			row['序号'] = i 			# # of order
			row['用户ID'] = uid  	# uid

			# The whole url for user's profile page
			url = url1 + uid + url2
			driver.get(url)
			# Wait a second for the page loading 
			# Since the embedded <script> functions keep updating the page
			time.sleep(2)
			# Use BeautifulSoup to analyse
			html = BeautifulSoup(driver.page_source, 'html.parser')
			# Find info data we want
			for element in html.find_all('div', class_='box-left'):
				# Drop element's empty siblings 
				if element.find_next_sibling(class_='box-main m-box-col') == None:
					continue
				# When element's sibling is not empty
				key_str = element.string		# Field
				val_str = element.find_next_sibling(class_='box-main m-box-col').string 	# Value
				print(key_str, ':', val_str) 	### TEST ###
				
				if key_str in row:				# If the Field in our dictionary, store it
					row[key_str] = val_str

			writer.writerow(row)

	# !!! Close driver and csvfile !!!
	driver.quit()
	csvfile.close()
	# Print the running time
	print((time.time() - time_start))

if __name__ == '__main__':
	main()
