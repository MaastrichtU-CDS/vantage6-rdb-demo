cd ./server/
git checkout -- containerFiles/default.sqlite
sh run.sh

cd ../maastro/
sh run.sh

cd ../mumc/
sh run.sh

cd ../researcher/python