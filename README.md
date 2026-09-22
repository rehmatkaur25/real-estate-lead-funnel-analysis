# Real Estate Lead Funnel & Agent Performance Analysis

A Data/Business Analyst portfolio project analyzing a real-estate brokerage's lead pipeline — where leads come from, which agents convert best, and why deals are lost — built for a Century 21-style brokerage context.

## Headline finding

**39% of lost leads were lost to follow-up failure** (went cold + never contacted) — more than price objections and losing to a competitor combined. The biggest lever on conversion is process discipline, not pricing strategy.

## Stack

- **SQLite** — structured storage, 1,800 leads / 15 agents / 6 lead sources
- **SQL** — funnel, agent, commission, at-risk, and lost-reason analysis (see `sql/queries.sql`)
- **Power BI** — 4-page interactive dashboard (Overview, Agent Leaderboard, At-Risk Leads, Lost Reasons)
- **Word** — 1-page business case study summarizing findings and recommendations

## Repo structure

    data/
      real_estate_leads.csv          - raw lead-level dataset (1,800 rows)
      agents_roster.csv              - agent lookup table
      real_estate.db                 - SQLite database (leads + agents_roster tables)
    sql/
      queries.sql                    - all 7 core analysis queries
    dashboard/
      Real_Estate_Lead_Funnel.pbix   - Power BI dashboard (4 pages)
    docs/
      data_dictionary.md             - schema and column definitions
      Real_Estate_Case_Study.docx    - 1-page written findings & recommendation
      BRD_Lead_Funnel_Dashboard.pdf  - Business Requirements Document (scope, stakeholders, functional requirements, acceptance criteria)
      jira-board.jpeg                - Jira backlog (epics, user stories, acceptance criteria) tracking project delivery

## Key metrics

| Metric | Value |
|---|---|
| Total leads | 1,800 |
| Closed deals | 179 |
| Overall conversion rate | 9.94% |
| Top lead source (by conversion) | Referral — 16.46% |
| Weakest lead source (highest volume) | Zillow — 6.15% conversion, 439 leads |
| Top agent | Sneha Rao — 22.47% conversion, $432K commission |
| Leads lost to follow-up failure | 39% |

## Process

Requirements were gathered and documented in a BRD before the dashboard was built — defining scope, stakeholders, and functional requirements with Given/When/Then acceptance criteria. Delivery was tracked using a Jira Kanban board (epics → user stories → acceptance criteria). See `docs/BRD_Lead_Funnel_Dashboard.pdf` and `docs/jira-board.jpeg`.

## Note on the data

The lead-level dataset is synthetically generated with realistic, intentional patterns (referral leads convert better, higher-priced listings show price friction, agent skill varies) rather than scraped from a real brokerage, since brokerage-level lead data isn't public. See `docs/data_dictionary.md` for the generation logic and column definitions.

## Author

Rehmat Kaur
