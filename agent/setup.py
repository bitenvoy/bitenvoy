#!/usr/bin/env python

from setuptools import find_packages
from setuptools import setup
from setuptools_behave import behave_test

DESCRIPTION = ('Quite available code dispatch tool.')
with open('README.rst') as f:
    LONG_DESCRIPTION = f.read()

install_requires = []

try:
    from collections import OrderedDict  # noqa
except ImportError:
    # Python 2.6 needs this back-port
    install_requires.append('ordereddict')

setup(
    name='BitEnvoy',
    version='0.0.1',
    description=DESCRIPTION,
    long_description=LONG_DESCRIPTION,
    author='Arthur Burkart',
    author_email='artburkart@gmail.com',
    url='http://python-eve.org',
    license='MIT',
    platforms=['any'],
    packages=find_packages(),
    test_suite='bitenvoy.tests',
    install_requires=install_requires,
    tests_require=['behave==1.2.6.dev0', 'PyHamcrest==1.9.0'],
    cmdclass={
        'behave_test': behave_test
    },
    # tests_require=['redis', 'testfixtures'],
    classifiers=[
        'Development Status :: 1 - Planning',
        'Environment :: Web Environment',
        'Framework :: Flask',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.6',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
        'Topic :: Software Development :: Build Tools',
    ],
)
