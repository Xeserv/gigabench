import os
from unsloth import FastLanguageModel

max_seq_length = 4096
dtype = None # None for auto detection. Float16 for Tesla T4, V100, Bfloat16 for Ampere+
load_in_4bit = True # Use 4bit quantization to reduce memory usage. Can be False.
model_name = "Qwen/Qwen2.5-14B"

home_dir = os.getenv("HOME")
assert home_dir is not None, "HOME environment variable not set, is this environment sane?"

model, tokenizer = FastLanguageModel.from_pretrained(
    model_name = f"{home_dir}/models/{model_name}",
    max_seq_length = max_seq_length,
    dtype = dtype,
    load_in_4bit = load_in_4bit,
)
