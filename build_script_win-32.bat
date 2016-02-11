ECHO ON
SET PYTHON_VERSION=2.7.10
%CMD_IN_ENV% conda build -q --python 2.7 1.10 recipe

SET PYTHON_VERSION=3.3.x
%CMD_IN_ENV% conda build -q --python 3.3 recipe 

SET PYTHON_VERSION=3.4.x
%CMD_IN_ENV% conda build -q --python 3.4 recipe 

SET PYTHON_VERSION=3.5.x
%CMD_IN_ENV% conda build -q --python 3.5 recipe
