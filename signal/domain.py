
import numpy as np

__default_time = 2.0
__default_steps = 200

class Time:
    __DefaultTime = 2.0
    __DefaultSteps = 200

    def __init__(self, sec=Time.__DefaultTime, samples=Time.__DefaultSteps):
        self.sec = sec
        self.samples = samples
        self._domain = None

    @property
    def domain(self):
        if self._domain == None:
            self._domain = np.linspace(0, self.sec, num=self.samples + 1)
        return self._domain

    @property
    def rate(self):
        '''Number of samples per second.'''
        return self.samples / self.sec

    @property
    def interval(self):
        '''Amount of time between samples, in seconds.'''
        return self.sec / self.samples
