rm -rf ./diff
mkdir -p expected diff
rm -f report.json
rm -f report.html
reg-cli ./actual ./expected ./diff -A -R ./report.html -J ./report.json -C 8