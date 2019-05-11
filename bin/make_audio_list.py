#! /usr/bin/python3

import os
import sys
import glob
import json

def main():
    args = sys.argv
    if len(args) != 3:
        print('Usage:\n')
        print('arg1: directory path\n')
        print('arg2: output file name\n')
        sys.exit(1)

    target_dir = args[1]
    if target_dir[len(target_dir)-1] != '/':
        target_dir = target_dir + '/'
    target_f = target_dir + '*.mp3'

    output_f = args[2]
    print("===Start Making File List===")
    print("target directory: {}".format(target_dir))
    print("ourput file name: {}".format(output_f))

    dict = {}
    list = []

    for i, ele in enumerate(glob.glob(target_f)):
        path = r'./audio/' +  os.path.split(ele)[1]
        ##print(path)
        list.append({'id': '{:0=4}'.format(i), 'path': path})

    ##print(['id', '{:0=4}'.format(100), 'path', r'.\/path\/a.mp3'])
    dict = {'audios': list}
    ##print(dict)
    ##str = json.JSONEncoder().encode(dict)
    ##replacedStr = str.replace('\\\\', '\\')
    ##print(str)
    ##print(str.replace('\\\\', '\\'))
    ##print(target_dir + output_f)

    with open(target_dir + output_f, 'w') as f:
        json.dump(dict, f, indent='\t')

    ##with open(target_dir + output_f, 'w') as g:
    ##    json.
    print('Done!')

if __name__=='__main__':
    main()
