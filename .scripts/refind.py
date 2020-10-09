#!python3

import sys
import re
import argparse
import os
from os.path import isdir, join


def bool_input(prompt):
    while True:
        response = input(prompt + " [y/n]: ").lower().strip()
        if response == "y" or response == "yes":
            return True
        if response == "n" or response == "no":
            return False


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


def get_file_renames(path, regex, rename, recursive):
    matcher = re.compile(regex)
    for dirpath, filename in get_filenames(path, recursive):
        path = join(dirpath, filename)
        match = matcher.search(path)
        if match:
            if rename:
                new_path = rename.format(*match.groups())
                yield path, new_path
            else:
                yield path


def process_files(path, regex, rename, recursive, preview):
    files = get_file_renames(path, regex, rename, recursive)

    if not rename:
        for filepath in files:
            print(filepath)
        return

    if preview:
        from itertools import chain, islice

        if preview > 0:
            to_preview = islice(files, preview)
        else:
            to_preview = files

        previewed = []
        for old_name, new_name in to_preview:
            print(old_name, "=>", new_name)
            previewed.append((old_name, new_name))

        to_rename = chain(previewed, files)

        should_commit = bool_input("Commit rename operations?")

        if not should_commit:
            return
    else:
        to_rename = files

    for old_name, new_name in to_rename:
        os.rename(old_name, new_name)


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
    parser.add_argument("--preview", type=int, metavar="N",
        nargs="?", const=-1, default=False,
            help="Preview the frist n renames before commiting. If no number is given, all will be previewed.")
    args = parser.parse_args()

    process_files(".", args.regex, args.rename, args.recursive, args.preview)
