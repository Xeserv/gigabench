#!/usr/bin/env bash

s5cmd --credentials-file ~/.aws/credentials --endpoint-url https://fly.storage.tigris.dev sync s3://${BUCKET_NAME}/models/${MODEL_NAME}/'*' ~/models/${MODEL_NAME} >> s5cmd.log
python inline-test.py