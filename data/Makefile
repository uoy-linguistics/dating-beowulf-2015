CS = yes | java -classpath ../CS-2.002.21.jar csearch/CorpusSearch
NEW_CS = yes | java -classpath ../CS_2.003.04.jar csearch/CorpusSearch

input.out:
	cat ../corpus/*.psd > $@
	sed -i -e 's/(IP\(.*\)-PRN/(IP\1-PAREN/' $@

root.out: ../queries/root.q input.out
	$(CS) $^ -out $@

sub.out: ../queries/sub.q input.out
	$(CS) $^ -out $@

sub-q.cmp: ../queries/sub-q.q sub.out
	$(CS) $^
	rm ../queries/sub-q.out
	mv ../queries/sub-q.cmp .

sub-ip.out: ../queries/sub-ip.q sub-q.cmp
	$(CS) $^ -out $@

first-cut.out: ../queries/first-cut.q root.out sub-ip.out
	$(CS) $^ -out $@

first-cut1.cmp: ../queries/first-cut1.q first-cut.out
	$(CS) $^
	rm ../queries/first-cut1.out
	mv ../queries/first-cut1.cmp .

coding.cod: first-cut1.cmp
	$(CS) ../queries/coding.c     $<            -out coding.cod

coding-ip.cod: coding.cod
	$(CS) ../queries/coding-ip.c  coding.cod    -out coding-ip.cod

coding-vp.cod: coding-ip.cod
	$(CS) ../queries/coding-vp.c  coding-ip.cod -out coding-vp.cod

coding-sb.cod: coding-vp.cod
	$(CS) ../queries/coding-sb.c  coding-vp.cod -out coding-sb.cod

coding-sbj.cod: coding-sb.cod
	$(CS) ../queries/coding-sbj.c coding-sb.cod -out coding-sbj.cod

final.cod: coding-sbj.cod
	$(CS) ../queries/coding-vtoc.c $< -out $@

final.cod.ooo: final.cod
	$(NEW_CS) ../queries/only-coding.q $< -out $@
	../scripts/fix-ids.py $@

coding-gen.out: first-cut1.cmp
	$(CS) ../queries/coding-gen.q $< -out $@

coding-gen.cod: coding-gen.out
	$(CS) ../queries/coding-gen.c $< -out $@

coding-gen.cod.ooo: coding-gen.cod
	$(NEW_CS) ../queries/only-coding.q $<
	../scripts/fix-ids.py $@

coding-cprel.out: first-cut1.cmp
	$(CS) ../queries/coding-cprel.q $< -out $@

coding-cprel.cod: coding-cprel.out
	$(CS) ../queries/coding-cprel.c $< -out $@

coding-cprel.cod.ooo: coding-cprel.cod
	$(NEW_CS) ../queries/only-coding.q $<
	../scripts/fix-ids.py $@
