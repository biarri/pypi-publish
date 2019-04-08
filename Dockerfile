FROM python:3-alpine

WORKDIR .
COPY . .
RUN pip3 install --no-cache-dir twine

ENTRYPOINT ["twine"]
CMD ["upload", "dist/*"]
