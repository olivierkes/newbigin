

./notice.sh > biblio_newbigin.bib


sed -n '/@comment/q;p' ../biblio_newbigin.bib | \
	sed -e s/tmpLU//g | \
	sed -e s/tmpFIXME//g | \
	sed -e s/tmpALIRE//g \
	>> biblio_newbigin.bib

jabref -o biblio_newbigin_preview.html,tablerefsabsbib -n true biblio_newbigin.bib


git add biblio_newbigin.bib biblio_newbigin_preview.html
git commit -m "$1"

git push origin master
git push github master


#undo last commit: git reset --soft HEAD^


#
# Remotes: 
# * origin: gitorious
# * github: github
# * git push {origin|github} master