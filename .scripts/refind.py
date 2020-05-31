#!python3

import sys
import re
import argparse
import os
from os.path import isdir, join

def get_filenames(path, recursive):
    if recursive:
        for (dirpath, dirnames, filenames) in os.walk(path):
            for f in filenames:
                yield dirpath, f
            for f in dirnames:
                yield dirpath, f + "/"
    else:
        for f in os.listdir(path):
            if isdir(join(path, f)):
                yield path, f + "/"
            else:
                yield path, f
    

def process_files(path, regex, rename, recursive):
    matcher = re.compile(regex)
    for dirpath, filename in get_filenames(path, recursive):
        match = matcher.search(filename)
        if match:
            if rename:
                new_name = rename.format(*match.groups())
                os.rename(join(dirpath, filename), join(dirpath, new_name))
            else:
                print(join(dirpath, filename))
        

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
            description="Select and rename files with Python regexs",
            epilog='Example: refind -r "^(.*)\.txt$" --rename "{0}.foo"'
            )
    parser.add_argument("regex", metavar="REGEX",
            help="The Python regex to match files with")
    parser.add_argument("-r", "--recursive", action="store_true",
            help="Whether or not to recursively search sub-directories.")
    parser.add_argument("--rename", type=str,
            help="Format string to rename matched files to. Use {n} for the nth capture group of the regex")
    args = parser.parse_args()

    process_files(".", args.regex, args.rename, args.recursive)

