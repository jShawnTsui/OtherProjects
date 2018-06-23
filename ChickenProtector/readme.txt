{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf470
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 Main idea: users have to protect chicken from eagles.\
The original state: there only one chick and 0 score and 10 bullets at the beginning.\
When to end: the chicken number or bullet number is zero.\
Rules: When users shot down a eagle, they will get 1 point.\
	When users shot down a LuckyBag, they will get 10 extra bullets.\
	Another eagle will appear in 50ms.\
	Another LuckyBag will appear in 250ms.\
	Another Chicken will be hatched in 150ms.\
	If a LuckyBag fall out of the window, then it will never come back.\
\
The minimum features: 1: there should be a gun, eagles, chicken and lucky bags;\
	2: When a eagle hit a chick, a chick should disappear, but the eagle should remain;\
	3: When gun shot down an eagle, then that eagle should disappear but only that eagle, and score plus one;\
	4: When gun sot down a lucky bag, then that lucky bag should disappear, and bullet number plus 10;\
	5: When a lucky bag  fall out of the game window, it should never come back.\
\
Improvement: And if I also have more time,  I will set more levels, to make the eagles and chicken move in a more random way, since now they just move in a basically same direction before hit the borders. And in higher level, the eagles will move more faster.\
\
Notice: When I add the music in the game, the following errors will happen, although it won\'92t affect the operation of this game:\
	[id3.c:465] error: No comment text / valid description?\
	ERROR: /node/free: Node 27 not found\
And I googled it, it says that\'92s because there is something wrong with the music profiles. So it is not my fault and sorry I can\'92t find a better music source.\
}