#!/usr/bin/zsh

#xinput list
#xinput list-props 13

# if [ ! -z $1 ] 
# then 
#     : TRACKPAD=$1
# else
#     : TRACKPAD=12
# fi

TRACKPAD=13
echo $TRACKPAD

xinput set-prop $TRACKPAD 292	1
xinput set-prop $TRACKPAD 294	1
xinput set-prop $TRACKPAD 296	0
xinput set-prop $TRACKPAD 298	1, 0
xinput set-prop $TRACKPAD 300	1
xinput set-prop $TRACKPAD 302	1
xinput set-prop $TRACKPAD 305	1, 0, 0
xinput set-prop $TRACKPAD 307	1, 1
xinput set-prop $TRACKPAD 308	1, 0
xinput set-prop $TRACKPAD 310	0
xinput set-prop $TRACKPAD 312	0.785461
xinput set-prop $TRACKPAD 317	1

