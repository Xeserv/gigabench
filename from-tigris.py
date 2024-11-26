#!/usr/bin/env python

import os

from unsloth import FastLanguageModel

max_seq_length = 4096
dtype = None # None for auto detection. Float16 for Tesla T4, V100, Bfloat16 for Ampere+
load_in_4bit = False # Use 4bit quantization to reduce memory usage. Can be False.

dataset_name = os.getenv("DATASET_NAME")
assert dataset_name is not None

model_name = os.getenv("MODEL_NAME")
assert model_name is not None

home_dir = os.getenv("HOME")
assert home_dir is not None

model, tokenizer = FastLanguageModel.from_pretrained(
    model_name = f"{home_dir}/tigris/models/{model_name}",
    max_seq_length = max_seq_length,
    dtype = dtype,
    load_in_4bit = load_in_4bit,
)