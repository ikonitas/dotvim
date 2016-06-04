# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import os
import subprocess
import sys

PROJECT_DIR = os.environ.get('PROJECT_DIR')
paths = ''

if PROJECT_DIR:
    for directory in sys.path:
        if os.path.isdir(directory) and not directory.startswith('/usr/lib'):
            paths += '{} '.format(directory)

    old_tag_path = '{}/.git/.tags'.format(PROJECT_DIR)
    if os.path.exists(old_tag_path):
        remove_command = ('rm {}/.git/.tags'.format(PROJECT_DIR))
        subprocess.Popen(remove_command, shell=True)

    command = (
        'ctags -R --fields=+l --languages=python --python-kinds=-iv -f '
        '{0}/.git/.tags {0} {1}'.format(PROJECT_DIR, paths)
    )
    sp = subprocess.Popen(
        command,
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        preexec_fn=os.setsid,
    )
