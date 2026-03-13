# ProactiveHealth dbt Pipeline

A medallion architecture data pipeline built on a simulated Healthcare ERP system.
Raw source data flows through RAW → BASE → CUR layers using dbt and Snowflake.

---

## Project Overview

ProactiveHealth is a synthetic Healthcare ERP simulation covering the full hospital
workflow including patients, staff, appointments, billing, inventory, treatments,
and vendor management. This project demonstrates enterprise-grade data engineering
practices using a modern data stack.

---

## Architecture

RAW (Bronze) → BASE (Silver) → CUR (Gold)

- **RAW_EHP** — Source data loaded from CSV files as-is, all VARCHAR, no transformations
- **BASE_EHP** — Cleaned, typed, and validated staging models
- **CUR_EHP** — Wide denormalized marts serving analytical consumption patterns

---

## Tech Stack

- **Warehouse:** Snowflake
- **Transformation:** dbt Cloud
- **Orchestration:** Coming soon
- **Source Data:** 22-table Healthcare ERP, 1M+ records
- **Version Control:** GitHub

---

## Dataset

22 interconnected tables simulating a real hospital ERP system.
Generated using Python (Faker, NumPy).
Published on Kaggle: [ProactiveHealth Dataset](https://www.kaggle.com/datasets/moid1234/health-care-data-set-20-tables)

### Tables
| Table | Description |
|-------|-------------|
| RAW_EHP__PATN | Patient demographics and contact information |
| RAW_EHP__STFF | Staff roles and department assignments |
| RAW_EHP__APPT | Appointments between patients and staff |
| RAW_EHP__BILL | Billing details for visits and treatments |
| RAW_EHP__DIAG | Diagnosis information linked to patient visits |
| RAW_EHP__TRTM | Treatments administered to patients |
| RAW_EHP__MEDT | Medical teams assigned to patient visits |
| RAW_EHP__MDCN | Medicine types, forms, strength, and storage |
| RAW_EHP__TMMD | Medicine administration during visits |
| RAW_EHP__INSR | Insurance policies linked to patients |
| RAW_EHP__PMNT | Payments made by patients |
| RAW_EHP__VIST | Patient visit records |
| RAW_EHP__ROMS | Hospital rooms and department links |
| RAW_EHP__DPMT | Hospital departments |
| RAW_EHP__EQPM | Equipment status and location by department |
| RAW_EHP__SPLY | Supplies and inventory details |
| RAW_EHP__INVN | Daily inventory tracking and verification |
| RAW_EHP__PTAL | Patient allergy information |
| RAW_EHP__VNDR | Vendor information |
| RAW_EHP__VPMT | Vendor payments |
| RAW_EHP__MDBL | Medical bills |
| RAW_EHP__ALGY | Master allergy reference list |

---

## dbt Models

### RAW Layer
- Source tables loaded directly from CSV
- All columns VARCHAR
- No transformations applied

### BASE Layer
- Coming soon
- Type casting and column standardization
- Data quality tests
- Foreign key validation

### CUR Layer
- Coming soon
- Wide denormalized marts
- Business ready aggregations
- Optimized for analytical consumption

---

## Gold Layer Marts (Coming Soon)

| Mart | Description |
|------|-------------|
| CUR_PATIENT_VISIT_MART | Full patient visit details with diagnosis and treatment |
| CUR_BILLING_PAYMENTS_MART | Billing, payments, and insurance summary |
| CUR_INVENTORY_SUPPLIES_MART | Inventory levels and supply tracking |
| CUR_STAFF_DEPARTMENT_MART | Staff assignments and department overview |
| CUR_VENDOR_PAYMENTS_MART | Vendor performance and payment tracking |

---

## Data Quality Tests

Coming soon — dbt tests covering:
- Not null constraints
- Unique primary keys
- Accepted values
- Referential integrity between tables

---

## How to Run

Coming soon

---

## Entity Relationship Diagram

Coming soon

---

## Author

Moid Ahmed
- LinkedIn: linkedin.com/in/ask-moidahmed
- Email: moidahmed.work@gmail.com

---

## License

This project is for educational and portfolio purposes only.
All data is synthetic and does not represent real patients or medical information.
