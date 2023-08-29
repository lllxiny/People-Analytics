# NLP

This Python script reads and preprocesses text data, performs tokenization and stemming, filters nouns, calculates noun frequencies, extracts noun phrases, and conducts frequency analysis on noun phrases. The results are organized in DataFrames and saved to CSV files.

1. **Libraries**: Python NLTK, TextBlob, polyglot, and Pandas.

2. **Tokenization**:
   - CSV file as input data.
   - Tokenization is performed using NLTK's `word_tokenize` function, and stemming is applied to the tokens using Porter Stemmer.

3. **Stemming, Stopwords and numbers removal, nouns filtering**:
   - NLTK's `pos_tag` is used to tag the stemmed tokens with their parts of speech (POS).
   - Nouns (NN, NNP, NNS, NNPS) are filtered from the tagged tokens.
   - Stop words are removed from the list of filtered nouns.
   - Punctuation and numbers are removed from the list of nouns.

4. **Frequency Analysis of Nouns**:
   - The frequency distribution of the remaining filtered nouns is calculated using NLTK's `FreqDist`.
   - The most common 10,000 nouns are selected and stored in a dictionary.

5. **Extracting Noun Phrases and Frequency Analysis**:
   - Use TextBlob to extract noun phrases.

