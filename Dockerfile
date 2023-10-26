FROM public.ecr.aws/docker/library/python:3.11.6-slim
COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.7.1 /lambda-adapter /opt/extensions/lambda-adapter

WORKDIR /apps
RUN pip install streamlit

# EXPOSE 8501
EXPOSE 8080

# HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

CMD ["streamlit", "hello", "--server.port", "8080" ]
