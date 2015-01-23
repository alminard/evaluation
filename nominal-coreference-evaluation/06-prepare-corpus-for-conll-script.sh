#!/bin/bash
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_apple/ --response corefgraph-conll-wikinews/corpus_apple/ --corpus muc_apple_entities --method muc
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_airbus/ --response corefgraph-conll-wikinews/corpus_airbus/ --corpus muc_airbus_entities --method muc
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_gm_chrysler_ford/ --response corefgraph-conll-wikinews/corpus_gm_chrysler_ford/ --corpus muc_gm_chrysler_ford_entities --method muc
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_stock_market/ --response corefgraph-conll-wikinews/corpus_stock_market/ --corpus muc_stock_market_entities --method muc
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_apple/ --response corefgraph-conll-wikinews/corpus_apple/ --corpus ceafe_apple_entities --method ceafe
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_airbus/ --response corefgraph-conll-wikinews/corpus_airbus/ --corpus ceafe_airbus_entities --method ceafe
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_gm_chrysler_ford/ --response corefgraph-conll-wikinews/corpus_gm_chrysler_ford/ --corpus ceafe_gm_chrysler_ford_entities --method ceafe
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_stock_market/ --response corefgraph-conll-wikinews/corpus_stock_market/ --corpus ceafe_stock_market_entities --method ceafe
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_apple/ --response corefgraph-conll-wikinews/corpus_apple/ --corpus bcub_apple_entities --method bcub
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_airbus/ --response corefgraph-conll-wikinews/corpus_airbus/ --corpus bcub_airbus_entities --method bcub
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_gm_chrysler_ford/ --response corefgraph-conll-wikinews/corpus_gm_chrysler_ford/ --corpus bcub_gm_chrysler_ford_entities --method bcub
java -cp coreference-evaluation-1.0-SNAPSHOT-jar-with-dependencies.jar eu.newsreader.script.MakeScoreScript --key gold-standard/corpus_stock_market/ --response corefgraph-conll-wikinews/corpus_stock_market/ --corpus bcub_stock_market_entities --method bcub