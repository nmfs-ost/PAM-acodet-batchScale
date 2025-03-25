FROM python:3.11

WORKDIR /app

#copy and run python requirements
COPY requirements.txt /app
RUN pip install -r requirements.txt

#copy application files
COPY /acodet /app
COPY rclone.conf /app
COPY advanced_config.yml /app
COPY simple_config.yml /app
COPY run.py /app
COPY /tests /app

COPY entrypoint.sh /app

#run all tests during build
RUN pytest -v tests/*

#allow for execution of entrypoint script
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
