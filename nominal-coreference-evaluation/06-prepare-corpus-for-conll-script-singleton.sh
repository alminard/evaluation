#!/bin/bash
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_apple/ --response corefgraph-conll-wikinews-singleton/corpus_apple/ --corpus singleton_apple_entities --method all
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_airbus/ --response corefgraph-conll-wikinews-singleton/corpus_airbus/ --corpus singleton_airbus_entities --method all
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_gm_chrysler_ford/ --response corefgraph-conll-wikinews-singleton/corpus_gm_chrysler_ford/ --corpus singleton_gm_chrysler_ford_entities --method all
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_stock_market/ --response corefgraph-conll-wikinews-singleton/corpus_stock_market/ --corpus singleton_stock_market_entities --method all