FROM python:3.8

WORKDIR /usr/src/script
COPY ./ /usr/src/script
RUN pip install -r  /usr/src/script/requirements.txt
CMD ["python", "/usr/src/script/main.py"]
