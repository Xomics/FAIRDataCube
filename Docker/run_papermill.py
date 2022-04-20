import papermill as pm

pm.inspect_notebook('FDP_submission.ipynb')

pm.execute_notebook(
   'FDP_submission.ipynb',
    'FDP_submission_out.ipynb',
   parameters=dict(username='example@example.com', password='password')
)