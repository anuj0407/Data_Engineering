"""
Numeric Pattern Dataset Generator
----------------------------------
Simple, clean numeric dataset:
  - 12 numeric features
  - 1 continuous Target column
  - 10,000 rows
"""

import numpy as np
import pandas as pd
from faker import Faker

RANDOM_SEED = 42
N_SAMPLES = 10000
N_FEATURES = 12

rng = np.random.default_rng(RANDOM_SEED)
Faker.seed(RANDOM_SEED)
fake = Faker()

data = {}
for i in range(1, N_FEATURES + 1):
    data[f"Feature_{i}"] = rng.normal(
        loc=rng.uniform(-20, 20),
        scale=rng.uniform(2, 10),
        size=N_SAMPLES,
    )

df = pd.DataFrame(data)

# Continuous Target: weighted combination of a few features + noise
df["Target"] = (
    2.5 * df["Feature_1"]
    - 1.5 * df["Feature_2"]
    + 3.0 * df["Feature_3"]
    + 0.8 * df["Feature_4"]
    + rng.normal(0, 5.0, N_SAMPLES)
)

df.to_csv("numeric_pattern.csv", index=False)
print(f"Saved numeric_pattern.csv - shape: {df.shape}")
print(df.head())

