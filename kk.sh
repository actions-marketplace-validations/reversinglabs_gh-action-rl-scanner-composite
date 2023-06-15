export NN="v1"
export VV="$NN.0.2"
git add . ;
git commit -a -m "$VV" ;
git push ;

git push --delete origin $NN
git tag -d $NN

git tag -m "$NN" $NN ;
git tag -m "$VV" $VV ;

git push --tags
