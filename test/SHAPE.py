import matlab.engine as mle
import pytest as pt
import path_config


path_config.CONFIG_MATLAB()
eng = mle.start_matlab()

eng.SHAPE([1,1,1],)








mle.quit()