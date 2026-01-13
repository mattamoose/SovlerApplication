import os.path as dir
import matlab.engine as mle

''' configures the appropriate working directory. User must 
manually start/end the matlab instance.'''

def CONFIG_MATLAB():
  path = dir.join(dir.dirname(dir.dirname(__file__)),"\src")
 




