CS = yes | java -classpath ../../../CS-2.002.21.jar csearch/CorpusSearch
NEW_CS = yes | java -classpath /home/aecay/projects/corpora/CS_2.003.04.jar csearch/CorpusSearch

input.out:
	cat ~/Dropbox/HistCorp/YCOE3_SP/*.psd > $@
	sed -i -e 's/(IP\(.*\)-PRN/(IP\1-PAREN/' $@

first-cut.out: input.out
	$(CS) ../../queries/first-cut.q $< -out $@

first-cut1.cmp: first-cut.out
	$(CS) ../../queries/first-cut1.q $<
	mv ../../queries/first-cut1.out .
	mv ../../queries/first-cut1.cmp .

coding.cod: first-cut1.cmp
	$(CS) ../../queries/coding.c     $<            -out coding.cod

coding-ip.cod: coding.cod
	$(CS) ../../queries/coding-ip.c  coding.cod    -out coding-ip.cod

coding-vp.cod: coding-ip.cod
	$(CS) ../../queries/coding-vp.c  coding-ip.cod -out coding-vp.cod

coding-sb.cod: coding-vp.cod
	$(CS) ../../queries/coding-sb.c  coding-vp.cod -out coding-sb.cod

final.cod: coding-sb.cod
	$(CS) ../../queries/coding-sbj.c coding-sb.cod -out coding-sbj.cod
	mv coding-sbj.cod $@

final.cod.ooo: final.cod
	$(NEW_CS) ../../queries/only-coding.q $<
	../../scripts/fix-ids.py $@
