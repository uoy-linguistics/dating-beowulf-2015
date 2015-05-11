CS = yes | java -classpath /home/aecay/projects/CS_Tony_oct19.jar csearch/CorpusSearch
NEW_CS = yes | java -classpath /home/aecay/projects/corpora/CS_2.003.04.jar csearch/CorpusSearch

input.out:
	cat ~/Dropbox/HistCorp/YCOE3_SP/*.psd > $@

cp-mat.out: input.out
	$(CS) ../queries/add-cp-mat.q input.out
	mv $<.out $@

cp-inf.out: cp-mat.out
	$(CS) ../queries/add-cp-inf.q $<
	mv $<.out $@

entire-corpus.out: cp-inf.out
	$(CS) ../queries/entire-corpus.q $< -out $@

all.cod: ../queries/features.c ../queries/conj.c entire-corpus.out
	$(CS) ../queries/features.c entire-corpus.out -out features.cod
	$(CS) ../queries/conj.c features.cod -out conj.cod
	mv conj.cod $@

all.cod.ooo: all.cod
	$(NEW_CS) ../queries/only-coding.q $<
	../scripts/fix-ids.py $@
