CS = yes | java -classpath /home/aecay/projects/CS_Tony_oct19.jar csearch/CorpusSearch

input.out:
	cat ~/Dropbox/HistCorp/YCOE3_SP/*.psd > $@

cp-mat.out: input.out
	$(CS) ../queries/add-cp-mat.q input.out
	mv $<.out $@

cp-inf.out: cp-inf.out
	$(CS) ../queries/add-cp-inf.q $<
	mv $<.out $@

entire-corpus.out: cp-inf.out
	$(CS) ../queries/entire-corpus.q $< -out $@

features.cod: ../queries/features.c entire-corpus.out
	$(CS) $^ -out $@

features.cod.ooo: features.cod
	$(CS) ../queries/only-coding.q $<
	sed -i -e 's/@/:/' $@
