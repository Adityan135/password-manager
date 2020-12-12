FROM python:3.6

# Create app directory
WORKDIR /app

# Install app dependencies
ADD common ./common
ADD entries ./entries
ADD manager ./manager
ADD users ./users
ENV SECRET_KEY MY_SECRET_KEY
ADD requirements.txt ./
ADD manage.py ./
ADD db.sqlite3 ./

RUN pip install -r requirements.txt

ENV SECRET_KEY MY_SECRET_KEY

EXPOSE 1337
CMD [ "python", "manage.py", "runserver", "0.0.0.0:1337" ]
# CMD ['bash']