#! /usr/bin/env python

from __future__ import print_function
import sys
from itertools import product
import yaml


def create_single_command(options):
    command = 'conda build -q '

    if 'python' in options:
        command += '--python %s ' % (options['python'])
    if 'numpy' in options:
        command += '--numpy %s ' % (options['numpy'])
    command += options['recipe_dir']

    if options['platform'].startswith('win'):
        command = '%CMD_IN_ENV% ' + command
        if 'python' in options:
            prefix = 'SET PYTHON_VERSION=%s.x\r\n' % (options['python'])
            command = prefix + command
    return command


def print_commands_for_target(data, target_platform):

    for key, value in data.items():
        if not isinstance(value, list):
            data[key] = [value]

    for i in (dict(zip(data, x)) for x in product(*data.values())):
        if i['platform'] == target_platform:
            command = create_single_command(i)
            print(command)


if __name__ == "__main__":


    yaml_file = sys.argv[1]
    target_platform = sys.argv[2]

    if target_platform.startswith('win'):
        print('ECHO ON')
    for data in  yaml.load_all(open(yaml_file, 'r')):
        print_commands_for_target(data, target_platform)
