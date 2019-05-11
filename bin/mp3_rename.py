#! /usr/bin/python3

import os
import re
import sys
import glob
args = sys.argv
if(len(args) != 2):
    print('The argument must be directory path')
    sys.exit(1)

##print('arg len is {0}'.format(len(args)))

##current_dir = os.getcwd()
target_dir = args[1]
if target_dir[len(target_dir)-1] != '/':
    target_dir = target_dir + '/'

pattern = target_dir + '*.mp3'

print('====print files in target directory====')
print('target directory: {}'.format(target_dir))

##for root, dirs, files in os.walk(target_dir):
##    [print(ele) for ele in files if re.match(pattern, ele)]
for i, ele in enumerate(glob.glob(pattern)):
    ##print('index: {:0=4}, name: {}'.format(i, ele))
    print('From: {}'.format(ele))
    print('To: ' + target_dir + '{:0=4}.mp3'.format(i))
    os.rename(ele, target_dir + '{:0=4}.mp3'.format(i))


print('Done!')




