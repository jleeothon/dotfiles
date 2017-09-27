#/bin/sh
COMMIT=$1
[ -z $1 ] && COMMIT=HEAD
ALL=''
[ 'all' = $2 ] && ALL='-a'
git commit $ALL --fixup $COMMIT
