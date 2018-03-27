# waves.py
# Eryn Wells <eryn@erynwells.me>
'''
Several functions for creating audio waves.
'''

import numpy as np

__default_num_harmonics = 10

def sine(domain, freq=1.0):
    '''Render a sine wave in the given domain with the specified frequency.'''
    return np.sin(2.0 * np.pi * freq * domain)

def saw(domain, freq=1.0, num_harmonics=__default_num_harmonics):
    '''
    Render a saw wave in the given domain at the specified frequency.

    This function produces a saw wave by computing the first `harmonics` terms of the
    infinite series defining its shape.
    '''
    harmonics = np.asarray([1.0 / h * sine(domain, freq=freq * h) for h in range(1, num_harmonics)])
    wave = np.sum(harmonics, axis=0)
    return wave

def square(domain, freq=1, num_harmonics=__default_num_harmonics):
    '''
    Render a square wave in the given domain at the specified frequency.

    This function produces a saw wave by computing the first `harmonics` terms of the
    infinite series defining its shape.
    '''
    harmonics = np.asarray([1.0 / h * sine(domain, freq=freq * h) for h in range(1, num_harmonics, 2)])
    wave = np.sum(harmonics, axis=0)
    return wave

def triangle(domain, freq=1, num_harmonics=__default_num_harmonics):
    '''
    Render a triangle wave in the given domain at the specified frequency.

    This function produces a saw wave by computing the first `num_harmonics` terms of the
    infinite series defining its shape.
    '''
    def label(i):
        return 2.0 * i + 1.0
    harmonics = np.asarray([((-1) ** h) * (label(h) ** -2) * sine(domain, freq=freq * label(h)) for h in
        range(num_harmonics)])
    wave = np.sum(harmonics, axis=0)
    return wave
