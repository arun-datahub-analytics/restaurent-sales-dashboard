import pandas as pd

order_items = pd.read_csv("order_items.csv")

# Standardize column names
order_items.columns = order_items.columns.str.lower()

# Cleaning
order_items["quantity"] = order_items["quantity"].fillna(1)
order_items["price"] = order_items["price"].fillna(order_items["price"].median())

# Datatypes
order_items["quantity"] = order_items["quantity"].astype(int)
order_items["price"] = order_items["price"].astype(float)

# Export
order_items.to_csv("order_items_cleaned.csv", index=False)

print("✅ Cleaning completed successfully")
