echo tex
find . -name '*.tex' | wc -l

echo c
find . -name '*.c' | wc -l

echo cpp
find . -name '*.cpp' | wc -l

echo lst
find . -name '*.lst' | wc -l

echo asm
find . -name '*.asm' | wc -l

echo s
find . -name '*.s' | wc -l

echo png
find . -name '*.png' | wc -l

echo lines in all TeX files:
find . -name '*.tex' | xargs wc -l

