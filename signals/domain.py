# domain.py
# Eryn Wells <eryn@erynwells.me>
'''
Some utilities for dealing with signal domains: time, frequency, etc.
'''

import numpy as np

__default_time = 2.0
__default_steps = 200

class Time:
    __DefaultTime = 2.0
    __DefaultSteps = 200

    def __init__(self, sec=__DefaultTime, samples=__DefaultSteps):
        self.sec = sec
        self.samples = samples
        self._domain = None

    @property
    def domain(self):
        # TODO: This a really dumb hack around numpy arrays not supporting None testing. There must be a better way...
        try:
            self._domain.size
        except AttributeError:
            self._domain = np.linspace(0, self.sec, num=self.samples + 1)
        finally:
            return self._domain

    @property
    def rate(self):
        '''Number of samples per second, in Hertz.'''
        return self.samples / self.sec

    @property
    def interval(self):
        '''Amount of time between samples, in seconds.'''
        return self.sec / self.samples

    def __str__(self):
        return repr(self)

    def __repr__(self):
        return '{}(sec={}, samples={})'.format(self.__class__.__name__, self.sec, self.samples)
