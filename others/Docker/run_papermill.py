import papermill as pm
import sys

username_input = sys.argv[1]
password_input = sys.argv[2]

pm.inspect_notebook('FDP_submission.ipynb')

pm.execute_notebook(
   'FDP_submission.ipynb',
    'FDP_submission_out.ipynb',
   parameters=dict(username=username_input, password=password_input)
)

# TODO
# Add more parameters: jupyter notebook, excel file, fdp url etc.