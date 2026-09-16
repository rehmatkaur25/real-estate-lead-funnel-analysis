-- Real Estate Lead Funnel & Agent Performance Analysis
-- All queries run against real_estate.db (SQLite)

-- 1. Overall conversion rate
SELECT
    COUNT(*) AS total_leads,
    SUM(closed) AS closed_leads,
    ROUND(100.0 * SUM(closed) / COUNT(*), 2) AS conversion_rate_pct
FROM leads;

-- 2. Conversion rate by lead source
SELECT
    lead_source,
    COUNT(*) AS total_leads,
    SUM(closed) AS closed_leads,
    ROUND(100.0 * SUM(closed) / COUNT(*), 2) AS conversion_rate_pct
FROM leads
GROUP BY lead_source
ORDER BY conversion_rate_pct DESC;

-- 3. Agent leaderboard: conversion rate and avg days to close
SELECT
    agent_name,
    COUNT(*) AS total_leads,
    SUM(closed) AS closed_leads,
    ROUND(100.0 * SUM(closed) / COUNT(*), 2) AS conversion_rate_pct,
    ROUND(AVG(days_to_close), 1) AS avg_days_to_close
FROM leads
GROUP BY agent_name
ORDER BY conversion_rate_pct DESC;

-- 4. Commission earned per agent
SELECT
    agent_name,
    COUNT(*) AS closed_deals,
    ROUND(SUM(commission_amount), 2) AS total_commission,
    ROUND(AVG(commission_amount), 2) AS avg_commission_per_deal
FROM leads
WHERE closed = 1
GROUP BY agent_name
ORDER BY total_commission DESC;

-- 5. At-risk leads (stalled >21 days, not closed)
SELECT
    lead_id,
    agent_name,
    lead_source,
    funnel_stage,
    days_since_last_contact,
    listing_price
FROM leads
WHERE at_risk_lead = 1
ORDER BY days_since_last_contact DESC;

-- 6. Conversion by property type and neighborhood
SELECT
    property_type,
    neighborhood,
    COUNT(*) AS total_leads,
    SUM(closed) AS closed_leads,
    ROUND(100.0 * SUM(closed) / COUNT(*), 2) AS conversion_rate_pct
FROM leads
GROUP BY property_type, neighborhood
ORDER BY conversion_rate_pct DESC;

-- 7. Lost-reason breakdown
SELECT
    lost_reason,
    COUNT(*) AS lead_count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM leads WHERE closed = 0), 2) AS pct_of_lost_leads
FROM leads
WHERE closed = 0
GROUP BY lost_reason
ORDER BY lead_count DESC;
