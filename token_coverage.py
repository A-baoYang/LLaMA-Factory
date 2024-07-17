from transformers import AutoTokenizer

# Load the model's tokenizer
model_name = "Yi-1.5-9B-Chat"
tokenizer = AutoTokenizer.from_pretrained(model_name)

# Sample dataset
dataset = ["This is a sample sentence.", "Token coverage calculation example."]

# Tokenize the dataset
all_tokens = []
for sentence in dataset:
    tokens = tokenizer.tokenize(sentence)
    all_tokens.extend(tokens)

# Total number of tokens in the dataset
total_tokens = len(all_tokens)

# Number of tokens in the vocabulary
vocab_tokens = [token for token in all_tokens if token in tokenizer.vocab]

# Number of tokens covered by the vocabulary
covered_tokens = len(vocab_tokens)

# Calculate token coverage
token_coverage = (covered_tokens / total_tokens) * 100

print(f"Token Coverage: {token_coverage:.2f}%")