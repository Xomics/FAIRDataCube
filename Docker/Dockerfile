# Dockerfile VERSION = v0.3
# docker build -t casperdevisser/fdp_submission:$VERSION . 
# docker push casperdevisser/fdp_submission:$VERSION
# docker run -v ${PWD}:/work/ casperdevisser/fdp_submission:$VERSION

FROM continuumio/miniconda3

LABEL build_data="21-04-2022"
LABEL vendor="Radboudumc, CMBI"

WORKDIR /work

#Adding Jupyer notebook and installing conda environment
COPY environment.yml .
COPY run_papermill.py .
RUN conda install -c conda-forge mamba
RUN mamba env create -f environment.yml

CMD ["/bin/bash"]

#ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "fdp_submission", "python3", "run_papermill.py"]

#ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "fdp_submission", "jupyter", "notebook", "--notebook-dir=/work/", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]