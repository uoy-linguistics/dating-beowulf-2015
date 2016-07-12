CS = yes | java -classpath ../CS-2.002.21.jar csearch/CorpusSearch
NEW_CS = yes | java -classpath ../CS_2.003.04.jar csearch/CorpusSearch

.PHONY: all

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

coding.cod: ../queries/coding.c first-cut1.cmp
	$(CS) $^ -out $@

coding-ip.cod: ../queries/coding-ip.c coding.cod
	$(CS) $^ -out $@

coding-vp.cod: ../queries/coding-vp.c coding-ip.cod
	$(CS) $^ -out $@

coding-sb.cod: ../queries/coding-sb.c coding-vp.cod
	$(CS) $^ -out $@

coding-sbj.cod: ../queries/coding-sbj.c coding-sb.cod
	$(CS) $^ -out $@

final.cod: ../queries/coding-vtoc.c coding-sbj.cod
	$(CS) $^ -out $@

final.cod.ooo: final.cod
	$(NEW_CS) ../queries/only-coding.q $< -out $@
	../scripts/fix-ids.py $@

coding-gen.out: ../queries/coding-gen.q first-cut1.cmp
	$(CS) $^ -out $@

coding-gen.cod: ../queries/coding-gen.c coding-gen.out
	$(CS) $^ -out $@

coding-gen.cod.ooo: coding-gen.cod
	$(NEW_CS) ../queries/only-coding.q $<
	../scripts/fix-ids.py $@

coding-cprel.out: ../queries/coding-cprel.q first-cut1.cmp
	$(CS) $^ -out $@

coding-cprel.cod: ../queries/coding-cprel.c coding-cprel.out
	$(CS) $^ -out $@

coding-cprel.cod.ooo: coding-cprel.cod
	$(NEW_CS) ../queries/only-coding.q $<
	../scripts/fix-ids.py $@

all: final.cod.ooo coding-cprel.cod.ooo coding-gen.cod.ooo
