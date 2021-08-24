# Firepower First Responder Script

TAC provides a Firepower First Responder script (python) which can be used to create and upload a troubleshooting file to your TAC case.

## Compatibility with Python 3.x and Firepower 7.0

It appears that the first responder script is broken for firepower 7.0 due to the use of python 3.x exclusively. 
This can be fixed by making a couple changes to the TAC-provided script.

* Download the script locally somewhere like `/Volume/home/admin/firepower.py`
* Run the automated python `2to3` command on the script first
  * `2to3 -w firepower.py`
* Edit line 202 to remove the binary `b` option for file open (text-file)
  * `file_handler = open(file_path, 'w+')`
* Edit line 232 to set the `sf_troubleshoot.pl` output-mode to `text`
  * `'sf_troubleshoot.pl', stderr=subprocess.DEVNULL,text=True).split('created at ')[1].strip()`

With the above changes, the first-responder script should run properly.
