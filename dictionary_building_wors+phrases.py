#!/usr/bin/env python
# coding: utf-8



import nltk
from nltk import word_tokenize
from nltk.stem import WordNetLemmatizer
from nltk.stem.porter import PorterStemmer
from nltk.corpus import stopwords
import string
from textblob import TextBlob
import polyglot
import pandas as pd


# read file
data = pd.read_csv("file.csv", error_bad_lines=False)
data


# get the text
text = data['body']
text = text.apply(str)



# change text to a list
text = ' '.join(text.tolist())
print(text)




# lowercase
text = text.lower()
print(text)




# tokenize
token1 = word_tokenize(text)
print(token1)




# stem
from nltk.stem.porter import PorterStemmer

porter_stemmer = PorterStemmer()

token=[]
for t in token1:
    c = porter_stemmer.stem(t)
    token.append(c)

print(token)





tags = nltk.pos_tag(token)
nouns = [word for word,pos in tags if (pos == 'NN' or pos == 'NNP' or pos == 'NNS' or pos == 'NNPS')
]





nouns_stopwords_filtered = [w for w in nouns if w not in stop_words]
len(nouns_stopwords_filtered)




# remove punctuations
# import string
nouns_stopwords_punc_filtered = [w for w in nouns_stopwords_filtered if w not in string.punctuation]
len(nouns_stopwords_punc_filtered)




# remove numbers
nouns_filtered = [w for w in nouns_stopwords_punc_filtered if not w.isdigit() ]
len(nouns_filtered)



nouns_filtered




noun_freq_dist_246 = nltk.FreqDist(nouns_filtered)




noun_freq_246 = noun_freq_dist_246.most_common(10000)
noun_freq_dict_246 = dict(noun_freq_246)




noun_wordfreq = pd.DataFrame({'word':noun_freq_dict_246.keys(),'freq':noun_freq_dict_246.values()})
pd.set_option('display.max_rows', None)
noun_wordfreq


noun_wordfreq.to_csv('noun_freq_dic.csv')






# # Phrase


#read file
data = pd.read_csv("file.csv", error_bad_lines=False)
# get the text
text = data['subject']
#text = text.apply(str)


text_str = TextBlob(str(text))


text_str.noun_phrases
phrase_list = pd.DataFrame(text_str.noun_phrases)
print(phrase_list)


pd.set_option('display.max_rows', None)
phrase_freq = pd.DataFrame(phrase_list[0].value_counts())
phrase_freq