#!/bin/bash
URL=http://github.com/beeman/profile.sh/tree/master/
WRKDIR=~/.myprofile
BACKUP=$WRKDIR/backup

mkdir -p $BACKUP
cd $WRKDIR
echo Downloading profile files...

FILES=(.bashrc .vimrc .bash_aliases .toprc .screenrc .profile)
for FILE in ${FILES[@]}
do
	echo wget "$URL$FILE?raw=true" -O $FILE -q
	#if [ -e $FILE ] 
	#echo Downloaded $FILE to $WRKDIR... 
	#then
#		if [ -e ~/$FILE ];
#		then
#			echo Moving $FILE to $BACKUP...
#			mv -f  ~/$FILE* $BACKUP/
#		fi
#		cp -v $FILE ~/
#	fi
#	echo Done...
done
cd
#dircolors -p > .dircolors
#. .bashrc
