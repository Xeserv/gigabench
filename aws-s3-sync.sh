#!/usr/bin/env bash

aws s3 sync s3://${BUCKET_NAME}/models/${MODEL_NAME} ~/models/${MODEL_NAME}
python inline-test.py