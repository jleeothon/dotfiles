#/bin/sh
COMMIT=$1
[ -z $1 ] && COMMIT=HEAD
ALL=''
[ "$2" = 'all' ] && ALL='-a'
git commit $ALL --fixup $COMMIT
