# Real Estate Lead Funnel — Data Dictionary

**File:** `real_estate_leads.csv` (1,800 rows)
**Period simulated:** Jan–Dec 2025
**Overall close rate:** ~10%

| Column | Description |
|---|---|
| lead_id | Unique lead identifier |
| lead_created_date | Date the lead entered the pipeline |
| lead_source | Referral, Zillow, Website, Walk-in, Social Media, Open House |
| agent_id / agent_name | Assigned agent (15-agent roster, see `agents_roster.csv`) |
| property_type | Single Family, Condo, Townhouse, Multi-Family |
| neighborhood | One of 8 zones, each with its own price multiplier |
| listing_price | Property price associated with the lead |
| funnel_stage | Current/final stage: Lead (Uncontacted) → Contacted → Showing Scheduled → Showing Completed → Offer Made → Closed |
| closed | Boolean — whether the lead converted to a closed sale |
| close_date | Date closed (if closed) |
| days_to_close | Days from lead creation to close |
| commission_rate | 2.8% flat rate applied on closes |
| commission_amount | listing_price × commission_rate |
| lost_reason | Why a non-closed lead stalled (price, competitor, financing, went cold, in progress, changed mind) |
| days_since_last_contact | Days since the lead was last touched |
| at_risk_lead | True if stalled >21 days and not yet closed — flags leads needing follow-up |

## Built-in patterns (intentional, for realistic analysis)
- Referral and Open House leads convert ~2–3x better than Zillow/Social Media
- Higher-priced properties have slightly lower conversion (price friction)
- Agent skill varies (0–1 score, hidden signal) — shows up as differing conversion and days-to-close by agent
- ~11% of leads are never contacted at all — a visible operational gap

## Suggested next steps
1. Load into SQL (or Postgres/SQLite) and write funnel/conversion queries by source and agent
2. Build the Power BI dashboard: funnel chart, agent leaderboard, lead-source ROI, at-risk lead list
3. Use `agents_roster.csv` as a lookup table to practice joins
