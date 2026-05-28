"""Quick verification that demo ballparks still match the data."""
from pathlib import Path
import pandas as pd

base = Path(__file__).resolve().parent.parent
ch = pd.read_csv(base / "demo_churns.csv", parse_dates=["churn_date"])
ca = pd.read_csv(base / "demo_calls.csv")
camp = pd.read_csv(base / "demo_campaigns.csv")
cust = pd.read_csv(base / "demo_customers.csv")

print("=== Sanity checks ===")

q1 = ch[(ch.churn_date >= "2026-01-01") & (ch.churn_date <= "2026-03-31")]
print(f"Q1 churn events (all types): {len(q1):,}")
print(f"Q1 unique churned: {q1.customer_id.nunique():,}")

vol_q1 = q1[q1.disconnect_type == "voluntary"].drop_duplicates("customer_id")
print(f"Q1 voluntary unique: {len(vol_q1):,}")

agg = camp.groupby(["channel", "group"]).agg(p=("prospects", "sum"), c=("connects", "sum")).reset_index()
agg["rate"] = agg.c / agg.p
print("Campaign rates:")
print(agg.to_string(index=False))

print(f"Repeat rate: {ca.is_repeat_7d.mean() * 100:.1f}%")
print(f"Annual calls (x2): {len(ca) * 2:,}")
saving = len(ca) * 2 * 0.05 * 8
print(f"5pp direct savings: ${saving:,.0f}")
